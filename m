Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A69CD98E2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 09:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DC510EF00;
	Wed, 17 Jun 2026 09:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVf+GKEn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F6910EF00
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 09:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781688161; x=1813224161;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5vQcffDOBBd2Jw8LTHhGMuGWo0JQ9a2uzaVsAxQmnzI=;
 b=YVf+GKEnkl0m+x11BzEhl+SRwJ8ntwslM9doEgfsU6115o64WP61+wXe
 Ag0DMLcUnwB5vgemlQhZ8/ydJeYoeyTiU6uRLhQk0O1/pde8a4JJvgmOK
 jn2AKYFDZW1Xc7hwiWOeqrY+r5aQ8a7yutED9Fp6W8Vbz5t8DQMwwfgvH
 61B+S+F4MqjSZT+2wsUCxpGl44xaLHU3lbNJRord32piPso+HE0IotImC
 gOWM6n9qkvziCX7JZEX+zVNp+9N8GXmECAzewGsAg4jiLkPdv9d99BtJT
 s7XzG4sr2FX5jS0+P3jTKn22D4QyAjKrTiCzVgvr6ghq2YE9inkZ9fQW6 A==;
X-CSE-ConnectionGUID: +wDlxoNzT/O2DoHEFgE30w==
X-CSE-MsgGUID: X2cZy9/KR3KHmjM7omBQgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82583318"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82583318"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 02:22:40 -0700
X-CSE-ConnectionGUID: X9CzxBGES+aoGwq99IVqpg==
X-CSE-MsgGUID: 4v2f7sbeRvSOXIbYPlS8RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="247123076"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 02:22:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 02:22:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 02:22:40 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 02:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQ1LHCvTX/kmfzJNGGKkm1IcL+a+ofD26X7BO7iAB5NMqtSlPPC4r/ATArFycg9lqVHuAA2T4gr3o9XviTQDio+rylNSXTZrUkDuOWkJffqH5SrGc1Mw1Z/NkMUjRqbfPgjrb4EuZJLhR6oHK4rqgOO2VGDdP9+d7+43VzgM5FsSwr+plgjjGtsdX2ZWQzbUNTVUZ2/KjB87MlvmnHisczlNzW8jzZ0MD2SUCk0U/uViHuTd6uu/9ZjWNaO6hPSKcORavT52c84T3UxBBY7EqgauW6brGsDsUxipgxNUPJYnvZ75DaDu8CfbwWWE7siCx85gVipoHMhzyZV03ykRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+S+vr8uugwkGKdvf3aZvY85tWy/YITkh9YwrHGJncLo=;
 b=nvGyfxQjO1M98PK5m0XfoBR49iXuBaNjjQu6VZ0XaIj7IzD9LTro2OOc3e+gEtAO3CIjgQHI05QkM023jw5syDzLRExjdwVmRIVU3A/8BW/vKi7cpL9mbPAa/0QyD7+4mCvYoCnhJeQLI2ufXTMwYNBsarnxLwOMJQeqm7lvNvp3Kydy4rNLd2wff4e7coxevn+bzrTdQ9XJNRQ2KwFM6UkLereVodFKxHZMqDyzv69WnLON94LZycrmzkTZ/cVdERdL0BGNkw/Z363FTemgdRfbxysG1y41YV8Vn4+uVuhl4p1Lkq/sfwOcCaBrbMC47k6sylrfSd1zSW74OpPYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV1PR11MB8790.namprd11.prod.outlook.com (2603:10b6:408:2b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 09:22:37 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 09:22:37 +0000
Message-ID: <a6015949-ee58-4b7d-bc71-d4b5cf175d12@intel.com>
Date: Wed, 17 Jun 2026 14:52:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/kms: fix last pipe check in
 igt_check_bigjoiner_support()
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260616090610.2106378-1-jani.nikula@intel.com>
 <20260616090610.2106378-2-jani.nikula@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260616090610.2106378-2-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0186.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV1PR11MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1fc6ef-19a1-4973-06a4-08decc51f8b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|366016|23010399003|1800799024|376014|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: VB0wXWqqdRw62lz7iSYoV1LLI1T0cbbjQy0xok3rPGVxWcf2lpQQcPPuYbf8/Jwwy0ArkwHmEjRIU9tJQF3UcW2o6Wu1OtnpXppLs4fP/eU1LIvu43kC8+WjLferMEUESlhcQVwllxJlnt8IIZUlz22acdKjC4ElAnwEvU6rIHEIrAjpmGjS4do6AkA/xCCwEdjLcup19cu2D9N2UteTN8DVLn/RpK4BoQEmb/aQzXbPWGBkzfEGeFgUaFB+nJ/DzTwPA6wQtv3tfHbLMKlOFs8/20/CpTog2905VM0SA1U57wT8coufuIsRQorULDuP8EnrjmQa/lkBOoZcHZXnCs0tlHluX6DuX5O6F9klk7NneypdOSOBe0FXBBuqkjmJ3nIKL+JQPzKOdCfX+XzDP1cXZe1WTu5gu/Bs5AkztccvKCXc31zDo3UOIcePzvgc3QMMzvyMEUFQYiF42gtxcjpPj2TlGNNMf7J2xchhxXWu8V6BElusYKyCVLNeaJpss40lGWScmQx1PqetLbZt7B8TVl64jEI4OYxVkz1pNlBG+P2Yl2rD8cEbOShlts4x03ZS0RCZJXP75DOChpNzhJL4K1Pa54ul7mVgh4lWEsZVMSL0nfL2BfCn1JYEKHKjJebxvn6ItFqW2ejjbw4l1xYkM1YdvBy1hdD9jpEmrj9jSJyBuJWs8OTtgmIIfEas
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0ZkckRkVkVnUjhHU0Z0aHRDcEVhWkdXRUZyQkdYTlFzQmR1S1VpTXVxUXZr?=
 =?utf-8?B?a2Z2UHYxcE5FaUZDS3l1MHYydE1UKzRYdy82TVRjaW9xaXh1WHBhZDlXQkRF?=
 =?utf-8?B?STMwTzQ2dDc2cXlWa1ExM0lJeEpjejNSeDhvN2ZVOHlMRmJOcHpxQkV6VDhS?=
 =?utf-8?B?eVRPbU5ZMWpPdnE0M3BWVEVHd3EyenRmSkhOZjdMTUVBWmJLc1VoZDZoY25n?=
 =?utf-8?B?L1lQMUZCb055NkVXUUVoTnBJL0cwWSs4L2VBRndrcDhSUDNYTVdPaUxLdE9q?=
 =?utf-8?B?MXZ5ZEg3NGdDUkpaaG9ma0svRi9Qb0dTcDd1aWRZbXQ2WHFhRmxZblBmT0lk?=
 =?utf-8?B?Yis0dFlmU0xJeXh4VkY1bTBqL1JGK3ZHeHMyVlBNejR5ZVBiS3Z6R1ovTkln?=
 =?utf-8?B?VmJSU2hETEF5TXovbTEvTEk2LzlkUVNFOTAvS1VIRHlXNFdXdU5VdzMremZs?=
 =?utf-8?B?cGdqOTVVMFJpL3dRZUIwMkdRTzExUWlFekFMMERwU0RvQ3BhNTR3UzlsSVRR?=
 =?utf-8?B?OCs1VnRCSjVpZEtHOGpyZCsxSklvaS92eWt0MTNaYWovVnNQVnA4M3BWTUpa?=
 =?utf-8?B?Qm1JTStqaXp3SFpvdkFTV0xyd0k5UWlYL1JuZTRnclRSaFgrbzFBVU1Zc1hI?=
 =?utf-8?B?OTRoZHN1QnRhNUpSSzN2REMrclhmNEQvcjZEeDRBRkNva0t4S0RpYlYyWUZx?=
 =?utf-8?B?L0RadHMxZ2x1UVg1b3BicjdHSWpwTjlOalVrLzZNTXJTQVZBOXBJUHh6a1Nk?=
 =?utf-8?B?QVMzamZkRjNWRWxxZTVyNEJIeERrRjQ2eVp2bnV0cXY5dkhTc0JlVXFhdWtC?=
 =?utf-8?B?SUp6VmdxS1NVaGVkbDJyWlRLVzA5MDhxTWVrK0hjSFBhazUyR0pGeVdTTjYw?=
 =?utf-8?B?ZU1uOThRendyYlZ3L3VBQ3hHeVFTaVJpK0sxMGpxOHJncDhPUFFVWmNuSjlV?=
 =?utf-8?B?RzAydmo2UjBqOWRsYUM0VHhxa2hkMldDKzgyWUtWOTN4ckFGTjBWbVNxL3Bx?=
 =?utf-8?B?QXdvUVZrTlp0UXl3cHVSTFNxdTl3a2N3UWE0QUg1K20weUIvd3dmckl3M1V1?=
 =?utf-8?B?RVV5YnJqRU9pamdaYlR1MkZZa0MzS1BRZkZUcGlQUlRLRzVTbnI5VDl3Ym96?=
 =?utf-8?B?ZHZIU1M3dTR2MXEzQVNOay90Y2dFZm1JWDdZdmxtUFN5UjlNR3AyR0NuUWhq?=
 =?utf-8?B?Wk1PN2RzV1FqYnd0NEpudlBTeXdpV0plMFRZcjhyejlWU1FlOEJWTjYwNWtD?=
 =?utf-8?B?RCtKUGhJWVpMQlR5dFdoaE1zcmNwQmJXK2dMaUZTYUNPK3ZuUVhWeEVJNlMw?=
 =?utf-8?B?QmhMTGloZG1HV0tWSUtIdnMxZ3g0cnpra29kQWhkNmhROVdHa1ZZZXFnSUxG?=
 =?utf-8?B?anpreExZNUk4QnFGVFplVlZxdlhPWHppNEtKUXBSK3BJbTI1ajJLSXJ1SkFE?=
 =?utf-8?B?YitpNUR6VTVhcnhNSjZ0TGtYY1cyd2tLNHd5eDI4a1k5RGZJR3I0ais4TERk?=
 =?utf-8?B?TEpGdWZjcGkySnNWWkpvNm5NUTMyRlRTdi9FUmRKaXc0RDg3N0tJb1hzNk9B?=
 =?utf-8?B?QWgrelJKeHJnbHBKcWtMc3V3Mmc2YUZmdUx0aTJ1bU5pSE04NC9yMXEvUTdl?=
 =?utf-8?B?elh0dlJyN0IwNDdoLzAwblYrZElyam4rM1BrZnRiVEs5ZVNJdGRkanp6WFFT?=
 =?utf-8?B?a2hIQm5XMER0QmJHMlZiejAyQ25iQjNqay82UWpEOXRCbWtUTlAwRXgranJu?=
 =?utf-8?B?ZFYwWFMxM2o1OWh1b2J0aU5QTExGenBsR3ZmcXNyTktBRllmK0p3Sk9tY3gy?=
 =?utf-8?B?UWZhRU80bUZFN0taODlidVEvRmZYVXNXVjJ4OFdWU3dndVFDdVNQTDFvblhJ?=
 =?utf-8?B?bGwycERtMnlZcW1pOVFUSnp4S0Q3ajJuTFlsTTVkbll2Z0Y0RGJSQW1QdUhu?=
 =?utf-8?B?RVR6a096TkxYNUlnVGI3MDQ5TGZ3QWZKK2hITzhPZWJNUTdiZHM1T3lheHcv?=
 =?utf-8?B?SFo4eWdHT1I2eHZPSm1UYXltN05oaXFVL2k5ajViSWpuNWJ6RTEzb1NiaUUr?=
 =?utf-8?B?Q0V4cGQvRVBEbkRnNmRRRTJJUzkwNkttZy9PelFScGVKc2RSKy9pWkZULzI0?=
 =?utf-8?B?ajBTU2M3Z29yUTNTNHJ0Q1I3OWZteVhvSnlFSEtZdi93R2ZrVUNuT0tqV0tT?=
 =?utf-8?B?UHM2NmQ0Ymx3K3JDOGN4cGJqcy8zWnVKb01JQVhFTUlZTXRnWHZSVDlyb25q?=
 =?utf-8?B?TTV0Mkk5Wk9ScWI0MlpVYkVsT2FQTlRsS0lEOFlKaG14YmFJWDkyRDBmRmw0?=
 =?utf-8?B?dnJzYkkwRHU1d0ppOGdtcktwM0VIaWFWUWhiU2k1TDVZYkdDZEtrUT09?=
X-Exchange-RoutingPolicyChecked: XWmXH+s0iWHBPuECvJ6uDyf5CKOuGMZFDO9K3Y1Bi6NNA+UwyV65wXaFfNkKAiDil3iB+QYB6I6iM1eLyD9ykjITY8Y0yPy4OGvrJMw7EWDebJRcf8AR4HulFl4FPwhN0UVq6U9biAMUua1pu8yaSTY7hLtLmLSItpMagRlTHiUbPYqRrDelUuRT/xXvov5m2UkWNUO3LbcAtwWBly4QprgXtijeFQW3Y6zYMXYOG31fur249Iu0Y2AbGjcVp1WTTWGaHRSD50y5crywVldBLSz2z2E3+P2W//rHB4JaWvutIFU7LNjAlGz3GP0bTT/pcHsdDOEeTnqBeZzT2KfOXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1fc6ef-19a1-4973-06a4-08decc51f8b1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 09:22:37.3346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIJMMmdkaNU4RqRJd2VGRRr+oY9/wIxg1OecWw/XVbgI5sszfCgHl8nDsORhZHfMLNPzpoeL3+05PADes9x7bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8790
X-OriginatorOrg: intel.com
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


On 6/16/2026 2:36 PM, Jani Nikula wrote:
> Fix last pipe check for non-consecutive pipes. In theory the check could
> be too restrictive for fused off pipes, but it's unlikely we've hit the
> issue in practise. It's better to be pedantically correct here though.
Typo: practise -> practice
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_kms.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c289d76d16e2..e82d32130666 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7344,9 +7344,10 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
>    */
>   bool igt_check_bigjoiner_support(igt_display_t *display)
>   {
> -	uint8_t i, total_pipes = 0, pipes_in_use = 0;
> +	uint8_t i, pipes_in_use = 0;
>   	igt_crtc_t *crtc;
>   	igt_output_t *output;
> +	enum pipe last_pipe = PIPE_NONE;
>   	struct {
>   		enum pipe idx;
>   		drmModeModeInfo *mode;
> @@ -7355,9 +7356,11 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   	} pipes[IGT_MAX_PIPES];
>   	int max_dotclock;
>   
> -	/* Get total enabled pipes. */
> -	for_each_crtc(display, crtc)
> -		total_pipes++;
> +	/* Get last pipe */
> +	for_each_crtc(display, crtc) {
> +		if (crtc->pipe > last_pipe)
> +			last_pipe = crtc->pipe;
> +	}
>   
>   	/*
>   	 * Get list of CRTCs in use those were set by igt_output_set_crtc()
> @@ -7401,7 +7404,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   				 max_dotclock, pipes[i].force_joiner ? "Yes" : "No");
>   			kmstest_dump_mode(pipes[i].mode);
>   
> -			if (pipes[i].idx >= (total_pipes - 1)) {
> +			if (pipes[i].idx >= last_pipe) {
>   				igt_info("pipe-%s: Last pipe couldn't be used as a Bigjoiner Primary.\n",
>   					 kmstest_pipe_name(pipes[i].idx));
>   				return false;
