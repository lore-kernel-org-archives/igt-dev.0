Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Sat, 5 Aug 2023 09:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Message-ID: <202308050802.0wKtrhu1-lkp@intel.com>
References: <20230804225220.8005-6-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804225220.8005-6-janusz.krzysztofik@linux.intel.com>
Subject: Re: [igt-dev] [PATCH v4 1/3] kunit: Report the count of test suites
 in a module
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 igt-dev@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, Rae Moar <rmoar@google.com>,
 intel-xe@lists.freedesktop.org, kunit-dev@googlegroups.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5a175d369c702ce08c9feb630125c9fc7a9e1370]

url:    https://github.com/intel-lab-lkp/linux/commits/Janusz-Krzysztofik/kunit-Report-the-count-of-test-suites-in-a-module/20230805-065602
base:   5a175d369c702ce08c9feb630125c9fc7a9e1370
patch link:    https://lore.kernel.org/r/20230804225220.8005-6-janusz.krzysztofik%40linux.intel.com
patch subject: [PATCH v4 1/3] kunit: Report the count of test suites in a module
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230805/202308050802.0wKtrhu1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050802.0wKtrhu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050802.0wKtrhu1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/kunit/executor.c:296:
   lib/kunit/executor_test.c: In function 'filter_suites_test':
>> lib/kunit/executor_test.c:46:16: error: variable 'suite_set' has initializer but incomplete type
      46 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                ^~~~~~~~~
>> lib/kunit/executor_test.c:46:40: error: 'struct suite_set' has no member named 'start'
      46 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                                        ^~~~~
   lib/kunit/executor_test.c:46:48: warning: excess elements in struct initializer
      46 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                                                ^~~~~~~~
   lib/kunit/executor_test.c:46:48: note: (near initialization for 'suite_set')
>> lib/kunit/executor_test.c:46:59: error: 'struct suite_set' has no member named 'end'
      46 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                                                           ^~~
   lib/kunit/executor_test.c:46:65: warning: excess elements in struct initializer
      46 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                                                                 ^
   lib/kunit/executor_test.c:46:65: note: (near initialization for 'suite_set')
>> lib/kunit/executor_test.c:46:26: error: storage size of 'suite_set' isn't known
      46 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                          ^~~~~~~~~
>> lib/kunit/executor_test.c:47:26: error: storage size of 'got' isn't known
      47 |         struct suite_set got;
         |                          ^~~
   In file included from lib/kunit/executor.c:4:
   include/kunit/test.h:797:29: warning: passing argument 1 of 'IS_ERR_OR_NULL' makes pointer from integer without a cast [-Wint-conversion]
     797 |         if (!IS_ERR_OR_NULL(__ptr))                                            \
         |                             ^~~~~
         |                             |
         |                             int
   include/kunit/test.h:1478:9: note: in expansion of macro 'KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION'
    1478 |         KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1475:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG'
    1475 |         KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/executor_test.c:55:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_ERR_OR_NULL'
      55 |         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, got.start);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/rwsem.h:17,
                    from include/linux/notifier.h:15,
                    from include/linux/reboot.h:6,
                    from lib/kunit/executor.c:3:
   include/linux/err.h:70:68: note: expected 'const void *' but argument is of type 'int'
      70 | static inline bool __must_check IS_ERR_OR_NULL(__force const void *ptr)
         |                                                        ~~~~~~~~~~~~^~~
   include/kunit/test.h:804:64: warning: initialization of 'const void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     804 |                       KUNIT_INIT_ASSERT(.text = #ptr, .value = __ptr),         \
         |                                                                ^~~~~
   include/kunit/test.h:570:49: note: in definition of macro '_KUNIT_FAILED'
     570 |         const struct assert_class __assertion = INITIALIZER;                   \
         |                                                 ^~~~~~~~~~~
   include/kunit/test.h:804:23: note: in expansion of macro 'KUNIT_INIT_ASSERT'
     804 |                       KUNIT_INIT_ASSERT(.text = #ptr, .value = __ptr),         \
         |                       ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:1478:9: note: in expansion of macro 'KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION'
    1478 |         KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1475:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG'
    1475 |         KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/executor_test.c:55:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_ERR_OR_NULL'
      55 |         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, got.start);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:804:64: note: (near initialization for '__assertion.value')
     804 |                       KUNIT_INIT_ASSERT(.text = #ptr, .value = __ptr),         \
         |                                                                ^~~~~
   include/kunit/test.h:570:49: note: in definition of macro '_KUNIT_FAILED'
     570 |         const struct assert_class __assertion = INITIALIZER;                   \
         |                                                 ^~~~~~~~~~~
   include/kunit/test.h:804:23: note: in expansion of macro 'KUNIT_INIT_ASSERT'
     804 |                       KUNIT_INIT_ASSERT(.text = #ptr, .value = __ptr),         \
         |                       ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:1478:9: note: in expansion of macro 'KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION'
    1478 |         KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1475:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG'
    1475 |         KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/executor_test.c:55:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_ERR_OR_NULL'
      55 |         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, got.start);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:797:29: warning: passing argument 1 of 'IS_ERR_OR_NULL' makes pointer from integer without a cast [-Wint-conversion]
     797 |         if (!IS_ERR_OR_NULL(__ptr))                                            \
         |                             ^~~~~
         |                             |
         |                             int
   include/kunit/test.h:1478:9: note: in expansion of macro 'KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION'
    1478 |         KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1475:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG'
    1475 |         KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/executor_test.c:60:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_ERR_OR_NULL'
      60 |         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, got.start[0]);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/err.h:70:68: note: expected 'const void *' but argument is of type 'int'
      70 | static inline bool __must_check IS_ERR_OR_NULL(__force const void *ptr)
         |                                                        ~~~~~~~~~~~~^~~
   include/kunit/test.h:804:64: warning: initialization of 'const void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     804 |                       KUNIT_INIT_ASSERT(.text = #ptr, .value = __ptr),         \
         |                                                                ^~~~~
   include/kunit/test.h:570:49: note: in definition of macro '_KUNIT_FAILED'
     570 |         const struct assert_class __assertion = INITIALIZER;                   \
         |                                                 ^~~~~~~~~~~
   include/kunit/test.h:804:23: note: in expansion of macro 'KUNIT_INIT_ASSERT'
     804 |                       KUNIT_INIT_ASSERT(.text = #ptr, .value = __ptr),         \
         |                       ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:1478:9: note: in expansion of macro 'KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION'
    1478 |         KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,                          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1475:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG'
    1475 |         KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/executor_test.c:60:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_ERR_OR_NULL'
      60 |         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, got.start[0]);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:804:64: note: (near initialization for '__assertion.value')
     804 |                       KUNIT_INIT_ASSERT(.text = #ptr, .value = __ptr),         \
         |                                                                ^~~~~
   include/kunit/test.h:570:49: note: in definition of macro '_KUNIT_FAILED'
     570 |         const struct assert_class __assertion = INITIALIZER;                   \


vim +/suite_set +46 lib/kunit/executor_test.c

1d71307a6f94df Daniel Latypov 2021-04-20  42  
e5857d396f35e5 Daniel Latypov 2022-07-09  43  static void filter_suites_test(struct kunit *test)
1d71307a6f94df Daniel Latypov 2021-04-20  44  {
e5857d396f35e5 Daniel Latypov 2022-07-09  45  	struct kunit_suite *subsuite[3] = {NULL, NULL};
e5857d396f35e5 Daniel Latypov 2022-07-09 @46  	struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
e5857d396f35e5 Daniel Latypov 2022-07-09 @47  	struct suite_set got;
e5857d396f35e5 Daniel Latypov 2022-07-09  48  	int err = 0;
1d71307a6f94df Daniel Latypov 2021-04-20  49  
a127b154a8f231 Daniel Latypov 2021-09-14  50  	subsuite[0] = alloc_fake_suite(test, "suite1", dummy_test_cases);
a127b154a8f231 Daniel Latypov 2021-09-14  51  	subsuite[1] = alloc_fake_suite(test, "suite2", dummy_test_cases);
1d71307a6f94df Daniel Latypov 2021-04-20  52  
1d71307a6f94df Daniel Latypov 2021-04-20  53  	/* Want: suite1, suite2, NULL -> suite2, NULL */
529534e8cba3e6 Rae Moar       2023-07-25  54  	got = kunit_filter_suites(&suite_set, "suite2", NULL, NULL, &err);
e5857d396f35e5 Daniel Latypov 2022-07-09  55  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, got.start);
e5857d396f35e5 Daniel Latypov 2022-07-09  56  	KUNIT_ASSERT_EQ(test, err, 0);
e5857d396f35e5 Daniel Latypov 2022-07-09  57  	kfree_at_end(test, got.start);
1d71307a6f94df Daniel Latypov 2021-04-20  58  
a127b154a8f231 Daniel Latypov 2021-09-14  59  	/* Validate we just have suite2 */
e5857d396f35e5 Daniel Latypov 2022-07-09  60  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, got.start[0]);
e5857d396f35e5 Daniel Latypov 2022-07-09  61  	KUNIT_EXPECT_STREQ(test, (const char *)got.start[0]->name, "suite2");
e5857d396f35e5 Daniel Latypov 2022-07-09  62  
e5857d396f35e5 Daniel Latypov 2022-07-09  63  	/* Contains one element (end is 1 past end) */
e5857d396f35e5 Daniel Latypov 2022-07-09  64  	KUNIT_ASSERT_EQ(test, got.end - got.start, 1);
a127b154a8f231 Daniel Latypov 2021-09-14  65  }
a127b154a8f231 Daniel Latypov 2021-09-14  66  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
