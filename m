Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B730E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 19:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFCD10E4CB;
	Fri, 20 Dec 2024 19:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6OC+vPV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B4B10E4CB
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734721840; x=1766257840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XwHqq/jp7Z9yM0pkNvPqcI1whzbCJj+Zt+nKDZCOJ6s=;
 b=G6OC+vPVmJDDLBfNJn4wfpdxvuyyUSMJO6KFw+BfCF6bn0vu4+OY2cx9
 Nyhq+udxlRwOQ98her+sU3GEqVeOLETlMhFwHD3g04cAua4Yw/GcmWLvF
 zTIjV1G+ab8ZnalY2DYhDCNRqkOxg3aJl6lqLPsbfE+feWKmxClV8tq4p
 krzfI1Si6DNqzVrnHHcDypJC5aAO7p7pCAPulLwNHGTMCVS47bVq2yiD4
 d/o0FZh2e4aCB8VVj80JoDw6DMYtmdyvlC3KaROfLTegdNnqeZDce0UyJ
 n5yEPDdhl3L8UoY2hr8/c+rzneEO2QFxy8K0tLv8eZMy+zzy5+4fg1WVN A==;
X-CSE-ConnectionGUID: d0s0ehFWTuWJCfkbQFkkzQ==
X-CSE-MsgGUID: NSQzL72wQBeQBThK/jqmsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45771402"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="45771402"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:10:39 -0800
X-CSE-ConnectionGUID: nS0Lw4eITuydXXQOXL7gBA==
X-CSE-MsgGUID: G1xT5+ZATqyAoGbtW0028A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="103561348"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.128])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:10:39 -0800
Date: Fri, 20 Dec 2024 13:10:33 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t 4/4] lib/igt_device_scan: Fix scan vs
 bind/unbind/reload
Message-ID: <7agpjl3vxb5rcosfdwo6fcsgfpig5b4sm6rdrz5q4u2vbqh6ql@jt2s4hdi2alu>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
 <20241218051324.2696557-5-lucas.demarchi@intel.com>
 <20241218061748.5pc5ac7i3el477kp@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218061748.5pc5ac7i3el477kp@zkempczy-mobl2>
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

On Wed, Dec 18, 2024 at 07:17:48AM +0100, Zbigniew Kempczyński wrote:
>On Tue, Dec 17, 2024 at 09:13:24PM -0800, Lucas De Marchi wrote:
>> There's no guarantee a card will end up with the same device node when
>> modules are loaded/unloaded and drivers bound/unbound. There's some
>> fundamental issue with the igt's the way it is and it's also puzzling
>> from the logs it looks like the device vanished from the bus, when in
>> reality is just the SW state out of sync with what the kernel is
>> exporting.
>>
>> Re-scanning when trying to match a device is not expensive compared to
>> what most tests are doing, so simply force it to occur whenever trying
>> to match a card.
>>
>> Example for xe_wedged:
>>
>> 	$ sudo ./build/tests/xe_wedged --device pci:0000:03:00.0 --r wedged-at-any-timeout
>> 	(xe_wedged:11173) drmtest-DEBUG: Looking for devices to open using filter 0: pci:0000:03:00.0
>> 	(xe_wedged:11173) drmtest-DEBUG: Filter matched /dev/dri/card1 | /dev/dri/renderD129
>>
>> 	... [ wedge and rebind here ]
>>
>> 	(xe_wedged:11173) drmtest-DEBUG: Looking for devices to open using filter 0: pci:0000:03:00.0
>> 	(xe_wedged:11173) drmtest-DEBUG: Filter matched /dev/dri/card2 | /dev/dri/renderD130
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_device_scan.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
>> index 8e2297087..956719fba 100644
>> --- a/lib/igt_device_scan.c
>> +++ b/lib/igt_device_scan.c
>> @@ -1983,7 +1983,7 @@ static bool __igt_device_card_match(const char *filter,
>>  	 * Scan devices in case the user hasn't yet,
>>  	 * but leave a decision on forced rescan on the user side.
>>  	 */
>> -	igt_devices_scan(false);
>> +	igt_devices_scan(true);
>
>Please don't. Check igt_device_filter_add() and for loop inside. This
>would trigger a lot of rescans instead of one.
>
>If whatever is causing changes from drm (udev) perspective it should be
>targeted there, not in the library.

I wanted to get some numbers on "does the multiple scans matter that we
need to cache?" Looking at BAT for this series, I'd say no. Using these
2 as before (a.json) and after (b.json):

https://intel-gfx-ci.01.org/tree/intel-xe/xe-2397-d8f0c44e2ed948dcc45d04a0dfa83612995a702b/bat-bmg-1/results0.json.bz2   
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12340/bat-bmg-1/results0.json.bz2                                        

Checking runtimes:
$ jq -r '.tests[].time.end' a.json  > /tmp/a.txt 
$ jq -r '.tests[].time.end' b.json  > /tmp/b.txt
$ while IFS= read -r a && IFS= read -r b <&3; do
	delta=$(echo "$b - $a" | bc -l)
	perc=$(echo "($delta/($a+0.001))*100" | bc -l)
	printf "%.3f %.3f % .3f % .2f%%\n" $a $b $delta $perc
done < /tmp/a.txt 3< /tmp/b.txt

0.974 0.891 -0.083 -8.51%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
10.150 10.141 -0.009 -0.09%
6.676 6.673 -0.003 -0.04%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
1.081 1.079 -0.002 -0.18%
0.973 1.000  0.027  2.77%
0.995 0.999  0.004  0.40%
0.986 0.986  0.000  0.00%
0.971 0.998  0.027  2.78%
0.995 1.008  0.013  1.31%
0.001 0.000 -0.001 -50.00%
2.884 2.850 -0.034 -1.18%
0.758 0.752 -0.006 -0.79%
0.706 0.695 -0.011 -1.56%
0.702 0.696 -0.006 -0.85%
0.707 0.697 -0.010 -1.41%
2.878 2.893  0.015  0.52%
0.773 0.778  0.005  0.65%
0.707 0.704 -0.003 -0.42%
0.699 0.705  0.006  0.86%
0.687 0.696  0.009  1.31%
4.169 4.155 -0.014 -0.34%
1.046 1.032 -0.014 -1.34%
1.030 1.038  0.008  0.78%
1.038 1.027 -0.011 -1.06%
1.038 1.041  0.003  0.29%
3.034 3.048  0.014  0.46%
0.762 0.759 -0.003 -0.39%
0.753 0.756  0.003  0.40%
0.746 0.764  0.018  2.41%
0.755 0.752 -0.003 -0.40%
0.311 0.311  0.000  0.00%
0.017 0.017  0.000  0.00%
0.019 0.018 -0.001 -5.00%
1.880 1.885  0.005  0.27%
0.099 0.102  0.003  3.00%
1.763 1.783  0.020  1.13%
0.469 0.479  0.010  2.13%
0.434 0.440  0.006  1.38%
0.424 0.431  0.007  1.65%
0.422 0.419 -0.003 -0.71%
5.606 5.581 -0.025 -0.45%
1.503 1.488 -0.015 -1.00%
1.477 1.492  0.015  1.01%
1.315 1.289 -0.026 -1.98%
1.296 1.300  0.004  0.31%
4.451 4.480  0.029  0.65%
1.145 1.174  0.029  2.53%
1.074 1.090  0.016  1.49%
1.094 1.089 -0.005 -0.46%
1.122 1.113 -0.009 -0.80%
2.547 2.537 -0.010 -0.39%
0.670 0.663 -0.007 -1.04%
0.624 0.622 -0.002 -0.32%
0.615 0.612 -0.003 -0.49%
0.619 0.625  0.006  0.97%
2.557 2.559  0.002  0.08%
0.672 0.687  0.015  2.23%
0.622 0.625  0.003  0.48%
0.616 0.607 -0.009 -1.46%
0.628 0.625 -0.003 -0.48%
2.286 2.245 -0.041 -1.79%
0.621 0.591 -0.030 -4.82%
0.562 0.549 -0.013 -2.31%
0.549 0.543 -0.006 -1.09%
0.535 0.551  0.016  2.99%
2.277 2.277  0.000  0.00%
0.598 0.605  0.007  1.17%
0.558 0.559  0.001  0.18%
0.548 0.549  0.001  0.18%
0.554 0.556  0.002  0.36%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.012 0.013  0.001  7.69%
0.451 0.401 -0.050 -11.06%
0.418 0.428  0.010  2.39%
0.000 0.000  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.078 0.080  0.002  2.53%
0.001 0.001  0.000  0.00%
0.013 0.034  0.021  150.00%
0.011 0.033  0.022  183.33%
0.012 0.035  0.023  176.92%
0.012 0.034  0.022  169.23%
0.198 0.204  0.006  3.02%
2.936 3.190  0.254  8.65%
0.028 0.028  0.000  0.00%
0.003 0.003  0.000  0.00%
0.003 0.003  0.000  0.00%
0.003 0.003  0.000  0.00%
0.003 0.003  0.000  0.00%
0.003 0.003  0.000  0.00%
0.003 0.004  0.001  25.00%
0.005 0.003 -0.002 -33.33%
0.018 0.020  0.002  10.53%
0.004 0.003 -0.001 -20.00%
0.002 0.002  0.000  0.00%
0.002 0.002  0.000  0.00%
0.002 0.002  0.000  0.00%
0.002 0.002  0.000  0.00%
0.002 0.002  0.000  0.00%
0.002 0.002  0.000  0.00%
0.004 0.005  0.001  20.00%
0.005 0.005  0.000  0.00%
0.009 0.009  0.000  0.00%
0.006 0.007  0.001  14.29%
0.005 0.005  0.000  0.00%
0.007 0.006 -0.001 -12.50%
0.009 0.010  0.001  10.00%
0.009 0.009  0.000  0.00%
0.009 0.009  0.000  0.00%
0.008 0.008  0.000  0.00%
0.008 0.008  0.000  0.00%
0.547 0.545 -0.002 -0.36%
0.009 0.010  0.001  10.00%
0.008 0.007 -0.001 -11.11%
0.008 0.007 -0.001 -11.11%
0.012 0.012  0.000  0.00%
0.011 0.011  0.000  0.00%
0.009 0.010  0.001  10.00%
0.022 0.021 -0.001 -4.35%
0.017 0.019  0.002  11.11%
0.019 0.023  0.004  20.00%
0.016 0.024  0.008  47.06%
0.021 0.019 -0.002 -9.09%
0.032 0.033  0.001  3.03%
0.026 0.030  0.004  14.81%
0.020 0.021  0.001  4.76%
0.018 0.019  0.001  5.26%
0.028 0.029  0.001  3.45%
0.027 0.026 -0.001 -3.57%
0.032 0.026 -0.006 -18.18%
0.046 0.039 -0.007 -14.89%
0.025 0.040  0.015  57.69%
0.030 0.029 -0.001 -3.23%
0.023 0.025  0.002  8.33%
0.025 0.023 -0.002 -7.69%
0.021 0.019 -0.002 -9.09%
0.029 0.038  0.009  30.00%
0.028 0.027 -0.001 -3.45%
1.905 1.909  0.004  0.21%
0.029 0.032  0.003  10.00%
0.023 0.029  0.006  25.00%
0.040 0.045  0.005  12.20%
0.031 0.041  0.010  31.25%
1.922 1.917 -0.005 -0.26%
0.005 0.005  0.000  0.00%
1.267 1.304  0.037  2.92%
1.273 1.292  0.019  1.49%
0.351 0.456  0.105  29.83%
0.005 0.004 -0.001 -16.67%
0.003 0.004  0.001  25.00%
0.010 0.010  0.000  0.00%
0.623 0.625  0.002  0.32%
0.208 0.208  0.000  0.00%
0.010 0.007 -0.003 -27.27%
0.004 0.004  0.000  0.00%
0.003 0.003  0.000  0.00%
0.007 0.007  0.000  0.00%
0.007 0.006 -0.001 -12.50%
0.008 0.008  0.000  0.00%
0.003 0.004  0.001  25.00%
0.004 0.003 -0.001 -20.00%
0.003 0.004  0.001  25.00%
0.008 0.007 -0.001 -11.11%
0.117 0.120  0.003  2.54%
0.106 0.111  0.005  4.67%
0.136 0.146  0.010  7.30%
0.059 0.058 -0.001 -1.67%
0.006 0.007  0.001  14.29%
0.001 0.001  0.000  0.00%
0.034 0.033 -0.001 -2.86%
0.009 0.009  0.000  0.00%
0.007 0.007  0.000  0.00%
0.007 0.007  0.000  0.00%
0.007 0.007  0.000  0.00%
0.001 0.001  0.000  0.00%
0.004 0.004  0.000  0.00%
0.007 0.007  0.000  0.00%
0.001 0.000 -0.001 -50.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.001 0.001  0.000  0.00%
0.000 0.000  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.249 0.271  0.022  8.80%
0.100 0.123  0.023  22.77%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.001 0.000 -0.001 -50.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.001 0.001  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.004 0.004  0.000  0.00%
0.024 0.023 -0.001 -4.00%
0.000 0.000  0.000  0.00%
0.006 0.006  0.000  0.00%
0.001 0.001  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.001 0.000 -0.001 -50.00%
0.000 0.000  0.000  0.00%
0.004 0.005  0.001  20.00%
0.000 0.001  0.001  100.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.007 0.007  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.004 0.003 -0.001 -20.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.006 0.006  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.004 0.004  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.007 0.006 -0.001 -12.50%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.001 0.001  0.000  0.00%
0.078 0.089  0.011  13.92%
0.069 0.067 -0.002 -2.86%
0.053 0.055  0.002  3.70%
0.069 0.077  0.008  11.43%
0.055 0.058  0.003  5.36%
0.023 0.024  0.001  4.17%
0.005 0.007  0.002  33.33%
0.005 0.006  0.001  16.67%
0.006 0.005 -0.001 -14.29%
0.005 0.006  0.001  16.67%
0.005 0.006  0.001  16.67%
0.006 0.005 -0.001 -14.29%
0.006 0.006  0.000  0.00%
0.005 0.007  0.002  33.33%
0.004 0.004  0.000  0.00%
0.010 0.032  0.022  200.00%
0.048 0.067  0.019  38.78%
0.046 0.051  0.005  10.64%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
0.000 0.000  0.000  0.00%
9.122 9.016 -0.106 -1.16%
1.540 1.496 -0.044 -2.86%
2.902 2.919  0.017  0.59%
4.678 4.598 -0.080 -1.71%
0.048 0.046 -0.002 -4.08%
0.005 0.005  0.000  0.00%
0.004 0.004  0.000  0.00%
3.620 3.653  0.033  0.91%
6.879 6.838 -0.041 -0.60%
0.116 0.113 -0.003 -2.56%
6.754 6.717 -0.037 -0.55%
0.129 0.104 -0.025 -19.23%
0.127 0.102 -0.025 -19.53%
0.255 0.262  0.007  2.73%
0.122 0.115 -0.007 -5.69%
0.128 0.141  0.013  10.08%
0.036 0.037  0.001  2.70%
0.064 0.061 -0.003 -4.62%
0.039 0.029 -0.010 -25.00%
0.034 0.043  0.009  25.71%
0.048 0.040 -0.008 -16.33%
0.042 0.037 -0.005 -11.63%
0.040 0.048  0.008  19.51%
0.037 0.050  0.013  34.21%
0.044 0.045  0.001  2.22%
0.046 0.044 -0.002 -4.26%
0.053 0.043 -0.010 -18.52%
0.034 0.031 -0.003 -8.57%
0.032 0.032  0.000  0.00%
0.038 0.039  0.001  2.56%
0.034 0.033 -0.001 -2.86%
0.042 0.050  0.008  18.60%
0.044 0.040 -0.004 -8.89%
0.038 0.042  0.004  10.26%
0.045 0.036 -0.009 -19.57%
0.046 0.041 -0.005 -10.64%
0.054 0.034 -0.020 -36.36%
0.046 0.043 -0.003 -6.38%
0.044 0.029 -0.015 -33.33%
0.045 0.051  0.006  13.04%
0.037 0.035 -0.002 -5.26%
0.034 0.041  0.007  20.00%
0.069 0.046 -0.023 -32.86%
0.033 0.038  0.005  14.71%
0.061 0.054 -0.007 -11.29%
0.047 0.044 -0.003 -6.25%
0.042 0.041 -0.001 -2.33%
0.043 0.039 -0.004 -9.09%
0.035 0.027 -0.008 -22.22%
0.255 0.212 -0.043 -16.80%
0.261 0.259 -0.002 -0.76%
0.313 0.318  0.005  1.59%
0.288 0.271 -0.017 -5.88%
0.859 0.862  0.003  0.35%
0.343 0.325 -0.018 -5.23%
1.447 1.225 -0.222 -15.33%
1.515 1.499 -0.016 -1.06%
1.621 1.662  0.041  2.53%
1.498 1.516  0.018  1.20%
5.231 5.216 -0.015 -0.29%
0.941 0.967  0.026  2.76%
1.416 1.499  0.083  5.86%
1.619 1.620  0.001  0.06%
1.500 1.539  0.039  2.60%
5.229 5.216 -0.013 -0.25%


Although there are some big numbers showing e.g. 200%, numbers are so
small here that they are all noise to what the tests are doing. It
doesn't make sense that some of them are showing improved performance
when we are doing more work. Also if I get the information from
.runtimes rather than .tests to consider a test granualarity, I still
have the same conclusion.


Lucas De Marchi

>
>--
>Zbigniew
>
>>
>>  	if (igt_device_filter_apply(filter) == false)
>>  		return false;
>> --
>> 2.47.0
>>
