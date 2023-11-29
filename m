Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6A310E61A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 15:41:45 +0000 (UTC)
Date: Wed, 29 Nov 2023 16:41:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231129154140.nlublqmr6fbxvtf4@kamilkon-desk.igk.intel.com>
References: <20231129123221.98948-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129123221.98948-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] Produce per-GPU testlists for
 IntelCI
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
On 2023-11-29 at 13:25:33 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> This series contain an improvement to IGT documentation tool to
> help generating per-GPU testlists.
> 
> This helps producing testlists to be used by Intel CI automation,
> as tests that are specific to certain GPUs or ones that won't be
> running on some specific configurations can be excluded from
> the testlists, making the test results more reliable, saving
> execution time on CI and keeping such exclusions properly
> documented.
> 
> With such change, assuming that some tests would be needed to

Could you add this description starting from word "assuming"
into documentation (python source code) or at least copy it
into patch description?
It shows how to use your change and what is expected output.

Regards,
Kamil

> be blocked on a "foo" configutation, running
> 
> 	./scripts/igt_doc.py --config tests/intel/xe_test_config.json --intelci-testlist intel-ci
> 
> will produce a set of testlist files like:
> 
> 	intel-ci/
> 	└── xe
> 	    ├── default
> 	    │   ├── bat.testlist
> 	    │   ├── full.testlist
> 	    │   └── other.testlist
> 	    └── foo
> 	        ├── bat.testlist
> 	        ├── full.testlist
> 	        └── other.testlist
> 
> Where the "foo" testlists will have a different set of sets on
> their testlists, due to blocklisted tests.
> 
> Mauro Carvalho Chehab (3):
>   igt_doc: Add driver name list at JSON configuration
>   tests/intel: *.json: specify what drivers use such tests
>   scripts/igt_doc.py: add a logic to generate Intel CI testlists
> 
>  scripts/igt_doc.py                | 192 +++++++++++++++++++++++++++++-
>  scripts/test_list.py              |   5 +
>  tests/intel/i915_test_config.json |   1 +
>  tests/intel/kms_test_config.json  |   1 +
>  tests/intel/xe_test_config.json   |   1 +
>  5 files changed, 198 insertions(+), 2 deletions(-)
> 
> -- 
> 2.42.0
> 

