Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, kernel test robot <lkp@intel.com>
Date: Mon, 31 Jul 2023 14:07:49 +0200
Message-ID: <1971193.8hb0ThOEGa@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <202307311645.CdN0xKiF-lkp@intel.com>
References: <20230731054552.2145292-8-janusz.krzysztofik@linux.intel.com>
 <202307311645.CdN0xKiF-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH v2 3/3] kunit: Allow kunit test modules to use
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

On Monday, 31 July 2023 10:39:03 CEST kernel test robot wrote:
> >> ERROR: modpost: "glob_match" [lib/kunit/kunit.ko] undefined!

Caused by CONFIG_GLOB possibly not selected when building kunit as a module  
(it was selected via another, unrelated setting in my test .config).

Please expect v3 with that fixed.

Thanks,
Janusz

