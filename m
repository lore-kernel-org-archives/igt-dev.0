Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, kernel test robot <lkp@intel.com>
Date: Sat, 29 Jul 2023 17:57:59 +0200
Message-ID: <3204833.aV6nBDHxoP@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <202307290124.BnnhRy8b-lkp@intel.com>
References: <20230728154419.1810177-8-janusz.krzysztofik@linux.intel.com>
 <202307290124.BnnhRy8b-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH 3/3] kunit: Allow kunit test modules to use
 test filtering
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kunit-dev@googlegroups.com, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, igt-dev@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Friday, 28 July 2023 19:24:55 CEST kernel test robot wrote:
> >> lib/kunit/executor.c:182:42: warning: declaration of 'struct suite_set' 
will not be visible outside of this function [-Wvisibility]
>      182 | static void kunit_exec_list_tests(struct suite_set *suite_set)
>          |                                          ^

I've apparently broken this patch while reordering patches in the series.  
Sorry for submitting that untested.  Please expect v2 soon.

Thanks,
Janusz

