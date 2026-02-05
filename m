Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B367BECD999
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 19:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DB710E042;
	Thu,  5 Feb 2026 19:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUfVd45O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527B410E042
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 19:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770320607; x=1801856607;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZDvn672q9e0ka2QR9Wte7KZhkROdmomSqwoPrvgJMOE=;
 b=hUfVd45O6scxY/4212+uFul1fX6Y1mIw0obkrO8nfWo9saERfFWHbd3W
 4GCexjpIYQn97m09LrDdlNofXAppOLBTLBWJE1aRVa7EfmvKUPNR6Uy0t
 mro/IoeuIiBWe7yB7TR9p/yyneW9II0ZhaNGqywfhHcdQsOY3JKXPNlGf
 R+zo9OgkdKOgRKSb1WfetiYJ0QDr6rraxV66Hizof/selSOXVH/sBt7Me
 tYIKsNxXxwYYH+zFUrpMQhF1Y4XGLw3mZ4owZdOr0Tp3fnDZwyj6OpD43
 h6DfLUFS931XDXI6XRkShJFOm2jyVD6FMd3UDCWtnlTAWtSI+WEEtl+0j A==;
X-CSE-ConnectionGUID: XvZuKrhTQnCr9W6emh+6aQ==
X-CSE-MsgGUID: 1xbRZ8hAR7WqRM1z243T7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70547402"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="70547402"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:43:27 -0800
X-CSE-ConnectionGUID: fvnHkYIVS6Oo1yvYAY/cLA==
X-CSE-MsgGUID: HgylZp2NRSaQ/Bn3EiSp9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="209941539"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:43:26 -0800
Date: Thu, 5 Feb 2026 20:43:23 +0100
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v1 2/4] runner/tests: Fix JSON test data
Message-ID: <20260205194323.pnk36zcatdibidzh@pawelsik-desk>
References: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
 <20260115175811.179898-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115175811.179898-3-kamil.konieczny@linux.intel.com>
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

On Thu, Jan 15, 2026 at 06:58:08PM +0100, Kamil Konieczny wrote:
> From: Ryszard Knop <ryszard.knop@intel.com>
> 
> JSON files contained extra (invalid) commas which json-c was able to
> handle, but Jansson, Firefox and Python parsers are unhappy with.

Hi,

LGTM.

Reviewed-by: Pawel Sikora <pawel.sikora@intel.com>

KR,
Pawel Sikora


> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  .../json_tests_data/aborted-after-a-test/reference.json   | 6 +++---
>  runner/json_tests_data/aborted-on-boot/reference.json     | 4 ++--
>  runner/json_tests_data/dmesg-escapes/reference.json       | 8 ++++----
>  runner/json_tests_data/empty-result-files/reference.json  | 4 ++--
>  runner/json_tests_data/graceful-notrun/reference.json     | 6 +++---
>  .../incomplete-before-any-subtests/reference.json         | 2 +-
>  .../notrun-results-multiple-mode/reference.json           | 2 +-
>  runner/json_tests_data/notrun-results/reference.json      | 2 +-
>  8 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/runner/json_tests_data/aborted-after-a-test/reference.json b/runner/json_tests_data/aborted-after-a-test/reference.json
> index 50ba9e6e1..f3780ea19 100644
> --- a/runner/json_tests_data/aborted-after-a-test/reference.json
> +++ b/runner/json_tests_data/aborted-after-a-test/reference.json
> @@ -50,7 +50,7 @@
>  	"out":"Aborted after: successtest (first-subtest)\n\nKernel tainted (0x200)\n",
>  	"result":"fail",
>  	"err":"",
> -	"dmesg":"",
> +	"dmesg":""
>      }
>    },
>    "totals":{
> @@ -131,7 +131,7 @@
>        "notrun":0,
>        "fail":1,
>        "warn":0
> -    },
> +    }
>    },
>    "runtimes":{
>      "igt@successtest":{
> @@ -140,6 +140,6 @@
>          "start":0,
>          "end":0.014
>        }
> -    },
> +    }
>    }
>  }
> diff --git a/runner/json_tests_data/aborted-on-boot/reference.json b/runner/json_tests_data/aborted-on-boot/reference.json
> index 238ec6fff..21f4aaf14 100644
> --- a/runner/json_tests_data/aborted-on-boot/reference.json
> +++ b/runner/json_tests_data/aborted-on-boot/reference.json
> @@ -44,7 +44,7 @@
>  	"out":"Aborted after: startup\n\nKernel tainted (0x200)\n",
>  	"result":"fail",
>  	"err":"",
> -	"dmesg":"",
> +	"dmesg":""
>      }
>    },
>    "totals":{
> @@ -125,7 +125,7 @@
>        "notrun":0,
>        "fail":1,
>        "warn":0
> -    },
> +    }
>    },
>    "runtimes":{
>    }
> diff --git a/runner/json_tests_data/dmesg-escapes/reference.json b/runner/json_tests_data/dmesg-escapes/reference.json
> index e74dc89e4..fc1fbd264 100644
> --- a/runner/json_tests_data/dmesg-escapes/reference.json
> +++ b/runner/json_tests_data/dmesg-escapes/reference.json
> @@ -20,8 +20,8 @@
>          "end":0
>        },
>        "err":"Starting subtest: first-subtest\nSubtest first-subtest: SUCCESS (0.000s)\n",
> -	"dmesg":"<6> [3216186.095083] Console: switching to colour dummy device 80x25\n<6> [3216186.095097] [IGT] successtest: executing\n<6> [3216186.101115] [IGT] successtest: starting subtest first-subtest\n<6> [3216186.101159] String with a\nnewline\n<6> [3216186.101159] String with a\ttab\n<6> [3216186.101159] String with an explicit\\x00NUL\n<6> [3216186.101159] The character \\x13 should be nonprintable\n<6> [3216186.101159] Escaped backslash is \\\n<6> [3216186.101159] Kernel shouldn't output this but cutoff escape \\x1\n<6> [3216186.101159] More cutoff \\x\n<6> [3216186.101159] One more \\\n<6> [3216186.101160] [IGT] successtest: exiting, ret=0\n<6> [3216186.101299] Console: switching to colour frame buffer device 240x75\n",
> -    },
> +	"dmesg":"<6> [3216186.095083] Console: switching to colour dummy device 80x25\n<6> [3216186.095097] [IGT] successtest: executing\n<6> [3216186.101115] [IGT] successtest: starting subtest first-subtest\n<6> [3216186.101159] String with a\nnewline\n<6> [3216186.101159] String with a\ttab\n<6> [3216186.101159] String with an explicit\\x00NUL\n<6> [3216186.101159] The character \\x13 should be nonprintable\n<6> [3216186.101159] Escaped backslash is \\\n<6> [3216186.101159] Kernel shouldn't output this but cutoff escape \\x1\n<6> [3216186.101159] More cutoff \\x\n<6> [3216186.101159] One more \\\n<6> [3216186.101160] [IGT] successtest: exiting, ret=0\n<6> [3216186.101299] Console: switching to colour frame buffer device 240x75\n"
> +    }
>    },
>    "totals":{
>      "":{
> @@ -62,7 +62,7 @@
>        "notrun":0,
>        "fail":0,
>        "warn":0
> -    },
> +    }
>    },
>    "runtimes":{
>      "igt@successtest":{
> @@ -71,6 +71,6 @@
>          "start":0,
>          "end":0.014
>        }
> -    },
> +    }
>    }
>  }
> diff --git a/runner/json_tests_data/empty-result-files/reference.json b/runner/json_tests_data/empty-result-files/reference.json
> index 332e20693..5843f57f5 100644
> --- a/runner/json_tests_data/empty-result-files/reference.json
> +++ b/runner/json_tests_data/empty-result-files/reference.json
> @@ -15,7 +15,7 @@
>  	"err":"",
>  	"dmesg":"",
>  	"result":"incomplete"
> -    },
> +    }
>    },
>    "totals":{
>      "":{
> @@ -56,7 +56,7 @@
>        "notrun":0,
>        "fail":0,
>        "warn":0
> -    },
> +    }
>    },
>    "runtimes":{
>    }
> diff --git a/runner/json_tests_data/graceful-notrun/reference.json b/runner/json_tests_data/graceful-notrun/reference.json
> index ddad3d925..21f5806a1 100644
> --- a/runner/json_tests_data/graceful-notrun/reference.json
> +++ b/runner/json_tests_data/graceful-notrun/reference.json
> @@ -40,7 +40,7 @@
>  	"err":"",
>  	"dmesg":"",
>  	"result":"notrun"
> -    },
> +    }
>    },
>    "totals":{
>      "":{
> @@ -107,7 +107,7 @@
>        "notrun":2,
>        "fail":0,
>        "warn":0
> -    },
> +    }
>    },
>    "runtimes":{
>      "igt@successtest":{
> @@ -116,6 +116,6 @@
>          "start":0,
>          "end":0.014
>        }
> -    },
> +    }
>    }
>  }
> diff --git a/runner/json_tests_data/incomplete-before-any-subtests/reference.json b/runner/json_tests_data/incomplete-before-any-subtests/reference.json
> index 5fc1978eb..ce4188b94 100644
> --- a/runner/json_tests_data/incomplete-before-any-subtests/reference.json
> +++ b/runner/json_tests_data/incomplete-before-any-subtests/reference.json
> @@ -40,7 +40,7 @@
>  	"err":"",
>  	"dmesg":"",
>  	"result":"notrun"
> -    },
> +    }
>    },
>    "totals":{
>      "":{
> diff --git a/runner/json_tests_data/notrun-results-multiple-mode/reference.json b/runner/json_tests_data/notrun-results-multiple-mode/reference.json
> index 80ba5ec2c..376540696 100644
> --- a/runner/json_tests_data/notrun-results-multiple-mode/reference.json
> +++ b/runner/json_tests_data/notrun-results-multiple-mode/reference.json
> @@ -102,6 +102,6 @@
>          "start":0,
>          "end":0.014
>        }
> -    },
> +    }
>    }
>  }
> diff --git a/runner/json_tests_data/notrun-results/reference.json b/runner/json_tests_data/notrun-results/reference.json
> index 42fcd0017..e9318c1aa 100644
> --- a/runner/json_tests_data/notrun-results/reference.json
> +++ b/runner/json_tests_data/notrun-results/reference.json
> @@ -121,6 +121,6 @@
>          "start":0,
>          "end":0.014
>        }
> -    },
> +    }
>    }
>  }
> -- 
> 2.52.0
> 
