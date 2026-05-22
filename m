Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A531CD5BAC
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 09:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E659210F51F;
	Fri, 22 May 2026 09:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exTF/eL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5063510F525
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 09:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779442458; x=1810978458;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vB8KPwADq4HwScWPgLghT7B3+aXcrANqbq7tJV/AM3I=;
 b=exTF/eL0zDs+0EO8XO7QYft+QSdyS4dJeHBV5eSZuWEJehRc3vj5JJWD
 Y5knBzd8LLuqr7oenOxmCvU7gJw4cstzKfH21Hr/fKyMkfJNdavFqC3Ck
 trujV5GRZkSu1Mm7jx03UyNr2EE4JP/U5goy+XwDR8Om+gXiEU1dwUMhd
 XBu33yRvH9hqeJh9a+AXe3yGf9f6keb0A4vvxepy8IvF9tA327mH2LS+/
 LvFrIV3J0PwoLf8hGM67RYhq//Di7Ki9Tnmq44LaiDbyw+8vwceFbFVvM
 IL8ZkTWHmG4twDg1JX9WqQ3YZcwzE1nAu9QffhGhr89toa6eGu6ruA+6w w==;
X-CSE-ConnectionGUID: GRjxwuiJSa6lB/i+p59+2g==
X-CSE-MsgGUID: oeljLWkpRjaw8fhZ+Rv6pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80339789"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80339789"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 02:34:18 -0700
X-CSE-ConnectionGUID: /HjXl4pEQEutAkXS9rIKtg==
X-CSE-MsgGUID: cwRbBF4JQ/yG70kHBNDQyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="241096792"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 02:34:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 02:34:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 22 May 2026 02:34:17 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 02:34:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5ELv2M7Zz30HgCRdBq08IjVt358x/SC1V/GTE+bquEolTrjKucS3i/9BBAXzBtLFGjxNZ4zD5kY8iJepsx1c5IYsjbXa4lWtqNPF/B7swXI6zJqw0In4ieYCNPgQ99vA/y2O5VJH0qMNAvCA19eP6OeORcnkedzWk/DwSuI2GhyNHOUeV4AG9X6sVOgsYY29EP7KsXyVQCxw0DCnsIgm3+bGzzJzp+SwuD0GBePKyQOVGRk+urTkv3FfmcpE34TAc5JDR4vUwyJrZw0FBoJim8E5rLIbHabsWfk4MAWPv+evYXyJRIZNTKquXlYabr2kiw8GnX5j7mOlfP2GiCnew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iudba5PbyS5lTGEvTYzDmVd30ZexZ1d5sf7S6AhykGE=;
 b=JcW2/FELTGPc9XueGC0OYoRMPHHNVKkcqsGvvlkT6y9uMjx5/xzD/HgjtEsY/yORajRSiO2FHkLoFuwO7Ut1w3v9SpZFnWEUYAr86p7XVRr2YZ3bz/DjjyoAFF6b2HGlBRQTRQnEA4BIJKSd1KcJktBbZK/a156fYXzG1ZGIeUlLqjoGuHViNx6n24axa+JPEEfz3DTw0j5zMUiMiJqen1eacPywnp6ueCZ5Y2pbvPuGR/ESTX3yvBA9s9voCA37CHBq39FYHGs+DODBWNJnc2ug+lQXiwv42gtG2fdtB4D0Sf8g1EP6HkrJdAtnGbitmh82ziE/uiJuQyzb9Gs5kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 by DS3PR11MB9866.namprd11.prod.outlook.com (2603:10b6:8:366::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 09:34:13 +0000
Received: from BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::f19c:833c:9f41:f3de]) by BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::f19c:833c:9f41:f3de%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 09:34:07 +0000
Message-ID: <e4fd9496-2ca5-4c8f-b2df-7bef8dc67815@intel.com>
Date: Fri, 22 May 2026 15:04:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_rotation_crc: concurrent cursor
 movement with rotation
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>
References: <20260409044855.191421-1-santhosh.reddy.guddati@intel.com>
 <DM4PR11MB63122829F106339430D9815990002@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <DM4PR11MB63122829F106339430D9815990002@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To BL1PR11MB5302.namprd11.prod.outlook.com
 (2603:10b6:208:312::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5302:EE_|DS3PR11MB9866:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd711af-f9b3-4b7d-86a2-08deb7e544e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|3023799007|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: hzV5FAS2rjrdogE5d96DUfR6YiKIsAwrNgE0TUygkKscER/Ci5isq95lMLlPUfofClFyqqh0/o4eAhD3AVl4guBoSb3an00LGbVJWAEiS9M+0/gzw8oq46x/TkBOrIMEu0ilonHuGFEuGVjShBJOAo8kHOgo3Ea7yt7A/6kzVzSjaXj9tMzF2NZxX2YNViaCAYReK6NUSo9lw5h/64XEv9xPaJhrni5WSmx4adzmvYKX/Ey/1CIV1EJsZ9AFW1VVezgK02kk/8V+tbWitCrIaWKF3k1Ua8lIQwP+wEzoTeL/TG0MfVgzAMoOQzCV56gduV+w75awnFSKNA4adbFOdZjEky6m0SazMyf2ewszmiOh0sE/clrxl3xZczK2In4H1822YR9JexnnPj86+dNdeKwogMXHLRqgkhwqGGqwGZ+ncrkaSqpy4VUG47v6fYSqodr9N/5/uVeKPAJrmAqLLf0zXhjedRj/FlSa/XZS7pbHiREoF4Swx3JGYtthtI6FDQkzPVUpWTZpnTjH/s8c76btipqMYRZMIsbFKKBICB1dGh49swr652vC4uwManY6AS1pYG+0PH2KWpcZrlO6aubGgPDbf6lJE+WEVlOM7ffQIQLte5OBS7FQ+BH8c2VbXvWS2s13SZ3aEm4cpN/5uLQBnpTo1yf+AmT3cfyz+2hAHnNgVavR/8oIY+iiSND/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5302.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(3023799007)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enVwZ0hkeWlmN0xrNWozN2l4MVZUK2p0TldaM1h4VDZhZmo3d3UxcGhra2Rv?=
 =?utf-8?B?bVp1ZG5yR2RYMXcrNWtRVjd1WVI3bTFQakZyTzErNmlGdDhFbnVNaEoxNGh4?=
 =?utf-8?B?c1ZqWHpjbkdDWGp0Y3RYV3c4MEd3bW9Sd0VEeWxUOFJqK3NWa1BRU1VRbU03?=
 =?utf-8?B?RCtrK3lBMENONUo2QjJFL21LZU5hekZaM2tXdmx6bGdyVE1QR0NZREJjN3JM?=
 =?utf-8?B?bnlzWDJyV1U1U3FEQmMvaDFNQjlFd1NiL3BESzQ5dXZGcmp6UVJRWDRwME9X?=
 =?utf-8?B?NGVRUFdnWmc4eUlmbUVyQmFYNXFvbHYrWVdYWDgrenJ0ekM4TE9aVjd2S09I?=
 =?utf-8?B?eXpWcHNPZ2RVUmV6VlJrQkFZbHRsR0FpZEhOYWFnaEkybE9ub2tsNHJFa3pK?=
 =?utf-8?B?dzdWZnFzQXhTckFiSDFicEFqTzVITUNsWkt5Z29rRkMvcXFMU3lEZlNTRHpX?=
 =?utf-8?B?V0pnMEVnbjd5Sjg0VVlMZFlHUnQ0UUp1NkdWUnRJTG5JalF6MFlpRXYzVEFk?=
 =?utf-8?B?ZEE3Tmo3bXc0cmZlcjM1VU5Ud3JFQ0hEeTdKeGZEVGhjdWRwbkpyL0pSbDdk?=
 =?utf-8?B?UmRUcmFzaWxoRzJxQ0YrM0U5SjQ1YTdRRWhHRzZJSkt3TTE3cm9yQzhOYTRW?=
 =?utf-8?B?aTVXNHpnckRjT0grVnNrWFhuRE8yWDlMWWFXVDFKSndscWVhS1JGZktoRmJX?=
 =?utf-8?B?cHpZOGdXb01aMEtTVUFoUjBPcDJOSTRGN28xSXVScVIzdUJHM3UwSzJ1MHJw?=
 =?utf-8?B?QWs4RGYvTWJtTTc1WVo4MFlkaGpCczRRMmdFMy9uSVlpVmlneENydGdzQ0xO?=
 =?utf-8?B?QThibm5UUjJ2UWU1N1U2UXFRL0lrV0kwbit1cjZwaGp6MzJLRUZtVi9ERU0r?=
 =?utf-8?B?MzZSb1huSWFodTVldEFIUzlTb3FtY0NEVlBXd0FCTjJBckxuOXkzMStCbkRr?=
 =?utf-8?B?VkN1ZmVBc1I2OXgvYittczZDR25Hc3BBNk5aZmxjckhnY09WdVFWS09LY0Iy?=
 =?utf-8?B?K3VwMEszWDFibFlkVVNMNWo0NjhRSjRlQXU4d1hxRWRncjRkM1ZKSUtBL2tl?=
 =?utf-8?B?aHFwdFJyOUVCdjdtcXkrUlF2U3FDN3hQcUZ1bkRTZ1RRcGVhT0dzVTlSbUtx?=
 =?utf-8?B?eTdBdWhPRHhXTlBIL2dvaWNTOS9nMGhkOUVmUFkzV2RLQWh5Rk50TDVQcjJo?=
 =?utf-8?B?b0g3ZW9Vbk1DZkloaFhoZDEyVWE1TGNrVWFLZ2cvQkwvZGU5aWtDdjduYTNV?=
 =?utf-8?B?LzRkUTV4WTcwRTZ1dy9aYUZteW9UQkFORlIyQVlVa2JUOWlaZk8wbGVXNVJx?=
 =?utf-8?B?eFd1di9QeEFZSnpncDUwdjFTZGczK3JXTmZIVWwwOHVkMStRWlI1amdiSDFY?=
 =?utf-8?B?ajNUdUFUdmZLQ2QyZHc5UW9KVXNUNmZ4U1FSYlZvbm44bVVCM0VieUcvaG0y?=
 =?utf-8?B?czNqYXJSNmtYSEVWZk1FU1NUOG9pZjNXUFdCalN4d3pnWkdxZUYrTTF6Y0o2?=
 =?utf-8?B?aGJzL3ZKck5MQVA2MXJ2Z1ZpdTJiajl1azRMdTJQOFZHanEzcUNrQllWSmg5?=
 =?utf-8?B?YXYzLzBHMTJtOStQOXhUNkNWTWRmVzEwYU03emFXMVJsUmFXWndBVVNrREth?=
 =?utf-8?B?NnpOYVRWQTd4T3Y4bTBLRUUzYkpQRFhic0phOCs2dUhFenhmemwyemhUem5D?=
 =?utf-8?B?aCtTUXZHSk5mK3ZqYjFtQ0g1WXFjbjR1Z1NnWHBGM0RGM3A1U05UUkQwc0o1?=
 =?utf-8?B?bnducWVjZVVTWkExWVo0TUIzRCtUc0pCMkRMbEtYdnZyb0Q5U01Xa2h0RllG?=
 =?utf-8?B?QzV6MTJkNVdNVXNPaVhIT2VlYjVEOVpSUkFqQ0NKRkhINHVrTm5UV2RUd2Nk?=
 =?utf-8?B?QzJWaExTZDlxUzdlZUFpeWZaR1ZZejRycFpFWnVTWHNCOXZReWcvVkpPb2JE?=
 =?utf-8?B?NWk1ditjamhCNWVjQWJOd2MxRzUxZjhPWEVpaC9xVFlqQTdWMjYrZzlsZHh2?=
 =?utf-8?B?Ry95bktsS04zREJwaGdjOFV3eU50dHVpZzgvYXVWU0lXMjA1cjlrV3VwZUht?=
 =?utf-8?B?QklPTUZUWlJEL0E5WklWeDRLOEJpWFNMbUFKSHZ0dVpoSzh1QUkwOTM1ZVNy?=
 =?utf-8?B?eDFWVk95U3FSZHZFOWFJa05xY2Q1ajg1R3oyTUFDbkFlTmhVUUlXYkNBMi8r?=
 =?utf-8?B?aEoxdnlvMk9ram9uUlJDS2dlRXFNYTVDTm40TXl0djYrYThHMEJBbzE0VG1w?=
 =?utf-8?B?R28zR0Vnak14bGhNblViRlgxamdxWUhLeS9XenlhRmtJUkNHSVRNQnB1dStK?=
 =?utf-8?B?VkJrSE93c3p0QWJyQ1lHTXhvSGZGU0RLZ3BBZzN5MjlDWnFYc2dBM1U5WFhG?=
 =?utf-8?Q?o/e9lvP8/eD8Di/0=3D?=
X-Exchange-RoutingPolicyChecked: YtQqIpsUzMbLK9Knok+hNKh9T6YwKX9sk9X1eSb+aLrbaPvxbhbG4/LOgKI+SINHMLyPTrPXgpbB++m9AYdJpS0RqJmL41f6YcaWD3qkb/3oSHmTD8kMtDaJi4l5wRyaGP4gtezWWKm2Vj1n4ZjzCzV8QhRFwIecxxAZ1KSBIkp5a5BJiXF6hjvqgMiDcdSxsvpSyPevlEK8Wl2YBZsDOIF86hjFCeBsBIJ0SNERyd1kVBx5D9+KSwcrRxvXUlbJBB0hgnux0LcsvxPYY5mieo4vXfryeAB/aV9kfjk3w3QAyPle6OvaFlUqpsUkEs4QXPiLDCtAzvuB+ZDhTBhXpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd711af-f9b3-4b7d-86a2-08deb7e544e8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5302.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 09:34:07.2213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zq1z3Tu4+z2s4vQQES+o7m4EKFuKKmTfalqDbEJ71Mv10s6sC1XBUVftyE2OEQbgiqR0K/wrnuF+o0JUT1C3Yta4qMnWo9USDZZR3g3/YW5IR0P4P6HDXeecuX6ZlxQZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9866
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

Hi Jeevan,

On 19-05-2026 13:14, B, Jeevan wrote:
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Thursday, April 9, 2026 10:19 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Samala, Pranay
>> <pranay.samala@intel.com>; B, Jeevan <jeevan.b@intel.com>; Reddy
>> Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v1] tests/kms_rotation_crc: concurrent cursor
>> movement with rotation
>>
>> Add a new subtest to validate primary plane rotation 180 degree while moving
>> the cursor across the screen.
>>
>> Use a triangular pattern fb which is easy to identify rotations on the plane. Use
>> CRCs to verify the plane rotation with cursor movement doesn't cause artifacts
>> on screen.
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_rotation_crc.c | 193
>> +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 193 insertions(+)
>>
>> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c index
>> 4420053f1..4002eee55 100644
>> --- a/tests/kms_rotation_crc.c
>> +++ b/tests/kms_rotation_crc.c
>> @@ -68,6 +68,13 @@
>>    * Description: This test intends to check for fence leaks exhaustively
>>    */
>>
>> +/**
>> + * SUBTEST: rotation-with-cursor-movement
>> + * Description: This test draws a simple triangle on the primary plane, rotates
>> the
>> + *              plane by 180 degrees, and then moves a cursor through different
>> + *              screen positions.
>> + */
>> +
>>   /**
>>    * SUBTEST: primary-%s-tiled-reflect-x-%d
>>    * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
>> @@ -274,6 +281,81 @@ paint_squares(data_t *data, igt_rotation_t rotation,
>>   	igt_put_cairo_ctx(cr);
>>   }
>>
>> +static void paint_triangle(data_t *data, igt_rotation_t rotation,
>> +			   struct igt_fb *fb, float o)
>> +{
>> +	cairo_t *cr;
>> +	unsigned int w = fb->width;
>> +	unsigned int h = fb->height;
>> +	rgb_color_t color;
>> +	int i;
>> +	bool rotate_180 = (rotation & IGT_ROTATION_180);
>> +
>> +	cr = igt_get_cairo_ctx(data->gfx_fd, fb);
>> +	set_color(&color, 0.0f, 0.0f, 0.0f);
>> +	igt_paint_color(cr, 0, 0, w, h, RGB_COLOR(color));
>> +
>> +	/* Build a simple upward triangle using horizontal strips. */
>> +	for (i = 0; i < 9; i++) {
>> +		int strip_h = h / 14;
>> +		int y = h / 8 + i * strip_h;
>> +		int strip_w = (i + 1) * w / 14;
>> +		int x = w / 2 - strip_w / 2;
>> +
>> +		if (rotate_180) {
>> +			x = (int)w - (x + strip_w);
>> +			y = (int)h - (y + strip_h);
>> +		}
>> +
>> +		set_color(&color, o, 0.0f, 0.0f);
>> +		igt_paint_color(cr, x, y,
>> +				strip_w, strip_h,
>> +				RGB_COLOR(color));
>> +	}
>> +
>> +	igt_put_cairo_ctx(cr);
>> +}
>> +
>> +static void collect_current_crc(data_t *data, igt_crc_t *crc) {
>> +	if (is_amdgpu_device(data->gfx_fd))
>> +		igt_pipe_crc_collect_crc(data->pipe_crc, crc);
>> +	else
>> +		igt_pipe_crc_get_current(data->display.drm_fd, data-
>>> pipe_crc, crc);
>> +}
>> +
>> +struct cur_data {
>> +	int x;
>> +	int y;
>> +};
>> +
>> +static void set_cursor_positions(const drmModeModeInfo *mode,
>> +				 const struct igt_fb *cursor_fb,
>> +				 struct cur_data positions[5])
>> +{
>> +	int cw = cursor_fb->width;
>> +	int ch = cursor_fb->height;
>> +	int edge_set = 16;
> Replace 16 with a named constant or macro (e.g., CURSOR_EDGE_MARGIN) for clarity.
Sure, Will change this in rev2.>> +	int x_min = edge_set;
>> +	int y_min = edge_set;
>> +	int x_max = mode->hdisplay - cw - edge_set;
>> +	int y_max = mode->vdisplay - ch - edge_set;
>> +
>> +	x_max = max(x_max, x_min);
>> +	y_max = max(y_max, y_min);
>> +
>> +	positions[0].x = x_min;
>> +	positions[0].y = y_min;
>> +	positions[1].x = x_max;
>> +	positions[1].y = y_min;
>> +	positions[2].x = x_min;
>> +	positions[2].y = y_max;
>> +	positions[3].x = x_max;
>> +	positions[3].y = y_max;
>> +	positions[4].x = (mode->hdisplay - cw) / 2;
>> +	positions[4].y = (mode->vdisplay - ch) / 2; }
>> +
>>   static void remove_fbs(data_t *data)
>>   {
>>   	igt_remove_fb(data->gfx_fd, &data->fb); @@ -1160,6 +1242,109
>> @@ static void test_plane_rotation_exhaust_fences(data_t *data, igt_crtc_t
>> *crtc,
>>   		igt_remove_fb(fd, &fb[i]);
>>   }
>>
>> +static void test_rotation_with_cursor_movement(data_t *data, igt_crtc_t
>> +*crtc) {
>> +	igt_display_t *display = &data->display;
>> +	igt_output_t *output;
>> +	int tested = 0;
>> +	int i;
>> +
>> +	igt_require(display->has_cursor_plane);
>> +	igt_display_require_output(display);
>> +
>> +	for_each_connected_output(display, output) {
>> +		igt_plane_t *primary, *cursor;
>> +		struct igt_fb ref_fb, hw_fb, cursor_fb;
>> +		drmModeModeInfo *mode;
>> +		igt_crc_t ref_crc, hw_crc_atomic, hw_crc_seq;
> Maybe rename to hw_crc_sequential for clarity.

Sure, Will change this in rev2.

>> +		struct cur_data cur_positions[5] = {};
>> +
>> +		mode = igt_output_get_mode(output);
>> +		igt_assert_f(mode, "Failed to get mode for output %s\n",
>> +igt_output_name(output));
>> +
>> +		igt_display_reset(display);
>> +		igt_output_set_crtc(output, crtc);
>> +		if (!intel_pipe_output_combo_valid(display))
>> +			continue;
>> +
>> +		primary = igt_output_get_plane_type(output,
>> DRM_PLANE_TYPE_PRIMARY);
>> +		cursor = igt_output_get_plane_type(output,
>> DRM_PLANE_TYPE_CURSOR);
>> +
> Imho, We can query if it supports format and modifier for cursor:
> if (!igt_plane_has_format_mod(cursor,
> 			      DRM_FORMAT_ARGB8888,
> 			      DRM_FORMAT_MOD_LINEAR))
> 
  Since cursor plane basically supports only DRM_FORMAT_ARGB8888 and 
DRM_FORMAT_MOD_LINEAR, I think it is redundant to check for the 
format_mod.>> +		if (!igt_plane_has_prop(primary, IGT_PLANE_ROTATION) ||
>> +		    !igt_plane_has_rotation(primary, IGT_ROTATION_180))
>> +			continue;
>> +
>> +		prepare_crtc(data, output, crtc, primary, true);
>> +
>> +		igt_create_fb(data->gfx_fd, mode->hdisplay, mode->vdisplay,
>> +			      DRM_FORMAT_XRGB8888,
>> DRM_FORMAT_MOD_LINEAR, &ref_fb);
>> +		paint_triangle(data, IGT_ROTATION_180, &ref_fb, 1.0f);
>> +
>> +		igt_create_fb(data->gfx_fd, mode->hdisplay, mode->vdisplay,
>> +			      DRM_FORMAT_XRGB8888,
>> DRM_FORMAT_MOD_LINEAR, &hw_fb);
>> +		paint_triangle(data, IGT_ROTATION_0, &hw_fb, 1.0f);
>> +
> Cursor size is hardcoded to 64x64, hope its supported on all platforms, else we might get invalid args.
> If possible we can utilize plane_rotation_requirements function.
>> +		igt_create_color_fb(data->gfx_fd, 64, 64,
>> +				    DRM_FORMAT_ARGB8888,
>> DRM_FORMAT_MOD_LINEAR,
>> +				    1.0, 1.0, 1.0, &cursor_fb);
Will use plane_rotation_requirements in v2.

>> +
>> +		set_cursor_positions(mode, &cursor_fb, cur_positions);
>> +
>> +		for (i = 0; i < ARRAY_SIZE(cur_positions); i++) {
>> +			int x = cur_positions[i].x;
>> +			int y = cur_positions[i].y;
>> +
>> +			/* Reference: SW-rotated triangle, no HW rotation. */
>> +			igt_plane_set_fb(primary, &ref_fb);
>> +			igt_plane_set_rotation(primary, IGT_ROTATION_0);
>> +			igt_plane_set_fb(cursor, &cursor_fb);
>> +			igt_plane_set_position(cursor, x, y);
>> +			igt_display_commit2(display, COMMIT_ATOMIC);
>> +			collect_current_crc(data, &ref_crc);
>> +
>> +			/* HW path: unrotated triangle with HW 180 rotation.
>> */
>> +			igt_plane_set_fb(primary, &hw_fb);
>> +			igt_plane_set_rotation(primary, IGT_ROTATION_180);
>> +			igt_plane_set_fb(cursor, &cursor_fb);
>> +			igt_plane_set_position(cursor, x, y);
>> +			igt_display_commit2(display, COMMIT_ATOMIC);
>> +			collect_current_crc(data, &hw_crc_atomic);
>> +			igt_assert_crc_equal(&ref_crc, &hw_crc_atomic);
>> +
>> +			/*
>> +			 * move cursor first with no rotation, then
>> +			 * enable primary rotation while cursor remains active.
>> +			 */
>> +			igt_plane_set_fb(primary, &hw_fb);
>> +			igt_plane_set_rotation(primary, IGT_ROTATION_0);
>> +			igt_plane_set_fb(cursor, &cursor_fb);
>> +			igt_plane_set_position(cursor, x, y);
>> +			igt_display_commit2(display, COMMIT_ATOMIC);
>> +
>> +			igt_plane_set_rotation(primary, IGT_ROTATION_180);
>> +			igt_display_commit2(display, COMMIT_ATOMIC);
>> +			collect_current_crc(data, &hw_crc_seq);
>> +			igt_assert_crc_equal(&ref_crc, &hw_crc_seq);
>> +
>> +			igt_assert_crc_equal(&hw_crc_atomic, &hw_crc_seq);
>> +		}
>> +
>> +		igt_plane_set_fb(cursor, NULL);
>> +		igt_plane_set_fb(primary, NULL);
>> +		igt_plane_set_rotation(primary, IGT_ROTATION_0);
>> +		igt_display_commit2(display, COMMIT_ATOMIC);
>> +		igt_remove_fb(data->gfx_fd, &cursor_fb);
>> +		igt_remove_fb(data->gfx_fd, &ref_fb);
>> +		igt_remove_fb(data->gfx_fd, &hw_fb);
>> +		cleanup_crtc(data);
>> +		tested++;
>> +	}
>> +
>> +	igt_require_f(tested,
>> +		      "No connected output can be tested on first CRTC %s.\n",
>> +		      igt_crtc_name(crtc));
>> +}
>> +
>>   static const char *plane_test_str(unsigned plane)  {
>>   	switch (plane) {
>> @@ -1359,6 +1544,14 @@ int igt_main_args("", long_opts, help_str,
>> opt_handler, &data)
>>   		test_multi_plane_rotation(&data, crtc);
>>   	}
>>
>> +	igt_describe("Rotation test on primary plane with concurrent cursor
>> movement");
>> +	igt_subtest_f("rotation-with-cursor-movement") {
>> +		igt_crtc_t *crtc = igt_first_crtc(&data.display);
>> +
> The test currently runs only on the first CRTC. Consider iterating across all CRTCs for broader coverage, or clarify whether testing on a single CRTC is sufficient.

To be in consistant with the other subtests where only first crtc is 
used, I have adopted to use a single crtc.

Also cursor-rotation-180 has the coverage on multiple crtcs,
The rotation + cursor is crtc agnostic, so single crtc is sufficient.

Thanks,
Santhosh

>> +		cleanup_crtc(&data);
>> +		test_rotation_with_cursor_movement(&data, crtc);
>> +	}
>> +
>>   	/*
>>   	 * exhaust-fences should be last test, if it fails we may OOM in
>>   	 * the following subtests otherwise.
>> --
>> 2.34.1
> 

