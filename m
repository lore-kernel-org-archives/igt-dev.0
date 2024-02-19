Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A94C48260
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 07:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EB810E17A;
	Mon, 19 Feb 2024 07:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRuhqtlv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCB610E17A
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 07:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708326515; x=1739862515;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NCXeP1GTiOAxpyIQNiP7UyUhapzPeX99iEvdnElRFus=;
 b=kRuhqtlv17YQYTdBCcJsx4etbf4pa8Aanm2sEZgv+Md28mQ9JisZIWvc
 U7susiaV/KjMS3BcI8qJx19lPiTNSlYgVsc/IVeRLju2xtpPxTsTxDw6j
 d+rosVxSHwf/Clw6sbGz2yswmxHLARxlkrnG1CS1GPpAkSTZFYfiq9nfw
 oyddMcWyFMpmtAcsjmhaXVTWGHUMfg92x8rxJF1gXuLwFqaYmVhaPU89X
 5QYUuTqC5zQtZ3a247QBVyaHFiveoOjt95niMaBA0MyMj+9Z7f5a4a8UN
 eeXZWN33MzslGO8yT7A9edRDtYqK60apyZsoz6vpAk7fJnAnAPISM+j8c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2255842"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2255842"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2024 23:08:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4433839"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2024 23:08:35 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EDE6B580AA7;
 Sun, 18 Feb 2024 23:08:32 -0800 (PST)
Date: Mon, 19 Feb 2024 08:08:30 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Jari Tahvanainen
 <jari.tahvanainen@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v1] tests/intel/i915_test_config: align JSON
 documentation with xe
Message-ID: <20240219080830.3619dcd8@maurocar-mobl2>
In-Reply-To: <20240216155207.67429-1-kamil.konieczny@linux.intel.com>
References: <20240216155207.67429-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Fri, 16 Feb 2024 16:52:07 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> From: Jari Tahvanainen <jari.tahvanainen@intel.com>
> 
> Restructure i915 JSON to align with Xe.
> 
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/i915_test_config.json | 45 ++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index ad59677f8..b09f4244e 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -16,33 +16,52 @@
>      "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c",
>                         "xe_*" ],
>      "fields": {
> -	"Mega feature": {
> +        "Category": {
> +            "_properties_": {
> +                "mandatory": true,
> +                "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
> +            },
> +            "Mega feature": {
>                  "_properties_": {
>                      "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
>                  },
> -                "Category": {
> -                "_properties_": {
> -                    "description": "Contains the major group for the tested functionality"
> -                },
> -
>                  "Sub-category": {
>                      "_properties_": {
> -                        "description": "Contains the minor group of the functionality"
> +                        "mandatory": true,
> +                        "description": "Contains the technical feature/functionality"
>                      },
>                      "Functionality": {
>                          "_properties_": {
> -                            "description": "Describes the functionality to be tested"
> +                            "mandatory": true,
> +                            "description": "Groups page table tests on buckets containg more detailed functionality"
>                          },
>                          "Feature": {
>                              "_properties_": {
>                                  "description": "Describes the lowest level feature bucket"
> -                            },
> -                            "Run type": {
> -                                "_properties_": {
> -                                    "description": "Defines what category of testlist it belongs"
> -                                }
>                              }
>                          }
> +                    },
> +                    "Run type": {
> +                        "_properties_": {
> +                            "mandatory": true,
> +                            "description": "Defines what category of testlist it belongs",
> +                            "default-testlist": "FULL",
> +                            "update-from-file": {
> +                                "exclude-type": "regex-ignorecase",
> +                                "append-value-if-not-excluded": "i915 FULL",
> +                                "include": [
> +                                    { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
> +                                ],
> +                                "exclude": [
> +                                    { "i915 BAT, 915 FULL": "../intel-ci/blacklist.txt" }

There is a typo at "915 FULL". It should be, instead: 

	{ "i915 BAT, i915 FULL": "../intel-ci/blacklist.txt" }

or, even better:

	{ "all": "../intel-ci/blacklist.txt" }

With that:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>


> +                                ]
> +                            },
> +                            "order": [
> +                                "boot",
> +                                "__all__",
> +                                "kunit"
> +                            ]
> +                        }
>                      }
>                  }
>              }
