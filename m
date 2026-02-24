Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6356AEFB7F3
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 04:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4ED10E4A7;
	Tue, 24 Feb 2026 04:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTDkMCiT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A78E10E4A7
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 04:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771906085; x=1803442085;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pwaBtupGuXw8l6zNXG8Fg9Moe9E84Y8X30CE43q4cBQ=;
 b=YTDkMCiTzR3FgEj4vH3P/Zxd65mrwVXgD+bthaCDwnHBi9+7a+XQDWJY
 9tzHDWQuAyWjArJn50LFpl6jiDugwNZWzmtkcaXA6c6UMCBNQCr2Fsh5D
 R4Rv5HNU5tWvMzk746VOrC1WM0VCEICENeZTCErcpDkbHpdHDs8FKgv5i
 G+b+ZLRlNKzSDoMWQlJxnXC1dyR1NEo1Ls2C4Qioq94pNs/FMNeStXF7U
 wpU0qxiSFGXl2ujmH+fmplZOsKLnfoRhZvo2+ZkdT62gnic1fNxteSjFB
 Xh1OyZLg9xaDdMYZdEPSzrwEBQ6vElut/ZErm8b1DriL5MtHGOHrzfsXC w==;
X-CSE-ConnectionGUID: 1vemO4eBTzm1stGqEXB4Ww==
X-CSE-MsgGUID: IVb04GCZQuyglNZNkLx3mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72980536"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72980536"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 20:08:05 -0800
X-CSE-ConnectionGUID: FddX8lHcRnqdq0bi7JTghA==
X-CSE-MsgGUID: Z0kM147tRYqenmHNNJAAAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214147162"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 20:08:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 20:08:04 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 20:08:04 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.49)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 20:08:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImT4PFLVqYV6WlceIDYemJ9yLLmuPnKmbMidhVlDpZLl4Yhgn/uZEHi69oMOZwBSN1BdWGrP2vTUWphPbfWS2x9TefLMzDUSpp0Sc9hG7Kw2fy+dfwfrj7Oe8RIKngplm2qzRiVxKCVFHAS6Xmp08NbANNXPnO/w61UvxmbNABtE0EbmkCFXb6KA00Jl6/ST3evz5AfGtqOgiRFyjcH4nvN299Y5Lu9FGyCVXXeb6D80Ts9dLuBJB3SvOF62r0W9dDnlV3+NEerddK20ewL8EqDtpJ3FVAqyA95fUlFoPlmTbiGhS2ZZ/ASne+G2ZYcWi9bKNtDeYS7dgQ0WyGiJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPFxExwaZON9JSA9Qyl7RbFKmSzLvSQmTw79CN/qOqk=;
 b=FKxnoVyuOOL0A9pQtcZMiVjsydM/r4ELHxtI7hOqAC4VOdH8c+K2RAxVMfNUlNih/3g0Y/53fQuuYe+z91v3nkB4Qh8Mu8POGLyLMtvI4tiRPHJaCMgMAx3+YVw4Je+G/1BD10/W1m4Mp63TKtLItW/T6LeUvwq0j8lD5G+Jf7mmrRo5E1xrgQjleZX7cdNXDN710dM/uSeV6FmXK2jROkaUQOdyqwrqnw4GdI553GEfog/d56d7OZjk+qgPwnmvfbOnJolEQk63hNjCoukUIFCHA5ZbFinT7ofZHQsMgV5TTrXFEFypD2FPGAOGQIC7LrFMxs0nhIXcn5KblMYkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6)
 by PH7PR11MB8059.namprd11.prod.outlook.com (2603:10b6:510:24e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 04:07:55 +0000
Received: from CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f]) by CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 04:07:55 +0000
Message-ID: <6432d2b5-d97a-4229-9f11-014b0ca8758e@intel.com>
Date: Tue, 24 Feb 2026 09:37:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 6/8] tests/intel/xe_madvise: Add
 dontneed-after-exec subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-7-arvind.yadav@intel.com>
 <BL1PR11MB55256152932652611D4D77BC8477A@BL1PR11MB5525.namprd11.prod.outlook.com>
 <a68be50a-b559-483d-a104-d95ba7d74cd4@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <a68be50a-b559-483d-a104-d95ba7d74cd4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::18) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5706:EE_|PH7PR11MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d732dea-6659-4e78-7797-08de735a48e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NENIVnY4M0pUVXNrWmxFOGhvcEROSXRhRncxbXlaT2ppQjJISVdyQ0ZwamtZ?=
 =?utf-8?B?VHZ3Z2FSOVRXeGZYRVBkcURRdEhOMDdhc1RGZTFuSjBIME50RERLZ2J2c01v?=
 =?utf-8?B?eDFVbGZ1UWZjVTlwVjV0SHhQVmExYWNpNnc3cGkvUWErN2dLUkpFaGhiUC9H?=
 =?utf-8?B?cHlSaFJ5cU9KTTh1Ti9HZDdFUnhTOU9YU2hNUXBFWlJHTXJBWTlaMHEvd0Rx?=
 =?utf-8?B?OFpWb0xIZFg3SEVKZ3h6WUxTZTBrNlQ4MlE2OVNibG5FSmwreXh3Wm1nZVJ2?=
 =?utf-8?B?TTErU09XbTZiLzBDZUc1TmRjTjd4WVJ5WVFmMG9qeGpqSTlvWE1mSDJ3b05I?=
 =?utf-8?B?bTRCc2JhS1psQk0zUnZ4OWxKQU1RTDExL1pGZmd6cnVhOXlQZ1c3Mm83Mkxx?=
 =?utf-8?B?Q3ozTllmOXNUa00zMWxxNTM5aXVtUXluUDd0aWc1dFllVUkrTEJ6SEUzVTVR?=
 =?utf-8?B?akdQVWt3MExqZVQ1NDFLNTBxR25KaXF4UXpDcm0rdlpTNCtKOW9Fb2I2ZmIr?=
 =?utf-8?B?TEdZWlBQNGllS2xhRHkvUjd0emVlb3I1MCtVcldDVjhjN3d6cGNKZ2M0dTBV?=
 =?utf-8?B?LzZTbDlVZm0xQW56cWhUa005TkFJcjV1bmYwSTBOdTRLYk9ueHNWVU5qd3Q0?=
 =?utf-8?B?ejZJNy9ZSWJvSDNDNW5vRS84cE1jY1lZdnI3Tm5WRGRKNzZUWENkSDU2STVr?=
 =?utf-8?B?MmtoMzhyUWhIMG9QWHRCdGs3bUl4UnJsRlRnSlNESGhwdml6WE5OZEFpK282?=
 =?utf-8?B?dUF1WWF3cHpiVW5lUFE2YjRoU0gwYm9Kb3VXd2p0S0F0Umw2T1dRb1VWenda?=
 =?utf-8?B?NHlpUHpoV2ZnZHlRZERENW5tS2lnMjY4d0tOTlFtbG9GUDhPNTN6eGZNcytn?=
 =?utf-8?B?Z2pXM0FrdFFhKzFJQnh5cmt5YzkyTm9OL241OVpIaVRmamEvNjNET1RSaUFI?=
 =?utf-8?B?eXJzRHkvQmVwU2svV3dua0Y1RFh1b0hlWXU2Q1c5WGRkSCtiZ2ZZSmp0MjNQ?=
 =?utf-8?B?eE1sMDZ0NHp6Y3hqdWsvK3Z4U0h3cFp6Q2VvQUJRRW5Sa2NCMVFQNTk1bDU0?=
 =?utf-8?B?aTc2WXhvZTV6UGJFY0tqYUVmcms1QlBEUTdSdXJ6bFd4MFMxREFESXEvRzAz?=
 =?utf-8?B?bi9IRUZGMG5CWGxVaGVjVUtIK2t5bTZIeG5taHB5RVhObVRPcWtuTU10aEFl?=
 =?utf-8?B?OG0yS0haQitmdU1abUZYMEUzYmo3SU5ITlNtaFZBaXJJdEtoVnpza2Zyb0RW?=
 =?utf-8?B?TjV4OGU2cG1aSkNMNk5EdUNaMFJOSStwalF3bUpmWHhtbTBEUjY3TGVZUzhW?=
 =?utf-8?B?QVVIa00yK254SHRzRGNCM29mVm1mU1dvZm41Y2lkTUtiSFFyR1ptbmhwMFQw?=
 =?utf-8?B?RFAwS0pnYmo3aDVuT3NqL3VZcmFSZnVJOFlKSlg5TGM3bUxjRFlpY2o5UXNN?=
 =?utf-8?B?Sk41Q1hFd3lZZnk0VFFRckJzK2FORzB1czMyM09ZaDZPM3hXN0VVVURIck5p?=
 =?utf-8?B?eTBsRFJiQ2pYZkRLM2dNSlZ5VncvSE50ODNqeDhsR1dJWFNvTzZCNXdGU3Jn?=
 =?utf-8?B?bmpiYkE2d08yZFFxQm9oc3BCKzYvdXRFUm5zNFRzN0phdVFkRlBLK0J0T283?=
 =?utf-8?B?TVd3ZUpiYVNublpuMDBkRi9ueGZLdExiRDdKd2d6YlZKUGJMd3Y5c2FDR2gw?=
 =?utf-8?B?RGdZTkJHdVZMUjBhSUFzbHpFcTFsY3ZnN0hsS2MvSitEaDdoMk4zVHA3N3FU?=
 =?utf-8?B?S01UUFdiU2xsNVVBaGt6UVF1RFNqUDlpa1hqR2hibDR0ZFFqZlM4b001dGJQ?=
 =?utf-8?B?ZUtDQkloT0trSElnU0tSWE8zdEhRQjVmYmFSeUdDNnhLY2xwUUpmVFdWQmVw?=
 =?utf-8?B?RmJGM2xGMTZlaXZ1SDFLaTVrbmY2M0VUYW80cDR2RGFtUURrYmZmZ2V5QXdn?=
 =?utf-8?B?YjJvY1V1dzBpaURrZFJTUnF3MjVKWmZkT3JTRVhSK0IvVHczdVFBdDRJelpF?=
 =?utf-8?B?MXEvK1FmOCtWWXc5WDIrQVdIVXF4K2k3NjdyT01PMzI5MzdnYUErRDJQNFVO?=
 =?utf-8?B?V2RkWGUrNWFHSmZ1TmIxTHAzaHlacDFGS2p5alBnWGU4LzVIdHpKTGhmdDZn?=
 =?utf-8?Q?uYIA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmVOWjZ6SDdjU09oTlVQMlpmYUR1cHIxUGR0SWV2K0RLd1Z5WkxlSnBrV24w?=
 =?utf-8?B?ejBmOXpSb1Rha2JidmMzV1BJQnRjQitDdnczN0x5S2M0VU1oWVpIeFFoa3VW?=
 =?utf-8?B?S2JIOXpEZzJ2Rloxbkw0VjVZeEI5UHpjZld2TEgyNHV3bitZUkJsaEdqaEY4?=
 =?utf-8?B?VExzdDdFc1lHR3lYL0VQUkwvTnBwMW4wRFZ6V3dTaFZ5OFBPSlpESUxSdkJv?=
 =?utf-8?B?WDVXRk1tWHlhSEFCclozMXQ4NmdoYndySVNPNkNDQ05sWjBtL1NSbDlOQkZE?=
 =?utf-8?B?SmZqMnd2c3Noc0NjcUhlTURDWWVOclJqc0ZnaGJ4bHMwcVFIazU2a3Fpd3BG?=
 =?utf-8?B?T0Nyb1BwM2VWS09OMFpVTTlWS0ZGaG8wQUJZWUlLc3F3dnk1VUd0NHlVdjVs?=
 =?utf-8?B?QVFwbFc1SE1mNmZPNGVkSEY0RUpkc3lmb04rV25yUlRvS1I2NURkR3k5QXhI?=
 =?utf-8?B?TzJpTVIxd3J2M3FSYzBhREtVSkJoQllBVFpxdW9mV0lsT3NGZjVvYTdqNDEr?=
 =?utf-8?B?RFhnZzlEYnhnYks4VCtjeHhJbmM0WXFQYzJiUlFUZWV6c0V6dkRycndHMG5C?=
 =?utf-8?B?ck5YWFJ1Mnp3VFhDOU5sRkdXS1YyU3M2d0paVWU3K3dLYXF2WlR6YVFndWJR?=
 =?utf-8?B?cHlOYUxFRGpJMVJ5MFU0czdQS2dJQmN5ZGUzc3ZheXlIRVdQTTlucHNMRjN2?=
 =?utf-8?B?c3U3YmdOdzlvcldxY1M3aFdHczJSa0FmZU5yd0EwM1d6Vi9VdDVPMDFTNGc3?=
 =?utf-8?B?UGp1djE0bWxxY0RZTVNJeFdHVTJnYUk4TDFtaUhBb24yRlU2azNvN205Z1U0?=
 =?utf-8?B?QXFjTWc3MFVVVUR1MGFJMTdCY04xc0ltTVBTWVUxMDhTc1NhY3pOTnJYYm1v?=
 =?utf-8?B?VlB5aW56RmxsMHFoaDJ2LzIwUnBmRHRlQm45dHVBUHVqQ1YwNkpkTEdpOTc4?=
 =?utf-8?B?UlFPNEtsU3pyVlRkV05BUWUyV3g3UUt2UkRJUnpjeHY2cSs3WjJ0K2dsTmlF?=
 =?utf-8?B?MWVudjFwRXZWZVV5NFIzbzRqSE5uOHRpalROTzErMWpHODFVRW1DZzRwUm50?=
 =?utf-8?B?MFAyZVVZUktYdVZKUHkvVGh4K0dRdktBUlBPVXZFSFNyK1U3bzM3WU02TXNM?=
 =?utf-8?B?anpJY3NIUHlOcE5nenJ0K2tUU0IzTlh4dXp4OXRCL2pLNlFlSnVMZlJzMVFj?=
 =?utf-8?B?b0d4TFRqUm9YcHdnbElrZ25aeVA3Z21lQmh6U2dGcVNBWGl3a0I1aTRUSGZz?=
 =?utf-8?B?cnFjcUEyNGROMG9hTENtdC9RdmhmeFlLRGFtc2IvZnBjMFIxZlg3d05aVlRT?=
 =?utf-8?B?Ky8yT1kvOXRCcWQ1M2pjOUxzeHMrMzN1TGZUWFg0WUVNUllsS054S0w1Sndz?=
 =?utf-8?B?SkNVV2R0Y2VpMDFPek9GWkMyMlF6aFhFRk5HTFphTCtwaWJIc1plOHVGWHMx?=
 =?utf-8?B?em52L1Zxd2p1enNib29POVNWd3lCbVU4clUrWm80bHBocG9CejBTWWpjOUFm?=
 =?utf-8?B?MUZlNG1GVVRMdjdvZVpXMmRrVytDMzFDQVp0L1Z2UnZyVFFETUN3WmxFaU8w?=
 =?utf-8?B?Q09zYkl6TGlMcFJ0UHh6Vm1xVkx1TFRtT3hJenVNaCtYWjhnMmJsZ0lNQVZ1?=
 =?utf-8?B?QW1WZ3h0SzJiLzhJODdhdStTTjJPR1daK1V4SnpaSWhvRi9NMmZKUElySkdC?=
 =?utf-8?B?MEQ2TWl5N1NtOHAvZnpzeTN2V3QzQ3BJQktTemdURzZvcmlmWWkrWGwvaVM4?=
 =?utf-8?B?ejZmTGFFcnd5WG8wY0hiT0YxMUQvQ3NmTGpQRkd4YWlseFNBd0o3M0t1Q3Ji?=
 =?utf-8?B?T3IwQWx0THpLQk1xNlZwUGpGb0RMSnM1TXFBbWF5LzZzdlY3cXMzbDRrYlhY?=
 =?utf-8?B?Ly8vNUxJTG5lSnVhQWh5cW9KOWEzOGxuYnoxWUsvSkhQenFFYkpDSWNiWHox?=
 =?utf-8?B?L3VqNVE0TGo3VU1ZVGVaMHFXK1RDaTQ2cmE0akhrandMRFF0R0VCUmd4WGdX?=
 =?utf-8?B?aDB3V28ySWFiTFptS0dWSTV2WllKYituS0lMc1Q5QlBmOGhjdUpacXZGSVFo?=
 =?utf-8?B?bVZET2JEd3luV3l3TzUrcDRSUlNzWFh1aTVoeTFrVU1ZMnBreW5hcnhNem9F?=
 =?utf-8?B?QmRqNm5kYzE3ZkROTjA5YXdmTy9tbzdWaDZSbUVwZy9CaFoxWllNTkczd1Vl?=
 =?utf-8?B?dUVNZ0U5QnZZZG5rci9JRndESVZpUFlVN1VzRGovVVRqYVh5R2lJUk5tb3Ft?=
 =?utf-8?B?QmtIejhyVWxweFpYcG4xbmg3TmlORVc0ZmJoY0xGVTJjbEpWcDZvUU53UG8r?=
 =?utf-8?B?d3d5VjJHT2RMUGt0U1lmYmo2clFGbGpjNDR3WVZEZzFBeEVia2k4Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d732dea-6659-4e78-7797-08de735a48e7
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 04:07:54.9136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1W92rbLZBaDiCoVNU6YK0YKSfgEFTLiqIz/Cz4Lo+uL0XkWiCJOF/WqVTfZTc/UyFLDKeuS9hnm/3+O64q4+4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8059
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


On 23-02-2026 12:34, Sharma, Nishit wrote:
>
> On 2/23/2026 10:41 AM, Gurram, Pravalika wrote:
>>
>>> -----Original Message-----
>>> From: Yadav, Arvind <arvind.yadav@intel.com>
>>> Sent: Tuesday, 17 February, 2026 08:04 AM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>>> <pravalika.gurram@intel.com>
>>> Subject: [PATCH i-g-t v3 6/8] tests/intel/xe_madvise: Add 
>>> dontneed-after-exec
>>> subtest
>>>
>>> This test verifies that memory can be marked purgeable and reclaimed 
>>> after
>>> successful GPU execution. The test first executes a batch that 
>>> writes to a data
>>> BO and verifies the result. It then marks the BO as DONTNEED, triggers
>>> memory pressure to purge it, and attempts a second execution. The 
>>> second
>>> execution may fail or succeed with scratch rebind, validating that 
>>> the kernel
>>> correctly handles purged BOs in GPU submissions.
>>>
>>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   tests/intel/xe_madvise.c | 93
>>> ++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 93 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c index
>>> 42cf1b3e5..51ef4fad3 100644
>>> --- a/tests/intel/xe_madvise.c
>>> +++ b/tests/intel/xe_madvise.c
>>> @@ -16,6 +16,7 @@
>>>
>>>   #include "xe/xe_ioctl.h"
>>>   #include "xe/xe_query.h"
>>> +#include "lib/igt_syncobj.h"
>>>
>>>   /* Purgeable test constants */
>>>   #define PURGEABLE_ADDR        0x1a0000
>>> @@ -378,6 +379,92 @@ static void test_dontneed_before_exec(int fd, 
>>> struct
>>> drm_xe_engine_class_instanc
>>>       xe_vm_destroy(fd, vm);
>>>   }
>>>
>>> +/**
>>> + * SUBTEST: dontneed-after-exec
>>> + * Description: Mark BO as DONTNEED after GPU exec, verify memory
>>> +becomes inaccessible
>>> + * Test category: functionality test
>>> + */
>>> +static void test_dontneed_after_exec(int fd, struct
>>> +drm_xe_engine_class_instance *hwe) {
>>> +    uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>>> +    uint64_t data_addr = PURGEABLE_ADDR;
>>> +    uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>>> +    size_t data_size = PURGEABLE_BO_SIZE;
>>> +    size_t batch_size = PURGEABLE_BO_SIZE;
>>> +    struct drm_xe_sync sync[2] = {
>>> +        { .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>>> +          .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>>> +          .timeline_value = PURGEABLE_FENCE_VAL },
>>> +        { .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>>> +          .flags = DRM_XE_SYNC_FLAG_SIGNAL },
>>> +    };
>>> +    struct drm_xe_exec exec = {
>>> +        .num_batch_buffer = 1,
>>> +        .num_syncs = 2,
>>> +        .syncs = to_user_pointer(sync),
>>> +    };
>>> +    uint32_t *data, *batch;
>>> +    uint32_t syncobj;
>>> +    int b, ret;
>>> +
>>> +    purgeable_setup_batch_and_data(fd, &vm, &bind_engine,
>>> &batch_bo,
>>> +                       &bo, &batch, &data, batch_addr,
>>> +                       data_addr, batch_size, data_size);
>>> +    memset(data, 0, data_size);
>>> +
>>> +    syncobj = syncobj_create(fd, 0);
>>> +
>>> +    /* Prepare batch to write to data BO */
>>> +    b = 0;
>>> +    batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>>> +    batch[b++] = data_addr;
>>> +    batch[b++] = data_addr >> 32;
>>> +    batch[b++] = 0xfeed0001;
>>> +    batch[b++] = MI_BATCH_BUFFER_END;
>>> +
>>> +    exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>>> +    exec.exec_queue_id = exec_queue;
>>> +    exec.address = batch_addr;
>>> +
>>> +    /* Use only syncobj for exec (not USER_FENCE) */
>>> +    sync[1].handle = syncobj;
>>> +    exec.num_syncs = 1;
>>> +    exec.syncs = to_user_pointer(&sync[1]);
> when num_sync  = 1 then why assignment with &sync[1]. Although sync[0] 
> is not used. Either you can have single sync for both xe_exec or use 
> different syncs for each xe_exec


Noted, will be using sync[0] consistently.

>>> +
>>> +    ret = __xe_exec(fd, &exec);
>>> +    igt_assert_eq(ret, 0);
>>> +
>>> +    igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>>> +    munmap(data, data_size);
>>> +    data = xe_bo_map(fd, bo, data_size);
> igt_assert(data != MAP_FAILED) before using below
>>> +    igt_assert_eq(data[0], 0xfeed0001);
>>> +
>>> +    igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr,
>>> +data_size));
>
> Resource cleanup? Although if BO is purged it will assert but is there 
> any chance if BO is purged and it continue execution second xe_exec() 
> which
>
> can lead to undefined behavior?


Noted,

>
>>> +
>>> +    /* Prepare second batch (different value) */
>>> +    b = 0;
>>> +    batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>>> +    batch[b++] = data_addr;
>>> +    batch[b++] = data_addr >> 32;
>>> +    batch[b++] = 0xfeed0002;
>>> +    batch[b++] = MI_BATCH_BUFFER_END;
>>> +
>>> +    ret = __xe_exec(fd, &exec);
>>> +    if (ret == 0) {
>>> +        /* Exec succeeded, but wait may fail on purged BO (both
>>> behaviors valid) */
>>> +        syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL);
>>> +    }
> We are not checking result in BO after second xe_exec(). Is it 
> intentional?


Yes, intentional because After the data BO is purged, the second exec 
has undefined behavior. With SCRATCH_PAGE, the GPU may write to scratch 
memory (meaningless data) or the exec may fail. The test validates that 
the kernel handles this gracefully without crashing, not that a specific 
value is written.


Thanks,
Arvind

>>> +
>>> +    munmap(data, data_size);
>>> +    munmap(batch, batch_size);
>>> +    gem_close(fd, bo);
>>> +    gem_close(fd, batch_bo);
>>> +    syncobj_destroy(fd, syncobj);
>>> +    xe_exec_queue_destroy(fd, bind_engine);
>>> +    xe_exec_queue_destroy(fd, exec_queue);
>>> +    xe_vm_destroy(fd, vm);
>>> +}
>>> +
>>>   int igt_main()
>>>   {
>>>       struct drm_xe_engine_class_instance *hwe; @@ -406,6 +493,12 @@
>>> int igt_main()
>>>               break;
>>>           }
>>>
>>> +    igt_subtest("dontneed-after-exec")
>>> +        xe_for_each_engine(fd, hwe) {
>>> +            test_dontneed_after_exec(fd, hwe);
>>> +            break;
>>> +        }
>>> +
>> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>>>       igt_fixture() {
>>>           xe_device_put(fd);
>>>           drm_close_driver(fd);
>>> -- 
>>> 2.43.0
