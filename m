Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AFDC0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 09:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE69F10E225;
	Mon, 27 Jan 2025 09:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hk8V+4QC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E5310E225
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737969432; x=1769505432;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qdY9n3EtsTNVQSqrbc0KcUJlPgM4ptPCD4SHG3bcWFU=;
 b=hk8V+4QC4X24mUlAzlOcCEXSwUUl4pa6uVNZSIhiX367l4g5oMlrU/yQ
 pPLyB3lGjicxh6C/k49KWf99n5O+ctAHdrXN+3mX6D7VyUXVgHg+jFtmQ
 yvrlaSBjVP+0TSzHQsJnzITVCDfp7jrah0Hz4dhGd/Vp0+K0EMTR9dqSr
 b2UVOJ7whV3nNAL+uYoulBkAEo6CkKXy5PRtGKSt0KJQddR4oztWiupj0
 rTH0otCRubf0ChP+8VOcRO30gTjvaBqoGmC/ySuIaH2E8RLeQXpNk+cT5
 45JsFDaoyYT/x8EanMG2NUOLwnqSh05Lxd1BS9LjupsMqjvNe5xVzDcdx Q==;
X-CSE-ConnectionGUID: uKpQcGnRQveavt26EmusQg==
X-CSE-MsgGUID: 0pxE8y5WSzGv3GO+KW63Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="49078041"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="49078041"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 01:17:12 -0800
X-CSE-ConnectionGUID: g0n9XRJyS+a8pk3Bwbc3Jw==
X-CSE-MsgGUID: sYOV/GAtTFCr1ATH2kZWcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="113411911"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 01:17:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 01:17:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 01:17:09 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 01:17:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCMIm/MhyWb0alfHcEb5fOOkYiyfHr2XNzxV1I7Enqk6/3grYReyt6otnPkcxKgBePNPhrmtjaotGQun69fJuaqrtTniF611VVqBagn4mUiQo31n7Um114biq+pdPvKBog+mUuUvBRIT6riL+2En4EHiTRysAJSXMppNyd0/yASbJIE1dVqDMlIUDmGP72nptBVekc0VgBONWjbXK6uhdYRKis5wlC9GpaP6RyUrFDCF7OEd3Ycfn8cnmoA/8R9pFdbwbXHdQLKAsMr50zaU/6CbA10WEe+wpE1AstMxwQL8IzwzHO81kJjQ6+S9hgMKymqSvpgFAOV8DUlHx03QoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd4CW9sasx/b/hOJd0F+pHBtQHh18y/SWcLty7Lrq6w=;
 b=ZJrVGXqTcablnSIULwZ93KmSga8HHZcPrbM6DWCSjvyojMDV+rSHqDBsc9EOD9hhEKAFUas9G3zLsIniWrkzK3lOhuFro02VS4DLj/yyC2unYA5dgvRNFfFfz0PNbSHTehDgJG/fT2NF2HyZPCjCGYLA8auo78VmR5TRWi62m6xJaiYq1e1w3gzZC8olMdUcTKt+ztV3jNS1+5zYmNVPwAc2WCaVTChfKJohj0DD60rhFFUSzTDdZB3Zod3EiPGDxVqyApmVNrIBN24UBV/f39CN8WV1Mn45lDr9xWZEjFDKVg2DNhVm84AYeIpwmg6UTs7aMGcl0F9cOnNXvSWXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH8PR11MB6854.namprd11.prod.outlook.com (2603:10b6:510:22d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 09:17:07 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8377.009; Mon, 27 Jan 2025
 09:17:07 +0000
Message-ID: <01ff1927-b76f-4807-a057-e38487b82ced@intel.com>
Date: Mon, 27 Jan 2025 14:47:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/kms_dp_linktrain_fallback: add
 dsc-fallback test
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
References: <20250127062904.3420225-1-kunal1.joshi@intel.com>
 <20250127062904.3420225-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250127062904.3420225-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH8PR11MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: 55392ae7-b745-4fd0-1afb-08dd3eb35f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czZ5aGNTNjJpUXd4Ym03QmovQnAvNCtPWkF1WGtYbnk5UXR5QVEzNVQvVitO?=
 =?utf-8?B?VG9FU1NCMEozMkJSamtyRktWZ1VsbzVidDVTQXc0SG55Rm5qYXM1aTlLcVQ4?=
 =?utf-8?B?M3pzdDNDQ0NaUlFicnFiUUdKeVNESWMyUFRGdC8zSktXMXpDc2tLTXVvS0dV?=
 =?utf-8?B?YUhHb2pEN1lxTTZrekYyenFEaHZ1bGpTNGRVZXdEWklHZXRlUE9WRDgwemh5?=
 =?utf-8?B?aFJXMmg4V0xHWmJGanpQMUJNM0lBWFRXLy8yc2pab3UrZWdHaE8zWmtZQzRC?=
 =?utf-8?B?OUx0SmdEeUpZTUlrNmNxdlU2akVrVUdhQnlWbEZQclhveE5wYkt2dTJURzlE?=
 =?utf-8?B?aEJTNFZEaDF2dEFXRlh2S0F6TU1pSTJ5NXJva1cvRWN6T3VITlk3WGhRaDZY?=
 =?utf-8?B?WnQvWWRmd1RqcGNnWlVyU2lDZS9CVmo0eWJobXBvcStjNlNIbHE1OG5tVTgx?=
 =?utf-8?B?RDFDZ25rM2hRMGZBMmNzT25BanFXSDV0Q0JINGV2ckFuOGVzazk5OE91NFY2?=
 =?utf-8?B?bW1Sc2VZKy9HMEUxd3NWbWFzMWdsbkhWTHFhYmpWU3c1OGZxZ1V6WHMreEhU?=
 =?utf-8?B?TlpMVitrREc0aTU1Uno1SnZLU2Vpa21mYVJvVng4d0NDeFJuOHFkLzU0bWZp?=
 =?utf-8?B?cDVEMDFsR0dxZGJDc0NVblVpcUpTR2xJRVV4bGJVdkh2TlFJQ0RFSmRYWU9v?=
 =?utf-8?B?Q1o1WllmUmxxL0hyVk1ybDUwZWpNM2YwSUVlUkZuM1BBQWpGZE55ZWlscmxo?=
 =?utf-8?B?R2ZCNGU1ZTI2ODdXbk9wNkJVZDVIN0dyZjNBNjU3eUNTMmxmM0lLaFlpVENl?=
 =?utf-8?B?cndJcXRtOG45K2FNeWk4Z012K3RXNTRLdDYraXl4WUdndWpHejVmUnp3QU9E?=
 =?utf-8?B?VzZNSmN4RUhEOTc3cFhwUjlPVmI0a2E5K2tiejZDMjhrbjFzTFg5VjRFTTQ1?=
 =?utf-8?B?ellDdkVnb1c2cDVTdTZpS2J1c1Z1d2c4UWY0dHNVczdlUGZqMGFtbEYwQlZI?=
 =?utf-8?B?ckMybFpQR0dmQkwydmRzK3k2OHpjamlaMG1ocUp6bnZjQ3o0NlJpTXhSMURa?=
 =?utf-8?B?TnJDWW9sd2JpaWdTUm04NEphcWc5OW92NlhJYU1SMVM3aG1rWXFYRzhyNk1o?=
 =?utf-8?B?Q1BwODNTVVNpeDRTcU8yVEJnczFCMGpOZUpleDNFd0N2TXFLVnhEamptZy9L?=
 =?utf-8?B?dVB2Q0lMQkkxbUthRml0d2JjT2pjTEtHYkM5UXYvMmRPcysvOHg2ZDgyRlZL?=
 =?utf-8?B?c3dscWg1MTVkeWFjWGtNenRGajVRK1V6NVRvdWsvRXFzVFJUNTU5UG5naFdR?=
 =?utf-8?B?Ym04V0VZZFAzZmdVYUNqaG85RnJyNmV6c2FHbEJIUnUvZUVxclJEMVpHREhK?=
 =?utf-8?B?YUJmQXN5cm9iMkZWKzR2UzFieC9JMDdOZTB5QlZ5THk3UkZwdUdtVWxKaG4w?=
 =?utf-8?B?WHNsdVNBYThIcmsrRXd1djJqRFBSUHdJeFU2b3BwNGZESW1IeHVjVyt3aUEw?=
 =?utf-8?B?SXVJaUhoUFB0bDVmSGNkWlNWQW80ZEQwSVNqcjhobDJVL21PazFrbmowMEdP?=
 =?utf-8?B?ekVIb212T0tvMDNwd3BBSDZ3ZkNvMmFiMWdVMjlZaXl6OUpQN2RFQlhRemdL?=
 =?utf-8?B?M3JSRWZMTU9reVkzVFhEK1c4OW5sR3gwMFFYYUxGcEduVjhsemdQOE85dC9M?=
 =?utf-8?B?VWRPd0lmbTVkSjVNQzE3ZFA0eDNwemlZV3lVTUxhdHVaRDZLR2lCZjNEelZH?=
 =?utf-8?B?ekJ3S1NHdDV1N2tYNzZ4azlIcXh6dDJoSzhBTjZtRldhbThaMTRJM1hCbURP?=
 =?utf-8?B?aVdTcjNiRFdoajgzbWV1a0RIdG1XSno2NkZOcFY3SnBpWHhidE9JWk5OZXlE?=
 =?utf-8?Q?U6DhgSFa8YaY4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WitkVm9iMDJFa0dzazR5clhWSUgzUlM5RUQrTUhUQTFucFFIeDdlSUQ4Vmhl?=
 =?utf-8?B?bVk5b2NleTlUNE1YKzgxbFg0a3N6QTJsbFRhc3JxbGY4bnljVCtZK1hFNTBJ?=
 =?utf-8?B?ZklYM1BFelNkUmdJTjlhc0VHT3lxSHVMVGUrQ2JpM3lqeTNsMTREZ3NtbkRS?=
 =?utf-8?B?YVJKTWMwdnVkZVh4ZU12WkpPeXdHb1JUN0Q3REFXRlNpQWtTeEdLZlpZVEVN?=
 =?utf-8?B?dVRPbC9YaE5rY1lTVEdIN2lDZy9xRnRQR3lpUERqbFpDejVrSTJhUFhydkYv?=
 =?utf-8?B?RjVHcXdiZjh5ZjUwK0hkVkRPaHVVUUVwKzA2STJhOENJT1lTdTZuY2FJQ2RT?=
 =?utf-8?B?MDN0TVJjUEtRaGFtRVB0RFRac1NRdnBzdVJneXBkNk9NTmhFTzdsdVBaMmRY?=
 =?utf-8?B?bjlRbU1BWkEzTjFQU0lQV05acjU5Ni9hZ3kvcVJvdXpVY2c1U3VpaG5GSVlV?=
 =?utf-8?B?b1BuUndoRW5rdjh0anROcFlDNjZTL2FvUjlmdWw0V2pzYVZhdjNNbks0MW5F?=
 =?utf-8?B?Wi9CM1BWVXc1MXhqdjJxc2hKUnUwMDRCSmZQRUlJU2VKQ3Nab3VsR1RBOURy?=
 =?utf-8?B?aXM2WWlIZTkwbjlnbVB2MDBpbTJlUTVQQXBUQzViWUM3VkdkSkdTYnVpamxs?=
 =?utf-8?B?UXk5TVFFMTA0TUtHTWFSMU4rcU95dkR2VEpxRWV4NzVhRzYyK01kRnEwZEc3?=
 =?utf-8?B?THlyM3pSVGhPaDZOd08rQ0NqZjJUeHRnZlhRNXNQOTBSTGZ0aDdYOEVYNEtM?=
 =?utf-8?B?TTZRWmxsN3ZUSWxqTU1YSXAvK081anY5N2M4MFBxMVJJTEsraEk5bXdMMG5H?=
 =?utf-8?B?L1JBcVlvM2xEYWJNSmdjSDE5Z2V2VlMzbUtoSmZyem14KzBGSG9HN1Jsakk3?=
 =?utf-8?B?aGN4c0FnK2NmSWIxUCtING9JTENabnpqTUZBNXM5Z3Q1bEtlc3Flb3NFSjVy?=
 =?utf-8?B?VHBvN0EwTlJQankvYWJmUkJqMmczaGVNbWd3ck42dVZuWmV4UDVyK2h2Q2Ix?=
 =?utf-8?B?ekJTRUFjSGhTaDZycmI5OGtWT01NbUNnM3ZySXhSVjhMSGcxZmx2VXhleWg0?=
 =?utf-8?B?RmVLbUF0dmQ5Vm1tVzFMc01Fc0dZeFVMRkk0WnNjUUJxSzM1ZVJCeFI5ZEJG?=
 =?utf-8?B?VzBuK1UxT2Z6TDFibWJVaEtiTnVIUmEyWWplU3pmd3pKTzZiKzBOOFlGZVBw?=
 =?utf-8?B?Sm9yNWcxMWFGU1FTZnNoZldhMlFIQjA3TWJqVnBURVZ5YkwrcGxOOEJleC91?=
 =?utf-8?B?dUxEZThCVEtwajdGTjZiZS95SGl6SU9BNWl5b25NSjE1Y2djRU1DNm5rbDJU?=
 =?utf-8?B?eHVDUG5lT0ZRdDhuUGVRSWdRTlRVei9mRGVXRWpSY01BMlMrWVQ2MldIejkr?=
 =?utf-8?B?ZkY5bFI5cGl4YWk5OCtaTnFlSWJiQ0ZBSGgxNW5qNVRuS20wZXNMeitlUkdJ?=
 =?utf-8?B?RWdsTXI4Z3gzZnhXSG9nek5senZqdFZyRjZHYlNrbm1KdzBjaTJMamZaMmtO?=
 =?utf-8?B?TlY2R2xyOFpBbHNNeS92cGtDVlk2MUltRXcvMkYwRXg5UnBNc1hOd0ZYZVJy?=
 =?utf-8?B?Z2h1MkMvcTRqd3VlN2dUaWdPcnJLUHhSN3ltTG9yeEptWStsVjdpanRuVDFC?=
 =?utf-8?B?dGRScUhWWVJOMzlCOU1sc2g0TGkxcVRiK2g0T21MYnBiTDdVQytEajIzamNQ?=
 =?utf-8?B?NjJkQmdxalpScUtsb3MzSjZjS0dCVlpBc215eldWUEdTZUlmUXJtemhnaGtE?=
 =?utf-8?B?MHNXbCtyWHhSbUhsTDlOVlJBUFJXMTJCaUpRbzI2QkVFdWFoenJIYi9TSlJO?=
 =?utf-8?B?dVAzNmYwWjQ2aTNIQTBORjVDOWhOdHg3TnNITDBybWZNVTJaYStvU3B3WVNV?=
 =?utf-8?B?K2hjQUpMcWZrS3AxdHMrYWNwdlB4OEx3V21QcFp1RStINWpVeUFvNWhpRDNs?=
 =?utf-8?B?czRZdFFENTNscXZFd2x5ZXRMTnNsbU9VQlVSbGJLMUMrYmFOVytVM1QwcU04?=
 =?utf-8?B?amhaSk5KdjN6cXltYjgvVS9Pd003S2F2dDd0TENzeU9OT0VBN0pvWmwrU053?=
 =?utf-8?B?L1l5dVVtbWlKTUhSVFlJRU53M2xEUFBaWTVNaXF1NTdYUXI3Y2Zudy90YWll?=
 =?utf-8?B?UktQZWxodFVHNFlEZkZ1Z3U5bGtpTnhmcFcwQmdPdThvS2hsTERUMnhRVDNP?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55392ae7-b745-4fd0-1afb-08dd3eb35f0c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 09:17:07.4065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWu30PprA3ZFNsK9hTTqzrxPLCcL4CPFrg/8H8CBLR8fZDFtcmuIk/bV2O5uLr07krangUDj+In2mD/sn6I/BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6854
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

Hi Kunal,

Please have consistency in subject of your patches.
Either start subject with capital letter or small letter.

Also, please update igt_test_description()

On 27-01-2025 11:59 am, Kunal Joshi wrote:
> add new dsc-fallback test which finds a mode
%s add/Add
> which can be driven without DSC at current link
> params and reduces link param till we have
> combination (link_rate, lane_count) which requires
> DSC to be enabled.
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 352 +++++++++++++++++++++---
>   tests/meson.build                       |   4 +-
>   2 files changed, 311 insertions(+), 45 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index b10946781..471381f1d 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -17,10 +17,14 @@
>   
>   #include "igt.h"
>   #include "kms_mst_helper.h"
> +#include "kms_dsc_helper.h"
>   
>   /**
>    * SUBTEST: dp-fallback
>    * Description: Test fallback on DP connectors
> + *
> + * SUBTEST: dsc-fallback
> + * Description: Test we fallback to DSC when BW isn't sufficient
Remove "we"
>    */
>   
>   #define RETRAIN_COUNT 1
> @@ -238,16 +242,124 @@ static int check_condition_with_timeout(int drm_fd, igt_output_t *output,
>   	}
>   }
>   
> +/*
> + * Force a link training failure followed by link retrain, then
> + * block until the driver has no further pending retrain/failure.
> + * Returns false if we time out waiting.
> + */
> +static bool force_failure_and_wait(data_t *data,
> +				   igt_output_t *output,
> +				   int failure_type,
> +				   int retrain_count,
> +				   double interval,
> +				   double timeout)
> +{
> +	igt_force_lt_failure(data->drm_fd, output, failure_type);
> +	igt_force_link_retrain(data->drm_fd, output, retrain_count);
> +
> +	/* Wait until there's no pending retrain */
> +	if (check_condition_with_timeout(data->drm_fd, output,
> +					 igt_get_dp_pending_retrain,
> +					 interval, timeout)) {
> +		igt_info("Timed out waiting for pending retrain.\n");
> +		return false;
> +	}
> +
> +	/* Wait until there's no pending LT failures */
> +	if (check_condition_with_timeout(data->drm_fd, output,
> +					 igt_get_dp_pending_lt_failures,
> +					 interval, timeout)) {
> +		igt_info("Timed out waiting for pending LT failures.\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/*
> + * Waits for a hotplug event, then checks that the link-status is BAD.
> + * Returns false if the link-status isn't BAD or no hotplug arrives in time.
> + */
> +static bool wait_for_hotplug_and_check_bad(int drm_fd,
> +					   data_t *data,
> +					   igt_output_t *output,
> +					   struct udev_monitor *mon,
> +					   double hotplug_timeout)
> +{
> +	uint32_t link_status_prop_id;
> +	uint64_t link_status_value;
> +	drmModePropertyPtr link_status_prop;
> +
> +	if (!igt_hotplug_detected(mon, hotplug_timeout)) {
> +		igt_info("No hotplug event within %.2f seconds.\n", hotplug_timeout);
> +		return false;
> +	}
> +
> +	kmstest_get_property(drm_fd,
> +			     output->config.connector->connector_id,
> +			     DRM_MODE_OBJECT_CONNECTOR,
> +			     "link-status",
> +			     &link_status_prop_id, &link_status_value,
> +			     &link_status_prop);
> +
> +	if (link_status_value != DRM_MODE_LINK_STATUS_BAD) {
> +		igt_info("Expected link-status=BAD but got %" PRIu64 "\n",
> +			 link_status_value);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/*
> + * Sets link status=GOOD for the specified outputs, then calls
> + * validate_modeset_for_outputs() to re-commit. Returns false
> + * if the re-commit fails.
> + */
> +static bool fix_link_status_and_recommit(data_t *data,
> +					 igt_output_t *outputs[],
> +					 int *output_count,
> +					 drmModeModeInfo * modes[],
> +					 struct igt_fb fbs[],
> +					 struct igt_plane *primarys[])
> +{
> +	int i;
> +	igt_output_t *out;
> +
> +	/* Set link-status=GOOD on each tested output */
> +	for_each_connected_output(&data->display, out) {
> +		for (i = 0; i < *output_count; i++) {
> +			if (out->id == outputs[i]->id) {
> +				igt_output_set_prop_value(
> +					out, IGT_CONNECTOR_LINK_STATUS,
> +					DRM_MODE_LINK_STATUS_GOOD);
> +			}
> +		}
> +	}
> +
> +	if (!validate_modeset_for_outputs(data, outputs, output_count,
> +					  modes, fbs, primarys)) {
> +		igt_info("Modeset validation failed after forcing link-status=GOOD.\n");
> +		return false;
> +	}
> +
> +	if (igt_display_try_commit_atomic(&data->display,
> +					  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					  NULL) != 0) {
> +		igt_info("Commit failed after restoring link-status=GOOD.\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static void test_fallback(data_t *data, bool is_mst)
>   {
>   	int output_count, retries;
>   	int max_link_rate, curr_link_rate, prev_link_rate;
>   	int max_lane_count, curr_lane_count, prev_lane_count;
>   	igt_output_t *outputs[IGT_MAX_PIPES];
> -	uint32_t link_status_prop_id;
> -	uint64_t link_status_value;
> -	drmModeModeInfo *modes[IGT_MAX_PIPES];
> -	drmModePropertyPtr link_status_prop;
> +	drmModeModeInfo * modes[IGT_MAX_PIPES];
>   	struct igt_fb fbs[IGT_MAX_PIPES];
>   	struct igt_plane *primarys[IGT_MAX_PIPES];
>   	struct udev_monitor *mon;
> @@ -256,71 +368,71 @@ static void test_fallback(data_t *data, bool is_mst)
>   
>   	igt_display_reset(&data->display);
>   	igt_reset_link_params(data->drm_fd, data->output);
> -	if (!setup_outputs(data, is_mst, outputs,
> -			   &output_count, modes, fbs,
> -			   primarys))
> +	igt_force_link_retrain(data->drm_fd, data->output, 1);
> +
> +	if (!setup_outputs(data, is_mst, outputs, &output_count,
> +			   modes, fbs, primarys))
>   		return;
>   
>   	igt_info("Testing link training fallback on %s\n",
>   		 igt_output_name(data->output));
>   	max_link_rate = igt_get_max_link_rate(data->drm_fd, data->output);
>   	max_lane_count = igt_get_max_lane_count(data->drm_fd, data->output);
> +
>   	prev_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
>   	prev_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
>   
> -	while (!igt_get_dp_link_retrain_disabled(data->drm_fd,
> -						 data->output)) {
> +	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
>   		igt_info("Current link rate: %d, Current lane count: %d\n",
> -			 prev_link_rate,
> -			 prev_lane_count);
> +			 prev_link_rate, prev_lane_count);
> +
>   		mon = igt_watch_uevents();
> -		igt_force_lt_failure(data->drm_fd, data->output,
> -				     LT_FAILURE_REDUCED_CAPS);
> -		igt_force_link_retrain(data->drm_fd, data->output,
> -				       RETRAIN_COUNT);
> -
> -		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
> -							   data->output,
> -							   igt_get_dp_pending_retrain,
> -							   1.0, 20.0), 0);
> -		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
> -							   data->output,
> -							   igt_get_dp_pending_lt_failures,
> -							   1.0, 20.0), 0);
> +
> +		/* Force link failure, wait for retrain to clear */
> +		igt_assert_f(force_failure_and_wait(data, data->output,
> +						    LT_FAILURE_REDUCED_CAPS,
> +						    RETRAIN_COUNT,
> +						    1.0, 20.0),
> +			     "Link training failure steps timed out\n");
>   
>   		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
>   						     data->output)) {
>   			igt_reset_connectors();
> +			igt_flush_uevents(mon);
>   			return;
>   		}
>   
> -		igt_assert_f(igt_hotplug_detected(mon, 20),
> -			     "Didn't get hotplug for force link training failure\n");
> -
> -		kmstest_get_property(data->drm_fd,
> -				data->output->config.connector->connector_id,
> -				DRM_MODE_OBJECT_CONNECTOR, "link-status",
> -				&link_status_prop_id, &link_status_value,
> -				&link_status_prop);
> -		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_BAD);
> +		/* Wait for hotplug + check link-status=BAD */
> +		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
> +							    data,
> +							    data->output,
> +							    mon,
> +							    20.0),
> +			     "Didn't get hotplug or link-status=BAD\n");
>   		igt_flush_uevents(mon);
> -		set_connector_link_status_good(data, outputs, &output_count);
> -		igt_assert_f(validate_modeset_for_outputs(data,
> +
> +		/* Set link-status=GOOD and re-commit */
> +		igt_assert_f(fix_link_status_and_recommit(data,
>   							  outputs,
>   							  &output_count,
>   							  modes,
>   							  fbs,
>   							  primarys),
>   			     "modeset failed\n");
> -		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
> -		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS], DRM_MODE_LINK_STATUS_GOOD);
> -		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
> -		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
> +		/* Ensure link-status is GOOD again */
> +		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS],
> +			      DRM_MODE_LINK_STATUS_GOOD);
> +
> +		curr_link_rate = igt_get_current_link_rate(data->drm_fd,
> +							   data->output);
> +		curr_lane_count = igt_get_current_lane_count(data->drm_fd,
> +							     data->output);
>   
>   		igt_assert_f((curr_link_rate < prev_link_rate ||
> -			     curr_lane_count < prev_lane_count) ||
> -			     ((curr_link_rate == max_link_rate && curr_lane_count == max_lane_count) && --retries),
> +			      curr_lane_count < prev_lane_count) ||
> +			     ((curr_link_rate == max_link_rate &&
> +			       curr_lane_count == max_lane_count) && --retries),
>   			     "Fallback unsuccessful\n");
>   
>   		prev_link_rate = curr_link_rate;
> @@ -328,7 +440,117 @@ static void test_fallback(data_t *data, bool is_mst)
>   	}
>   }
>   
> -static bool run_test(data_t *data)
> +static void test_dsc_sst_fallback(data_t *data)
> +{
> +	bool non_dsc_mode_found = false;
> +	bool dsc_fallback_successful = false;
> +	int ret;
> +	struct udev_monitor *mon;
> +	drmModeModeInfo *mode_to_check;
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	int output_count = 0;
> +
> +	igt_info("Checking DSC fallback on %s\n", igt_output_name(data->output));
> +	data->pipe = PIPE_A;
> +
> +        igt_display_reset(&data->display);
> +        igt_reset_link_params(data->drm_fd, data->output);
Fix indentation here.
> +	igt_force_link_retrain(data->drm_fd, data->output, 1);
> +
> +	/* Find a mode that doesn't require DSC initially */
> +	for_each_connector_mode(data->output) {
> +		data->mode = &data->output->config.connector->modes[j__];
> +		igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> +				    &data->fb);
> +		igt_output_override_mode(data->output, data->mode);
> +		igt_output_set_pipe(data->output, data->pipe);
> +		data->primary = igt_output_get_plane_type(data->output,
> +						DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(data->primary, &data->fb);
> +
> +		ret = igt_display_try_commit_atomic(&data->display,
> +						    DRM_MODE_ATOMIC_TEST_ONLY |
> +						    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						    NULL);
> +		if (ret != 0) {
> +			igt_info("Skipping mode %dx%d@%d on %s\n",
> +				 data->mode->hdisplay, data->mode->vdisplay,
> +				 data->mode->vrefresh,
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		if (!igt_is_dsc_enabled(data->drm_fd,
> +					data->output->name)) {
> +			drmModeModeInfo *non_dsc_mode
> +				= igt_output_get_mode(data->output);
> +			igt_info("Found mode %dx%d@%d %s that doesn't need DSC with link rate %d and lane count %d\n",
> +				 non_dsc_mode->hdisplay, non_dsc_mode->vdisplay,
> +				 non_dsc_mode->vrefresh, non_dsc_mode->name,
> +				 igt_get_current_link_rate(data->drm_fd, data->output),
> +				 igt_get_current_lane_count(data->drm_fd, data->output));
> +			non_dsc_mode_found = true;
> +			break;
> +		}
> +	}
> +	igt_require_f(non_dsc_mode_found,
> +		      "No non-DSC mode found on %s\n",
> +		      igt_output_name(data->output));
> +
> +
Remove extra new line
> +	/* Repeatedly force link failure until DSC is required (or link is disabled) */
> +	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
> +		mon = igt_watch_uevents();
> +
> +		igt_assert_f(force_failure_and_wait(data, data->output,
> +						    LT_FAILURE_REDUCED_CAPS,
> +						    RETRAIN_COUNT, 1.0, 20.0),
> +			     "Forcing DSC fallback timed out\n");
> +
> +		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
> +						     data->output)) {
> +			igt_reset_connectors();
> +			igt_flush_uevents(mon);
> +			return;
> +		}
> +
> +		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
> +							    data,
> +							    data->output,
> +							    mon,
> +							    20.0),
> +			     "Didn't get hotplug or link-status=BAD for DSC\n");
> +		igt_flush_uevents(mon);
> +
> +		outputs[output_count++] = data->output;
> +		set_connector_link_status_good(data, outputs, &output_count);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		mode_to_check = igt_output_get_mode(data->output);
> +
> +		if (igt_is_dsc_enabled(data->drm_fd, data->output->name)) {
> +			igt_info("mode %dx%d@%d now requires DSC with link rate %d and lane count %d\n",
> +				 mode_to_check->hdisplay, mode_to_check->vdisplay,
> +				 mode_to_check->vrefresh,
> +				 igt_get_current_link_rate(data->drm_fd, data->output),
> +				 igt_get_current_lane_count(data->drm_fd, data->output));
> +			igt_info("DSC fallback successful on %s\n",
> +				 igt_output_name(data->output));
> +			dsc_fallback_successful = true;
> +			break;
> +		} else {
> +			igt_info("mode %dx%d@%d still doesn't require DSC\n",
> +				 mode_to_check->hdisplay, mode_to_check->vdisplay,
> +				 mode_to_check->vrefresh);
> +		}
> +	}
> +	igt_assert_f(dsc_fallback_successful, "DSC fallback unsuccessful\n");
> +}
> +
> +static bool run_lt_fallback_test(data_t *data)
>   {
>   	bool ran = false;
>   	igt_output_t *output;
> @@ -366,6 +588,43 @@ static bool run_test(data_t *data)
>   	return ran;
>   }
>   
> +static bool run_dsc_sst_fallaback_test(data_t *data)
> +{
> +	bool ran = false;
> +	igt_output_t *output;
> +
> +	if (!is_dsc_supported_by_source(data->drm_fd)) {
> +		igt_info("DSC not supported by source.\n");
> +		return ran;
> +	}
> +
> +	for_each_connected_output(&data->display, output) {
> +		data->output = output;
> +
> +		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
> +								 data->output)) {
> +			igt_info("Output %s doesn't support forcing link training.\n",
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
> +			igt_info("Skipping output %s as it's not DP\n", output->name);
> +			continue;
> +		}
> +
> +		if (!is_dsc_supported_by_sink(data->drm_fd, data->output)) {
> +			igt_info("Skipping output %s as DSC not supported by sink\n",
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +
> +		ran = true;
> +		test_dsc_sst_fallback(data);
> +	}
> +	return ran;
> +}
> +
>   igt_main
>   {
>   	data_t data = {};
> @@ -381,8 +640,13 @@ igt_main
>   	}
>   
>   	igt_subtest("dp-fallback") {
> -		igt_require_f(run_test(&data),
> -			      "Skipping test as no output found or none supports fallback\n");
> +		igt_require_f(run_lt_fallback_test(&data),
> +			      "Skipping test as no DP output found or none supports forcing link fail\n");
This rename and update of skip message should have been a separate patch.
> +	}
> +
> +	igt_subtest("dsc-fallback") {
> +		igt_require_f(run_dsc_sst_fallaback_test(&data),
> +			      "Skipping test: DSC fallback conditions not met.\n");
This should be in this patch only.
>   	}
>   
>   	igt_fixture {
> diff --git a/tests/meson.build b/tests/meson.build
> index 2cbd21c2a..dd75976dd 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -367,7 +367,9 @@ extra_sources = {
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> -	'kms_dp_linktrain_fallback': [join_paths ('intel', 'kms_mst_helper.c')],
> +	'kms_dp_linktrain_fallback': [
> +           join_paths ('intel', 'kms_mst_helper.c'),
> +           join_paths ('intel', 'kms_dsc_helper.c')],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
>   
