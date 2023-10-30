Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296CE10E2B4
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 12:47:58 +0000 (UTC)
Date: Mon, 30 Oct 2023 13:47:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231030124740.svewdqts7um4r2yy@kamilkon-desk.igk.intel.com>
References: <20231030095206.108025-1-mauro.chehab@linux.intel.com>
 <20231030095206.108025-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231030095206.108025-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/7] runner/runner_tests: Unit tests
 for binary-name-only testlist entries
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,
On 2023-10-30 at 10:49:57 +0100, Mauro Carvalho Chehab wrote:
> From: Petri Latvala <adrinael@adrinael.net>

While it is ok to ignore here checkpatch.pl warnings/errors
(it keeps original code style and errors are are for 'char**' only)
imho here it would help to add at least one sentance with desciption.

With or without expanding description:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Petri Latvala <adrinael@adrinael.net>
> ---
>  runner/runner_tests.c | 70 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> index a7e968f85b91..e6024de11a60 100644
> --- a/runner/runner_tests.c
> +++ b/runner/runner_tests.c
> @@ -1810,6 +1810,76 @@ igt_main
>  		}
>  	}
>  
> +	igt_subtest_group {
> +		const char testlisttext[] = "igt@successtest";
> +		const char blocktext[] = "igt@successtest@first";
> +		struct job_list *list = malloc(sizeof(*list));
> +		volatile int dirfd = -1;
> +		char dirname[] = "tmpdirXXXXXX";
> +		volatile int listfd;
> +		volatile int blockfd;
> +		char listfilename[] = "tmplistXXXXXX";
> +		char blockfilename[] = "tmpblockXXXXXX";
> +
> +		igt_fixture {
> +			igt_require(mkdtemp(dirname) != NULL);
> +			rmdir(dirname);
> +
> +			igt_require((listfd = mkstemp(listfilename)) >= 0);
> +			igt_require(write(listfd, testlisttext, strlen(testlisttext)) == strlen(testlisttext));
> +			igt_require((blockfd = mkstemp(blockfilename)) >= 0);
> +			igt_require(write(blockfd, blocktext, strlen(blocktext)) == strlen(blocktext));
> +			close(listfd);
> +			close(blockfd);
> +
> +			init_job_list(list);
> +		}
> +
> +		igt_subtest("only-binary-name-in-testlist") {
> +			const char *argv[] = { "runner",
> +				"--allow-non-root",
> +				"--test-list", listfilename,
> +				testdatadir,
> +				dirname,
> +			};
> +
> +			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
> +
> +			igt_assert(create_job_list(list, settings));
> +			/* No multi-mode, binary has two subtests, should be normalized to have individual subtests */
> +			igt_assert_eq(list->size, 2);
> +			igt_assert_eq(list->entries[0].subtest_count, 1);
> +			igt_assert_eq(list->entries[1].subtest_count, 1);
> +		}
> +
> +		igt_subtest("only-binary-name-in-testlist-with-blocks") {
> +			const char *argv[] = { "runner",
> +				"--allow-non-root",
> +				"--test-list", listfilename,
> +				"-b", blockfilename,
> +				testdatadir,
> +				dirname,
> +			};
> +
> +			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
> +
> +			igt_assert(create_job_list(list, settings));
> +			/* No multi-mode, binary has two subtests, one of them blocked */
> +			igt_assert_eq(list->size, 1);
> +			igt_assert_eq(list->entries[0].subtest_count, 1);
> +			igt_assert_eqstr(list->entries[0].subtests[0], "second-subtest");
> +		}
> +
> +		igt_fixture {
> +			unlink(listfilename);
> +			unlink(blockfilename);
> +			close(dirfd);
> +			clear_directory(dirname);
> +			free_job_list(list);
> +			free(list);
> +		}
> +	}
> +
>  	igt_subtest_group {
>  		struct job_list *list = malloc(sizeof(*list));
>  		volatile int dirfd = -1;
> -- 
> 2.41.0
> 

