Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A3A89010
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2020 12:16:53 +0000 (UTC)
Date: Fri, 14 Feb 2020 14:16:50 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200214121650.GA25209@platvala-desk.ger.corp.intel.com>
References: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
 <20200212132232.108674-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212132232.108674-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/9] runner: Abort the run when test
 exits with IGT_EXIT_ABORT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 03:22:32PM +0200, Arkadiusz Hiler wrote:
> Now that the IGT tests have a mechanism for signaling broken testing
> conditions we can stop the run on the first test that has noticed it,
> and possibly has triggered that state.
> 
> Traditionally run would have continued with that test failing and the
> side effects would trickle down into the other tests causing a lot of
> skip/fails.
> 
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  runner/executor.c                             |   3 +
>  .../aborted-after-a-test/reference.json       |   6 +
>  .../aborted-on-boot/reference.json            |   6 +
>  .../dmesg-escapes/reference.json              |   3 +
>  .../dmesg-results/reference.json              |   5 +
>  .../reference.json                            |   3 +
>  .../reference.json                            |   3 +
>  .../dmesg-warn-level/reference.json           |   3 +
>  .../reference.json                            |   3 +
>  .../dynamic-subtests/reference.json           |   3 +
>  .../reference.json                            |   5 +
>  .../json_tests_data/normal-run/reference.json |   5 +
>  .../reference.json                            |   4 +
>  .../notrun-results/reference.json             |   5 +
>  .../piglit-style-dmesg/reference.json         |   5 +
>  .../unprintable-characters/reference.json     |   5 +-
>  .../warnings-with-dmesg-warns/reference.json  |   5 +
>  .../json_tests_data/warnings/reference.json   |   5 +

Ahh, the joys of top-down testing.



> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 105ec887..5e72db9a 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -645,6 +645,16 @@ static void process_dynamic_subtest_output(const char *piglit_name,
>  					     &dynresulttext, &dyntime,
>  					     dyn_result_idx < 0 ? NULL : matches.items[dyn_result_idx].where,
>  					     dynend);
> +
> +			if (!strcmp(dynresulttext, "incomplete")) {
> +				struct json_object *parent_subtest;
> +
> +				if (json_object_object_get_ex(tests, piglit_name, &parent_subtest) &&
> +				    json_object_object_get_ex(parent_subtest, "result", &parent_subtest) &&
> +				    !strcmp(json_object_get_string(parent_subtest), "abort"))
> +					dynresulttext = "abort";
> +			}
> +

Fairly self-explanatory but could use a comment explaining what is
done when and why.


>  			set_result(current_dynamic_test, dynresulttext);
>  			set_runtime(current_dynamic_test, dyntime);
>  		}
> @@ -1078,6 +1088,8 @@ static const char *result_from_exitcode(int exitcode)
>  		return "pass";
>  	case IGT_EXIT_INVALID:
>  		return "skip";
> +	case IGT_EXIT_ABORT:
> +		return "abort";
>  	case INCOMPLETE_EXITCODE:
>  		return "incomplete";
>  	default:
> @@ -1154,6 +1166,18 @@ static void fill_from_journal(int fd,
>  		}
>  	}
>  
> +	if (subtests->size && exitcode == IGT_EXIT_ABORT)
> +	{


Your { slipped down from the end of the line.


> +		char *last_subtest = subtests->subs[subtests->size - 1].name;
> +		char subtest_piglit_name[256];
> +		struct json_object *subtest_obj;
> +
> +		generate_piglit_name(entry->binary, last_subtest, subtest_piglit_name, sizeof(subtest_piglit_name));
> +		subtest_obj = get_or_create_json_object(tests, subtest_piglit_name);
> +
> +		set_result(subtest_obj, "abort");
> +	}
> +
>  	if (subtests->size == 0) {
>  		char *subtestname = NULL;
>  		char piglit_name[256];
> @@ -1297,6 +1321,7 @@ static struct json_object *get_totals_object(struct json_object *totals,
>  	json_object_object_add(obj, "dmesg-warn", json_object_new_int(0));
>  	json_object_object_add(obj, "skip", json_object_new_int(0));
>  	json_object_object_add(obj, "incomplete", json_object_new_int(0));
> +	json_object_object_add(obj, "abort", json_object_new_int(0));
>  	json_object_object_add(obj, "timeout", json_object_new_int(0));
>  	json_object_object_add(obj, "notrun", json_object_new_int(0));
>  	json_object_object_add(obj, "fail", json_object_new_int(0));
> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> index dd590f33..701da1a5 100644
> --- a/runner/runner_tests.c
> +++ b/runner/runner_tests.c
> @@ -28,9 +28,16 @@ static const char testdatadir[] = TESTDATA_DIRECTORY;
>   * that test binaries without subtests should still be counted as one
>   * for this macro.
>   */
> -#define NUM_TESTDATA_SUBTESTS 6
> +#define NUM_TESTDATA_SUBTESTS 15
> +#define NUM_TESTDATA_ABORT_SUBTESTS 9
>  /* The total number of test binaries in runner/testdata/ */
> -#define NUM_TESTDATA_BINARIES 4
> +#define NUM_TESTDATA_BINARIES 8
> +
> +static void igt_assert_no_result_for(struct json_object *tests, const char* testname)
> +{
> +	struct json_object *obj;
> +	igt_assert(!json_object_object_get_ex(tests, testname, &obj));
> +}
>  
>  static const char *igt_get_result(struct json_object *tests, const char* testname)
>  {
> @@ -941,6 +948,7 @@ igt_main
>  			struct execute_state state;
>  			const char *argv[] = { "runner",
>  					       "--dry-run",
> +					       "-x", "^abort",
>  					       testdatadir,
>  					       dirname,
>  			};
> @@ -951,7 +959,7 @@ igt_main
>  			igt_assert(initialize_execute_state(&state, settings, list));
>  			igt_assert_eq(state.next, 0);
>  			igt_assert(state.dry);
> -			igt_assert_eq(list->size, NUM_TESTDATA_SUBTESTS);
> +			igt_assert_eq(list->size, NUM_TESTDATA_SUBTESTS - NUM_TESTDATA_ABORT_SUBTESTS);
>  
>  			igt_assert_f((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0,
>  				     "Dry run initialization didn't create the results directory.\n");
> @@ -972,7 +980,7 @@ igt_main
>  			igt_assert(initialize_execute_state_from_resume(dirfd, &state, settings, list));
>  			igt_assert_eq(state.next, 0);
>  			igt_assert(!state.dry);
> -			igt_assert_eq(list->size, NUM_TESTDATA_SUBTESTS);
> +			igt_assert_eq(list->size, NUM_TESTDATA_SUBTESTS - NUM_TESTDATA_ABORT_SUBTESTS);
>  			/* initialize_execute_state_from_resume() closes the dirfd */
>  			igt_assert_f((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0,
>  				     "Dry run resume somehow deleted the results directory.\n");
> @@ -1499,7 +1507,7 @@ igt_main
>  			struct execute_state state;
>  			struct json_object *results, *tests;
>  			const char *argv[] = { "runner",
> -					       "-t", "dynamic",
> +					       "-t", "^dynamic$",
>  					       testdatadir,
>  					       dirname,
>  			};
> @@ -1528,6 +1536,291 @@ igt_main
>  		}
>  	}
>  
> +	igt_subtest_group {
> +		struct job_list *list = malloc(sizeof(*list));
> +		volatile int dirfd = -1;
> +		char dirname[] = "tmpdirXXXXXX";
> +
> +		igt_fixture {
> +			igt_require(mkdtemp(dirname) != NULL);
> +			rmdir(dirname);
> +
> +			init_job_list(list);
> +		}
> +
> +		igt_subtest("execute-abort-simple") {
> +			struct execute_state state;
> +			struct json_object *results, *tests;
> +			const char *argv[] = { "runner",
> +					       "-t", "^abort-simple$",
> +					       testdatadir,
> +					       dirname,
> +			};
> +
> +			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
> +			igt_assert(create_job_list(list, settings));
> +			igt_assert(initialize_execute_state(&state, settings, list));
> +			igt_assert(!execute(&state, settings, list)); /* false = signal abort */
> +
> +			igt_assert_f((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0,
> +				     "Execute didn't create the results directory\n");
> +			igt_assert_f((results = generate_results_json(dirfd)) != NULL,
> +				     "Results parsing failed\n");
> +
> +			igt_assert(json_object_object_get_ex(results, "tests", &tests));
> +
> +			igt_assert_eqstr(igt_get_result(tests, "igt@abort-simple"), "abort");
> +
> +			igt_assert_eq(json_object_put(results), 1);
> +		}
> +
> +		igt_fixture {
> +			close(dirfd);
> +			clear_directory(dirname);
> +			free_job_list(list);
> +		}
> +	}
> +
> +	igt_subtest_group {
> +		struct job_list *list = malloc(sizeof(*list));
> +		volatile int dirfd = -1;
> +
> +

Extra empty line here.


> +		for (int multiple = 0; multiple <= 1; ++multiple) {
> +			char dirname[] = "tmpdirXXXXXX";
> +
> +			igt_fixture {
> +				igt_require(mkdtemp(dirname) != NULL);
> +				rmdir(dirname);
> +
> +				init_job_list(list);
> +			}
> +
> +			igt_subtest_f("execute-abort%s", multiple ? "-multiple" : "") {
> +				struct execute_state state;
> +				struct json_object *results, *tests;
> +				const char *argv[] = { "runner",
> +						       "-t", "^abort$",
> +						       multiple ? "--multiple-mode" : "--sync",
> +						       testdatadir,
> +						       dirname,
> +				};
> +
> +				igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
> +				igt_assert(create_job_list(list, settings));
> +				igt_assert(initialize_execute_state(&state, settings, list));
> +				igt_assert(!execute(&state, settings, list)); /* false = signal abort */
> +
> +				igt_assert_f((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0,
> +					     "Execute didn't create the results directory\n");
> +				igt_assert_f((results = generate_results_json(dirfd)) != NULL,
> +					     "Results parsing failed\n");
> +
> +				igt_assert(json_object_object_get_ex(results, "tests", &tests));
> +
> +				igt_assert_eqstr(igt_get_result(tests, "igt@abort@a-subtest"), "pass");
> +				igt_assert_eqstr(igt_get_result(tests, "igt@abort@b-subtest"), "abort");
> +
> +				if (multiple) /* no notrun injection for multiple mode */
> +					igt_assert_no_result_for(tests, "igt@abort@c-subtest");
> +				else
> +					igt_assert_eqstr(igt_get_result(tests, "igt@abort@c-subtest"), "notrun");
> +
> +				igt_assert_eq(json_object_put(results), 1);
> +			}
> +
> +			igt_fixture {
> +				close(dirfd);
> +				clear_directory(dirname);
> +				free_job_list(list);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_group {
> +		struct job_list *list = malloc(sizeof(*list));
> +		volatile int dirfd = -1;
> +
> +		for (int multiple = 0; multiple <= 1; ++multiple) {
> +			char dirname[] = "tmpdirXXXXXX";
> +
> +			igt_fixture {
> +				igt_require(mkdtemp(dirname) != NULL);
> +				rmdir(dirname);
> +
> +				init_job_list(list);
> +			}
> +
> +			igt_subtest_f("execute-abort-fixture%s", multiple ? "-multiple" : "") {
> +				struct execute_state state;
> +				struct json_object *results, *tests;
> +				const char *argv[] = { "runner", multiple ? "--multiple-mode" : "--sync",
> +						       "-t", "^abort-fixture$",
> +						       testdatadir,
> +						       dirname,
> +				};
> +
> +				igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
> +				igt_assert(create_job_list(list, settings));
> +				igt_assert(initialize_execute_state(&state, settings, list));
> +				igt_assert(!execute(&state, settings, list)); /* false = signal abort */
> +
> +				igt_assert_f((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0,
> +					     "Execute didn't create the results directory\n");
> +				igt_assert_f((results = generate_results_json(dirfd)) != NULL,
> +					     "Results parsing failed\n");
> +
> +				igt_assert(json_object_object_get_ex(results, "tests", &tests));
> +
> +				if (multiple) {
> +					/*
> +					 * running the whole binary via -t, no
> +					 * way of blaming the particular subtest
> +					 */
> +					igt_assert_eqstr(igt_get_result(tests, "igt@abort-fixture"), "abort");
> +					igt_assert_no_result_for(tests, "igt@abort-fixture@a-subtest");
> +					igt_assert_no_result_for(tests, "igt@abort-fixture@b-subtest");
> +				} else {
> +					igt_assert_eqstr(igt_get_result(tests, "igt@abort-fixture@a-subtest"), "abort");
> +					igt_assert_eqstr(igt_get_result(tests, "igt@abort-fixture@b-subtest"), "notrun");
> +				}
> +
> +				igt_assert_eq(json_object_put(results), 1);
> +			}
> +
> +			igt_fixture {
> +				close(dirfd);
> +				clear_directory(dirname);
> +				free_job_list(list);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_group {
> +		struct job_list *list = malloc(sizeof(*list));
> +		volatile int dirfd = -1;
> +
> +		for (int multiple = 0; multiple <= 1; ++multiple) {
> +			char dirname[] = "tmpdirXXXXXX";
> +			char filename[] = "tmplistXXXXXX";
> +			const char testlisttext[] = "igt@abort-fixture@b-subtest\n"
> +				"igt@abort-fixture@a-subtest\n";
> +
> +			igt_fixture {
> +				int fd;
> +				igt_require((fd = mkstemp(filename)) >= 0);
> +				igt_require(write(fd, testlisttext, strlen(testlisttext)) == strlen(testlisttext));
> +				close(fd);
> +				igt_require(mkdtemp(dirname) != NULL);
> +				rmdir(dirname);
> +
> +				init_job_list(list);
> +			}
> +
> +			igt_subtest_f("execute-abort-fixture-testlist%s", multiple ? "-multiple" : "") {
> +				struct execute_state state;
> +				struct json_object *results, *tests;
> +				const char *argv[] = { "runner", multiple ? "--multiple-mode" : "--sync",
> +						       "--test-list", filename,
> +						       testdatadir,
> +						       dirname,
> +				};
> +
> +				igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
> +				igt_assert(create_job_list(list, settings));
> +				igt_assert(initialize_execute_state(&state, settings, list));
> +				igt_assert(!execute(&state, settings, list)); /* false = signal abort */
> +
> +				igt_assert_f((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0,
> +					     "Execute didn't create the results directory\n");
> +				igt_assert_f((results = generate_results_json(dirfd)) != NULL,
> +					     "Results parsing failed\n");
> +
> +				igt_assert(json_object_object_get_ex(results, "tests", &tests));
> +
> +				if (multiple) /* multiple mode = no notruns */
> +					igt_assert_no_result_for(tests, "igt@abort-fixture@a-subtest");
> +				else
> +					igt_assert_eqstr(igt_get_result(tests, "igt@abort-fixture@a-subtest"), "notrun");
> +
> +
> +				igt_assert_eqstr(igt_get_result(tests, "igt@abort-fixture@b-subtest"), "abort");
> +
> +				igt_assert_eq(json_object_put(results), 1);
> +			}
> +
> +			igt_fixture {
> +				unlink(filename);
> +				close(dirfd);
> +				clear_directory(dirname);
> +				free_job_list(list);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_group {
> +		struct job_list *list = malloc(sizeof(*list));
> +		volatile int dirfd = -1;
> +
> +		for (int multiple = 0; multiple <= 1; ++multiple) {
> +			char dirname[] = "tmpdirXXXXXX";
> +
> +			igt_fixture {
> +				igt_require(mkdtemp(dirname) != NULL);
> +				rmdir(dirname);
> +
> +				init_job_list(list);
> +			}
> +
> +			igt_subtest_f("execute-abort-dynamic%s", multiple ? "-multiple" : "") {
> +				struct execute_state state;
> +				struct json_object *results, *tests;
> +				const char *argv[] = { "runner", multiple ? "--multiple-mode" : "--sync",
> +						       "-t", "^abort-dynamic$",
> +						       testdatadir,
> +						       dirname,
> +				};
> +
> +				igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
> +				igt_assert(create_job_list(list, settings));
> +				igt_assert(initialize_execute_state(&state, settings, list));
> +				igt_assert(!execute(&state, settings, list)); /* false = signal abort */
> +
> +				igt_assert_f((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0,
> +					     "Execute didn't create the results directory\n");
> +				igt_assert_f((results = generate_results_json(dirfd)) != NULL,
> +					     "Results parsing failed\n");
> +
> +				igt_assert(json_object_object_get_ex(results, "tests", &tests));
> +
> +				/* { */
> +				/* 	const char *json_string; */
> +				/* 	json_string = json_object_to_json_string_ext(tests, JSON_C_TO_STRING_PRETTY); */
> +				/* 	printf("****\n%s\n***\n", json_string); */
> +				/* } */

New phone, who dis?


Cosmetic editorial comments only, with those addressed,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
