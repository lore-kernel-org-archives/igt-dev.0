Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8874BCD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 05:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386A810F877;
	Wed,  3 Jun 2026 05:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uj+NIi60";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FFD10F876
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 05:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780465653; x=1812001653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=391R1y/FbCBJwHzDWXxTUQXQ6rQE4FTP0AN5G4HysRA=;
 b=Uj+NIi60llokj15S90c199yTQ+hydrZfpi1VF2AQm4HNTPAzD4+93CVh
 y/uUDMzU3WEK0oV0PwCSg8+qQfh/PgMnqHXgl1TDMuBhbm1p2RnWucs3Z
 iCppucPxiRmEMnhpyeCG9y0T+onUdpcgLlL0QB/l7stgNoETEIywnIDqB
 9UGIq+Qbxp60hsi/xcaobK3rCQKt3EnlOuYehWD+c9ANk9cxoLaX3bsHI
 i2Srasd87y3Bbqp1tm0Yh4fR1yKfV5Bjgny1YkaABD/gMA2hG1Y2uEyka
 /hqWPEVSoTe/jfvrcwBYhdWcYzluAVjuGMYwivGxJWqZeZ2VDeExCujQc w==;
X-CSE-ConnectionGUID: 0L8A6f/GROaf6JhYJZjNlg==
X-CSE-MsgGUID: 5+8t+kLoQDS6GLibzienrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="103924037"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="103924037"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 22:47:33 -0700
X-CSE-ConnectionGUID: 1iKPx1ZLS4Sbs+sTeX9Axg==
X-CSE-MsgGUID: wE75BzyESXyouz2bv6ExjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="268000484"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 22:47:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 22:47:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 22:47:31 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 22:47:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kj2fOcBwVqKWSXG/6fgtnoSwKUcRkyz4Js3oLXfKTYvXoRJ59pr/SUIgLLeIwSTNIjCpjVPogJxMHEhvYP6DZo+xf87zqod6yteFgpv/NE/+PdZEpRP2anfUwTckbhgY7ZSvooXb+7zcabkitxF4mP19SfTvlst3pNsM9D4OteGRs8IM5ENC4s4Bnq1QHgbML6rwyirB/2LX+43okpWumSdU/zH7BOrJERwhq2ptPHz2jAyQkeW7e7upPOk90829q66Erd8QUj+NxhN+/N5YfZkP94X5JtAjpCLGGL+JdR6wUPxuL/g+96ECDw19fDIBvR3Sf6Kcl8dRaa+RDtoRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+MZb37uS1g95rxO7VkKzWsWaVNk68qdiwOC26W606I=;
 b=pYblJdQneVcBWXXbkMEBWJ6T+Bm2xwtVHZNpBEFRRfVJeqgY0yrc7vp83bN5uoUENgfGwuzUMQLoVkCJ9xLGtihhAAWVHHWYWwJGJFTriTVNOJxt2UPnLP37oCFy7EDngJVgYMfQfB4hk5iyaVGtA44mIiwWOWL+fiyIUVquNxn8HrgYUhV/HVCmvXDsHGNnBJKttgCGNgdPgnA898WZaVnJFx1jJoG/1pJ5rYRHWRFrPdGzvMQOOarhslETtHzEaaxLNuI0W4+yDdpNQIuQxcIg5bB9HGSYHudozj+oPN3b7REPfSZvLgE3TFnm72dEFpTO7K+Gh8cb8l5B2NBMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by CO1PR11MB5204.namprd11.prod.outlook.com (2603:10b6:303:6e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:47:28 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0071.011; Wed, 3 Jun 2026
 05:47:27 +0000
Message-ID: <dd768531-19d0-47c1-a5e9-9cddcd456fa2@intel.com>
Date: Wed, 3 Jun 2026 11:17:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] tests/kms_color: Use explicit YCbCr
 encoding/range in FB creation
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260601082410.798948-1-pranay.samala@intel.com>
 <20260601082410.798948-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260601082410.798948-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0133.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::7) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|CO1PR11MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa8c693-f10c-477f-094d-08dec13397f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|11063799006|5023799004|3023799007|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: awiIDBMDh3HjPYKA5ztWrpzBSH2VCNoR6aYAWmlgAKBLRC09iqmOWeDUDY+7FrRkKre9QCOj9vyl+yzrkXwej17p6YZOIGy+RV8wjeDFS4BuyJNI8vaE5f3smAczR6b8FIlSPheIX1qUfkYUFCnRBR+joHT5j9CEJTbwhYDeiWd4ts3yDkLcq91wWv+2DY3KJacpx7BeS5RQ82wyv9kH08THuWMpusuwledJvHWB0h2QcwIbB+c+s/68vZ5QSAImRebkZSMdpDVo62+KGEe7/LkUVu/k0DUywnBG1etSEP7csvYM5Y+VU937gg8eFai7rRDKYkIb90IDon2Q6dbxhWzuF9ocf1GJczliH/Z3axckvPFaOceMdKNlF/rkxrmLvfLfMVoNPvVRvJucvKTkMHXypcsk+G13X14iMX9dY9691oAojWIb/3CFnoxDZokaucGlhsB8JMZUXdJyBMAiLZuVe6zUrJ5xaX2jOrpCdjFeLWvGRO25sQsJOdSyRjbzpVnD0Hzdi6Ll5K1wHflR6I6Zvl6bE+H/1gPcp1CFS/vjomONLZVGsmti6fKW7XDN7fORRBtNt0TphLF770jeWnlAKEL56cX6OkLs3e9vLY7e1jU7Vg1PFYUNpFHkgFtv4PKuEjeDw9Eb1D860paPMKkbOZkeTS1P7mb9RNHa8DD50l7NA1hRC53DD7EHSI9s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(11063799006)(5023799004)(3023799007)(22082099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjhzQ1dhTEluTDluWk5ndUJIU1N4dFdUOTRTZmpiTHhaMDVLck1tZzVGMUlW?=
 =?utf-8?B?aFZrYWJ6akdITVdqTnY0VTJiaUxrQlNqZnRlcTBDQmU0OWZITW5kSXFQNVVM?=
 =?utf-8?B?N1MrUkpnbWVxV2RWeXhYYVhVbGZDbnJNclF4dzNISEJaa2NoaWR5R3I1WFJv?=
 =?utf-8?B?ZUw0N1ZlUkRTcjVkc1hRbVR3Z2s0M0R4eDB2dTdHbjZaNmhHdXcrYzAwM3c3?=
 =?utf-8?B?eXMveis4K2l1eDdaV2tyWVZsYXRhQzArblYrSUpZd0VWSzN6Y1lXN0RKVUh0?=
 =?utf-8?B?VkZ0eXBJNUMvVDBBdWNCUjh5WHAzenUxRXBKNXBCZW00L1AxMUYySWxUZEwx?=
 =?utf-8?B?RE9uT2hxNGhYbWo0U2UwS1FhUkJCWm5OMlo3dTAxSDZZYzFZSDV6cW9RL2Vt?=
 =?utf-8?B?am9RMVJEWkQvSWd2Mkowbm9UNWdpVXhQK2ZUcjdSSmZCaUQ1RVgrZm5WVVZT?=
 =?utf-8?B?bVhaMEI4UTdyaDNGZ0VlaUZnVnRMYlFaZ0tiS205aFllZW9IQXAxL3IzRGli?=
 =?utf-8?B?bUVZb0YxelZ0OGRodVd4WC9zK25vK2xtQk83Wmcza0JoUFBxd2hickFnTFZX?=
 =?utf-8?B?UGo1VG1hYnZpYjlsVFBQQzR1b1FNTU83TUpFdHdBTEJhZWVMTVBUVE5nNzdN?=
 =?utf-8?B?N05Ld1NWMUFYS0hzYkxWc2p2T3c2bk56TzU4KzVzMHk0czY5b24zQ3B5N0Vr?=
 =?utf-8?B?M3B4SjlUYXRSc09JMks1VzVXMzMrWTZIUzR1RXdyWW9OMklodVlpQVhDK0R6?=
 =?utf-8?B?TW5yeXRsUzVzay85N0NjYUNJTytXTi8va09rR0lsQ3FZVXNwc2NhaDF0dW1B?=
 =?utf-8?B?dzFkK2lkRDYxYklwNVZaMWNySWJWeEpBcnNtS21zT1pua2JFRjJvaEVTMTVx?=
 =?utf-8?B?QlBpM0c1dEYwWUlEU1JYUXdOWTF6WjZneVhtcm5NMjhHSURrbHF4RmxLV1JE?=
 =?utf-8?B?Y1BvcVhwbHFVQ3o2WGtNZXFUYUNTVG40TFVkT1YzV0tnL1dWWjl3cXo2ZUlF?=
 =?utf-8?B?dEd6TzlZODFtK1Q5S2JOcTl6WitIeG1kcDJwQkVCblFNRnhla29oRHBBbHlP?=
 =?utf-8?B?dmhleGJycWg1MG96QmRoM25ZSUkweWtud0laZnZJYXYwRGpXaW5SY1ZFT0Vr?=
 =?utf-8?B?MWRsSmRMTTRyRDFrU2t5Wmo5ejdUb2NXVVYxZnF2c0Fac1Zia21XSXNpeEdt?=
 =?utf-8?B?UVRZaXVKaVlyM2ovdWFvYTR5SDZvUlZFUU1Kb1djZ2ZwMlZ3eUZqcU8zYjZU?=
 =?utf-8?B?TkppZDdXYVErdUJPeWxUKzYwNm85OWhmSGVySFlrYUFETVBEU3l3WExib0JD?=
 =?utf-8?B?Mzczc2ZXeFcyN053RFV1Zzl6cnVydjQwMXM3Qm01Y1JBQURqeVZ3Y1dPaGww?=
 =?utf-8?B?K1R4QmdFZm4wUS90UTV6c1Nsd0IxUFMvbWNWVHN5Ri8yN3lKYVBiV0JtWHpP?=
 =?utf-8?B?OXR4ZHMzU3JGMzZhUWJIcHdsQTJLQnVmaVhucXF0UmFpQ0ZxQWNaRE15U3p5?=
 =?utf-8?B?V2Z3cjdhQ3FsVEFzREduR050SmllZGE5ZUtFUld2ZC83QWMzK2N6Rm8vWVZT?=
 =?utf-8?B?V0xKTENRLzMwZVlFdzNDYklQaGFLVWVmTHk5cTBxTWM5blFrRTh5ZmszSGo2?=
 =?utf-8?B?NDRUOWNjS3BBaEtML2NlVHJ2Ykd5VmowUEJWNUR2UDQ0dGlaclg0TU9BTUdN?=
 =?utf-8?B?cTg1ejVRMXNKcVdOcUpyaVMxeGVWbjFIdnRIdlBmYVo2WENRTW51OE1qbDZh?=
 =?utf-8?B?RXk0WnlmNFRjazF5Y1oyZVFUY2l2K01Zb1MvYlVnSHR2Q0preHVQay8yNW5l?=
 =?utf-8?B?YXQvdHhTSTdVaEFRR21QLzVsUGdEUnhVWms3bDFIQVVYVWRqQUtIVDlRRFlO?=
 =?utf-8?B?UnF5Ty9zSDZhVWIzVFZjNkZDeXAwUjNhYWRld2JUaWpoQ2FCQmphaWd5UVRs?=
 =?utf-8?B?Vyt2aTdaTHV3TEl1SFNoUWZEN0kxQ21nQUl2SnV1NmVSMFNLYmJaYXhzcGFp?=
 =?utf-8?B?VnpFLzV1ZUc2UE1pRGZUL2ZZKy85Smt2RmNSbjBOTE44VDRrR1ZwWVd5N1pt?=
 =?utf-8?B?K0ZJYWhLWGJLT0NuV2VkbmVFZG44c3dpY0JMQTNVazNweFR2SmVuZWpTdDFL?=
 =?utf-8?B?SHYwbkxFRmRFcHJtOVlVK0tOSk82eW16NE8zaVREakNuMjFPOGpUek80WU55?=
 =?utf-8?B?Q3VqS0Q0aUZrcUJhWTlUdjVodktrMFBkcTIxZlVtSnF4dCs4cGNxOHZwbnEy?=
 =?utf-8?B?a2ZmTHI0eXpEWVlRV0Z6U1l3SEJXQmFIUVEvZk43ZFdxNjkwdHg5eWFBUzh5?=
 =?utf-8?B?NUNaL2QxRVM0cUFNWmlMWW5Ld0g0RlFnWnBLaUFqVUJKTk42eTI3Zz09?=
X-Exchange-RoutingPolicyChecked: Cm7UIwOZyNVxEy/GMTVPkRpIbaCZnIbksiPNSbNLEV6vFxXGFJO9UJyuEtW2hhOyE9AaHpqS5D5bu/nksThuwsfcDM9qcUEJKQuSjB4BmgcZMsxWTKY8qcDm2w5MfCGPREMA9bRUQu30iLKHW0awt9toKvWdcFGpYwwuf/O1fSVv/A5eI+2VJQ9NUuDL2egNv69rvqJkKH/QAl+Mn2iKrrKfUDPGlxjcSQ/moc0mrHPzu/HwzsIGchy/yh0fGXW6kas8elrpRzGGY4WNQepui/so1j7UpLHQuLF7zDoQp3jRsgEBdCbZ4NRid0swHYsbSu/F4Jh5wtlTO65KPwmtHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa8c693-f10c-477f-094d-08dec13397f6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:47:27.5899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBmueTJPmjyVPYgaGyNqTtpXREiJ+DIvJ4affsFwUyv1YnHTCtLFNVcCPYLlEwNB2pnegJHzalgduiDqBBn1wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5204
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

Hi Pranay

On 01-06-2026 01:54 pm, Pranay Samala wrote:
> Switch framebuffer creation from igt_create_fb() to
> igt_create_fb_with_bo_size() to explicitly specify YCbCr encoding
> and range parameter.
>
> YUV formats may otherwise be interpreted using implicit limited-range
> defaults (16-235) instead of full-range values (0-255). Using explicit
> full-range handling keeps the expected color values deterministic for
> YUV test coverage.

Patch unconditionally passes IGT_COLOR_YCBCR_BT709 / 
IGT_COLOR_YCBCR_FULL_RANGE to

all framebuffer creation calls, including those that will only ever use 
RGB formats.

Add a helper that applies the YCbCr params conditionally something like

static unsigned int create_color_test_fb(data_t *data, int w, int h,
                                          uint32_t format, struct igt_fb 
*fb)
{
     if (igt_format_is_yuv(format))
         return igt_create_fb_with_bo_size(data->drm_fd, w, h, format,
                                           DRM_FORMAT_MOD_LINEAR,
                                           IGT_COLOR_YCBCR_BT709,
IGT_COLOR_YCBCR_FULL_RANGE,
                                           fb, 0, 0);

     return igt_create_fb(data->drm_fd, w, h, format,
                          DRM_FORMAT_MOD_LINEAR, fb);
}

Also, in commit message mention its a preparation patch. There is nothing

which is getting fixed in this patch.

>
> v3:
> - Update commit message (Swati)
>
> v4:
> - Split the patches (Swati)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_color.c | 128 +++++++++++++++++++++++++++++-----------------
>   1 file changed, 80 insertions(+), 48 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 565edb2dc..146181fbb 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -104,20 +104,28 @@ static bool test_pipe_degamma(data_t *data,
>   	igt_output_override_mode(output, mode);
>   
>   	/* Create a framebuffer at the size of the output. */
> -	fb_id = igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      data->drm_format,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> +	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
> +					   mode->hdisplay,
> +					   mode->vdisplay,
> +					   data->drm_format,
> +					   DRM_FORMAT_MOD_LINEAR,
> +					   IGT_COLOR_YCBCR_BT709,
> +					   IGT_COLOR_YCBCR_FULL_RANGE,
> +					   &fb,
> +					   0,
> +					   0);
>   	igt_assert(fb_id);
>   
> -	fb_modeset_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      data->drm_format,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> +	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
> +						   mode->hdisplay,
> +						   mode->vdisplay,
> +						   data->drm_format,
> +						   DRM_FORMAT_MOD_LINEAR,
> +						   IGT_COLOR_YCBCR_BT709,
> +						   IGT_COLOR_YCBCR_FULL_RANGE,
> +						   &fb_modeset,
> +						   0,
> +						   0);
>   	igt_assert(fb_modeset_id);
>   
>   	igt_plane_set_fb(primary, &fb_modeset);
> @@ -191,20 +199,28 @@ static bool test_pipe_gamma(data_t *data,
>   	igt_output_override_mode(output, mode);
>   
>   	/* Create a framebuffer at the size of the output. */
> -	fb_id = igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      data->drm_format,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> +	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
> +					   mode->hdisplay,
> +					   mode->vdisplay,
> +					   data->drm_format,
> +					   DRM_FORMAT_MOD_LINEAR,
> +					   IGT_COLOR_YCBCR_BT709,
> +					   IGT_COLOR_YCBCR_FULL_RANGE,
> +					   &fb,
> +					   0,
> +					   0);
>   	igt_assert(fb_id);
>   
> -	fb_modeset_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      data->drm_format,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> +	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
> +						   mode->hdisplay,
> +						   mode->vdisplay,
> +						   data->drm_format,
> +						   DRM_FORMAT_MOD_LINEAR,
> +						   IGT_COLOR_YCBCR_BT709,
> +						   IGT_COLOR_YCBCR_FULL_RANGE,
> +						   &fb_modeset,
> +						   0,
> +						   0);
>   	igt_assert(fb_modeset_id);
>   
>   	igt_plane_set_fb(primary, &fb_modeset);
> @@ -285,20 +301,28 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	igt_output_override_mode(output, mode);
>   
>   	/* Create a framebuffer at the size of the output. */
> -	fb_id = igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> +	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
> +					   mode->hdisplay,
> +					   mode->vdisplay,
> +					   DRM_FORMAT_XRGB8888,
> +					   DRM_FORMAT_MOD_LINEAR,
> +					   IGT_COLOR_YCBCR_BT709,
> +					   IGT_COLOR_YCBCR_FULL_RANGE,
> +					   &fb,
> +					   0,
> +					   0);
>   	igt_assert(fb_id);
>   
> -	fb_modeset_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> +	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
> +						   mode->hdisplay,
> +						   mode->vdisplay,
> +						   DRM_FORMAT_XRGB8888,
> +						   DRM_FORMAT_MOD_LINEAR,
> +						   IGT_COLOR_YCBCR_BT709,
> +						   IGT_COLOR_YCBCR_FULL_RANGE,
> +						   &fb_modeset,
> +						   0,
> +						   0);
>   	igt_assert(fb_modeset_id);
>   
>   	igt_plane_set_fb(primary, &fb_modeset);
> @@ -520,20 +544,28 @@ static bool test_pipe_ctm(data_t *data,
>   	igt_output_override_mode(output, mode);
>   
>   	/* Create a framebuffer at the size of the output. */
> -	fb_id = igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      data->drm_format,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> +	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
> +					   mode->hdisplay,
> +					   mode->vdisplay,
> +					   data->drm_format,
> +					   DRM_FORMAT_MOD_LINEAR,
> +					   IGT_COLOR_YCBCR_BT709,
> +					   IGT_COLOR_YCBCR_FULL_RANGE,
> +					   &fb,
> +					   0,
> +					   0);
>   	igt_assert(fb_id);
>   
> -	fb_modeset_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      data->drm_format,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> +	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
> +						   mode->hdisplay,
> +						   mode->vdisplay,
> +						   data->drm_format,
> +						   DRM_FORMAT_MOD_LINEAR,
> +						   IGT_COLOR_YCBCR_BT709,
> +						   IGT_COLOR_YCBCR_FULL_RANGE,
> +						   &fb_modeset,
> +						   0,
> +						   0);
>   	igt_assert(fb_modeset_id);
>   	igt_plane_set_fb(primary, &fb_modeset);
>   
