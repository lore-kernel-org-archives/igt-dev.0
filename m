Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6AC10E667
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jun 2022 13:58:53 +0000 (UTC)
Date: Wed, 1 Jun 2022 16:56:41 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Karolina Drobnik <karolina.drobnik@intel.com>
Message-ID: <YpdwGc1aYU1VzOxw@platvala-desk.ger.corp.intel.com>
References: <20220601105708.1065942-1-karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601105708.1065942-1-karolina.drobnik@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] test/intel-ci/fast-feedback: Add
 i915_pciid test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 01, 2022 at 12:57:08PM +0200, Karolina Drobnik wrote:
> Add test to assert that the PCI-ID of a device is being detected to the
> fast-feedback test list. This check won't pass for new devices that have
> no matching entry in intel_device_match table, warning us that device
> info definitions are missing and should be added.
> 
> Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>

New platforms get first introduced in the BAT farm so this makes
perfect sense.

Acked-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/intel-ci/fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index b579c20a..14cad7c0 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -50,6 +50,7 @@ igt@gem_wait@wait@all
>  igt@i915_getparams_basic@basic-eu-total
>  igt@i915_getparams_basic@basic-subslice-total
>  igt@i915_hangman@error-state-basic
> +igt@i915_pciid
>  igt@kms_addfb_basic@addfb25-bad-modifier
>  igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
>  igt@kms_addfb_basic@addfb25-modifier-no-flag
> -- 
> 2.25.1
> 
