Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310C3C021AF
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 18:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3B210E73D;
	Tue, 18 Feb 2025 18:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qg5cZbeP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27F810E73D
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 18:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739904301; x=1771440301;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ylDDOZx66LOw5GhpIWXRXz5S7fanOpVP4O9TvQkxJbo=;
 b=Qg5cZbePL1foszUcUckj6y6YJI65PGuifonlAOOs5U91pbjYwqAsIJno
 Ru7m5zzBpxWhkanuQx80yTzwo1Ft0MY9IXzcsqSDRtP1robM7A3vjzVpw
 yR0Uuqjgw9pbCVfWXCevJ1kcwSqCevgnc6koCC4MsAp6b6FXOtOPbF9Fq
 86xiSzTIFhQdrEpS8Nm1e1hLPcF1/r61TT53uIk/8DC4ebeJqPpV+0lLL
 SfwUPgWfm/aQSGyrSMYjgLwsXqIVu9eOuYy5K/J/RObd4/4fgLCM0zHwH
 cGESaoNFJGl8s354SkBCzijAkV4/sp3OBhC7Ck00x9szb4K2Qnz06R8T1 Q==;
X-CSE-ConnectionGUID: G5hOQs92ShaZoTFmoBa+7g==
X-CSE-MsgGUID: aMa21op0SRih4n7kzU5NLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="43448221"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="43448221"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 10:45:00 -0800
X-CSE-ConnectionGUID: pSRTrO92QSSeio3rHXiIpw==
X-CSE-MsgGUID: c1HUJHdoQvWYmc4KHWtZ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114948061"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Feb 2025 10:45:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Feb 2025 10:44:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 10:44:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 10:44:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JX0sNi72kcqsT1WWUwQXlmO9rfGHfuWZm7vrOKTpLie7JCBOcLpd24c07SCU2SbHfmlJ1FNwX6TK7GAtNnevEIKEqDC2yk5NtBE3GiK2A4nN80s2mDwa1uqmlGwrObH/K4Clz+Dps/emY3mA9P6e3XowfHWYnA76KJpPkZLKIrG/NaOGz6Ukp9PuipqmalToVq25tfUOkVJEk39kymvQ5zaxUQHmcQXEWQDWRlmIIWoAPcVGwThVQI0Hlo8kR2bwN5ZK9DoG4TsifdWNHyukwB047SBQJ1q7QxiBXnaLKa1PmvmX4cMF1dVsrWp8HIp5RGJKWvreB2ZwcogI+xJr6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwVo/nAjwQ3UDVFHipP2u8irgqxrau4jUgXQqdpyRc8=;
 b=kamDP/3iP6qMa7pAucKIuvjhCsMfP22MiAs+/JM+V3s7ULZAr7hV9YGzzz1TsogS9FXOHvs7PHdeg/Mr7E5+rFYqyXLi1+s0QJkpQWjNx68HTy2Gm+67npDxZEW4jMsteJHAZzy+89LXFyP6s/ikAnyeIVH/E1+d6fGIuYknoLvudCm5nG1UhBfoppkrvNpiNTH4BPTElQFxn3Hj42ItaekB/X+FAHhEcoys2SwkDY/RS04m8IVoW5wCyv70szFWgd79OuQJC2WxOrAm693ztglvQyCkCi6qwhDIRmsz1MidTOiOm3BXlmbo4OyZfu6X7QUMbXCnwZZt9wxcRrxYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW6PR11MB8310.namprd11.prod.outlook.com (2603:10b6:303:249::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 18:44:56 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 18:44:56 +0000
Date: Tue, 18 Feb 2025 10:44:54 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 09/13] tests/intel/xe_oa: Test oa buffer sizes
Message-ID: <Z7TVJuGk5lgHciFy@orsosgc001>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
 <20250215010628.1639986-10-umesh.nerlige.ramappa@intel.com>
 <85seob14qa.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85seob14qa.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:303:8c::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW6PR11MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e2635e-c1c3-4e3c-cb3f-08dd504c5699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3lSSlkzbWZLd2VTVTQ1ZDc0UlpwdHQ5UXE2cHNGdXd5MmFMK3U5aitrNHVo?=
 =?utf-8?B?cStCeklwemVuS1pCMlVtL0hkZTNqbDJZWjA1eWhQZ3dhQXJsbytZMTh2Z204?=
 =?utf-8?B?OWxuc3kvanhaVGl1UmVMcFBQSzd0Wk1XNmt0OHUwMGQ5R29uTHVkaXdqOFRw?=
 =?utf-8?B?dERPM0dqQ1JwNmZVdUJGbjdOSGdFYkI3VWY3MGtwQkkwUnFiZ3hJWlBzSXVH?=
 =?utf-8?B?Q3hYR2svY0ZXZi9YSGFQOHM0UVVDaTdKTTN5dTM4eENwU2pGYkkwUG5jUTJh?=
 =?utf-8?B?UWtrR05LM3E0QkJHZ1FvSHR4eHg3bXdwNkU5d1BSQ3MwN1VzbkdOK3grS05q?=
 =?utf-8?B?Tk9RRTAxREpHUVNQT2ZLbjhRWG5FMDdSVzZra1hVZHBqWU54dzJMU011Vlox?=
 =?utf-8?B?QjQxZ2QwbGtUb3hyaGZHYjlRYnV3UUFEM3Jjb1B2UUJXM3J2ZU83NXRiTVQ5?=
 =?utf-8?B?RnZZQjV2YUR4UGFCT2s0QTVucGJQU29Za0trbDRzUVpCRE1zelhZK0JwM0RQ?=
 =?utf-8?B?bmliTnlvSDdhY1Z3Tnl4d3NZMHpPT3VvMi8xY3NYbTRzYVVHMUhOamh6SUhP?=
 =?utf-8?B?emFPUVI3TTdMRGdlQnkwU004R3dwSlVOMmRQODZOakhCT3dGbHJJVWNVK3hI?=
 =?utf-8?B?ejdBU2lCTUVkTDZwS2hoenZwaVRKdVVmSGpBenlqY1lKaW1Hc2YzTXVPZnVW?=
 =?utf-8?B?eHpUaWtLYWdOYlJOVzVEbVA5VVBKdXJlSE5qN25xN2VIUysxVXJHQUNySWZn?=
 =?utf-8?B?aTBlK01xU1hoR0M5MnlvcEZrMytCc0RvZ2tsRnhIaUVBbkJIdnBiU3J2VGJw?=
 =?utf-8?B?STMxNnppQVhDb1dlREdlRmJGblByNzZRWGNpYThXM1pEUU1SZE54MzBoZmpw?=
 =?utf-8?B?SG5pSFR1T0Y1NGMybTVyUTh3Y3pkczFtWHlDT2kwQ3QxSnBORUlOeFQwa01z?=
 =?utf-8?B?Z3dGcHFVVnFOdExsQWxvbTlwNHdYZ0pvTEhodmhCUVhyYTJlcWdsSVlyd1ZO?=
 =?utf-8?B?cGlKK0lmUVhoN09XL3VWWDR4RzR3M3FkOStxa0lKSEdhKzIrMGJiL3dGUVZG?=
 =?utf-8?B?L3JZenZFb05ING01elg5QTZmeVN3TVliWkhQZmlNY2ZYWEJjZ1o4U09rM0I0?=
 =?utf-8?B?R3VpSG8veGFsK0hJb1RhSVh6ZmkweE9nR2RyL3RObDhHUFJ6blQwK21mc2Jh?=
 =?utf-8?B?L3l1WnZ3enJJR1hLdEpyRFhHUEtuUnNod1RqN0lWYWFINHdyWjhlMVVXWFNR?=
 =?utf-8?B?bmxpNlY1M1EwdXQxV1pwbmFrVUF4SFp2RDZtOHVtODYyZklTbnlydzhIeTZw?=
 =?utf-8?B?UjZnUnQ1c3dYajgvcHp0R3FaRUlFVjFFRTJ6ZHJKREtmN1VMV2d6QW10eitO?=
 =?utf-8?B?ZjR3dXIvN1NQMlV6Sk9mV1BERUt1VUUvMmRrVVJEK0NCend4U0hBOGovK0p5?=
 =?utf-8?B?a084MXhkYlQrb1FwNkxUVFRsRXhiRjQ5cVFmZndwOUpoMDAxQkszQWM5WVh0?=
 =?utf-8?B?SXBidW55d0NpejZSMFB3cHpRWUwwZDJ5UkdMTFZHdnJkTWMzcG0yWWdkbHdK?=
 =?utf-8?B?Z2VoM21GYjJGMWJKOG4wWFViMmJkQ2VIcFRIS3hZVzdxSXFiSVQrUFFXOFBQ?=
 =?utf-8?B?Y1lRWDlURUZsQ08wUXVEMzg1NXJIbEY3VHArM3ZSVjNyOGtpaHNtbTNFUFVH?=
 =?utf-8?B?OElOem9NUjJFK010dHo3VlZZdEhxdXhHK2tMZlNET2V3ZFc3RVB5MDhpTlNE?=
 =?utf-8?B?YjdTeHVTVjBycFJOZ2tYbzJYUEo5bU0vekhUUS9hSTNjNzh3UkRHZmorY1g2?=
 =?utf-8?B?TlczOUxRRVpjM2h2a1dpdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDBobHpZUWVGVjdOOFVxcEJJMTdld2U5c1h2YlEwaHRaU0dVNWJIS2I0Q1Fr?=
 =?utf-8?B?ZkVCcWRybGlhUEpkRkJrZVRreU0xVm1lYitzcFZpVVZHbk1LQXN5a3Bwb1ZM?=
 =?utf-8?B?cTcxQmk4dko3QzVQbXR1TlFKVGRtWVU3UjhZcmhZNW1RblVRcUltS3hWK2VV?=
 =?utf-8?B?U0hRWDVEOUhTdlI4M3VYOHpkcHpseklyOEtjMVpzRUVkUVBFTmNDeDhWQlVk?=
 =?utf-8?B?QlJRVmpYV29rWlNIdnRGZTQvQmtWR3pvSkhZYXpYMGNNTnMzZCsrcHRCV1Q0?=
 =?utf-8?B?ekh0bGV2MmRodmZ3a2N5Y1Mwc2h4OUZDUzVrUVFmYTZVUGdXQ1J6Q0xYeVV5?=
 =?utf-8?B?MWNhcHd4UGlySE1lY2d6WFlyelB1d25hNWdZOUpyQy9jajNibDFGSDYvNVNS?=
 =?utf-8?B?dHBDb3RWZmk3cFB0TkRzRitjNzBRSXlNSElmRXh0ZGVtcU9vanI4ZE84MXBT?=
 =?utf-8?B?Y2dPek1WZDNVVWNJVmlJeGpyeEFGREhNdnNrWDJyQkRkWm5IN3AxOERHYzRw?=
 =?utf-8?B?ZDB1d2tuZ3l1K2pJaGl5SkswQi96Y3puT280eVovRHZRZEd1a1dLSlovb2ZN?=
 =?utf-8?B?c0k3SThicDdXT1FaaDNqb0t2aXRDNERMd3Z0ZWlGc0lWVmF0NnNIYWQ0aGR5?=
 =?utf-8?B?QmlUN1RiQ1ZvaVkwdVp0azF5d2pVSTBxMXV2QkREK2tqMEhpaDEwRnBIYjY5?=
 =?utf-8?B?MEw5LzcySmFyLzhDM1AyVURrUlVGVzFYam93YlNKQzE3ZVBERG9naFlDc2Yy?=
 =?utf-8?B?dlBFMmg3K29wRE5CRURNbCtWY3pXc096aTdnaktNR3JXUXR4NURYdlRralls?=
 =?utf-8?B?SHJXS2dFK0FRSFBoNVlFTmlELzFLZ2FjUEkzRzdNWTAwWjdRMzhUREdPeU9a?=
 =?utf-8?B?RDdBQVpWSGtqOWc5QWxqRnlhUGNZL0FVcE1DbDhkeFhzSmJUNEcwQU5PL1cv?=
 =?utf-8?B?d3dSTW1VTHJWT04xSmo2aThRV1ZWbEVRVlp0TzJIUlZJQThlbGhmV3FvS1hx?=
 =?utf-8?B?VnZ1MUg2V1RyVXRQSHNjVTlTOEJic1NLQUtWT01xU2lFU01IQ0FmSFBsbTI5?=
 =?utf-8?B?eGhXWEQzTEkvTkJleW5vUjdYUm02WU8rSnVteE5NZEtvLzJrOEIzbEdKeS9p?=
 =?utf-8?B?STNYeDA5cnRJQTZhM09wbk1sMndaUGVJbTFrRHZOZXRpaFh2dEVLeWwvZVJw?=
 =?utf-8?B?WWJFRXdaeTNtTkthYzJ4ZDZwdncxRUZxdzJ1dUkyMjB3Nk4zalJmK0hJcnZZ?=
 =?utf-8?B?NnB2dEFUejNwdTBVODhORzlzZHBZckVLN05kU2ZPZ1hOd0xtUEFEcGphMkpa?=
 =?utf-8?B?eUtndzBUMkVSN0xrbVpKQ2Rxakx2T01ac1E3Y2NZb2VuclNKTnU3cWVwK2p5?=
 =?utf-8?B?emVyU0xPWUc5T3pQeEVTQzZhM0EyZUR0U3pZSFlGQzlNVm9wQlE3dERlRThm?=
 =?utf-8?B?VjdFb1MzQ2JaNWhnM3pmcWwzUm4ramIzVHBaZGhoRjZWVEdYTjlnV0RPemJX?=
 =?utf-8?B?a3dPWkVNZ1dCRjlEaGNOM0IzSzY1RUJKa1NvdXBEdXZkdEcwMkpJVUFuYWhj?=
 =?utf-8?B?RW5zWWlvL3g2N241TEpTVWROQ1B2OFlUdVlueTRwdHVIaG1McldqaUJQRkJx?=
 =?utf-8?B?SE1zb0loMHprYXU4amx2L1NVU1pUZmlyMDBhZ3RRSU5CWllsMUVHQ3ZnTmU1?=
 =?utf-8?B?cmdtK3FLTUkrR0dUdnlTSWYyTUJTZHZHUEh3VW5yZmpqYUJyZGJzV05MSTcz?=
 =?utf-8?B?bTNjMVBHVDQxNUoxdmtzZFRSVEFDMXV2Yk92R1ZkdE9hanMvTGpsOHlCT1F0?=
 =?utf-8?B?alNmRWoxdGhZWUthd3Z2dDAvbjdVVGQwK0x4N0JHK2t1MjVxNWF0MzJuSWRD?=
 =?utf-8?B?NWRFNmJGWm1WWjkrU1g0MXgxbDZjNDF2RkdrcXdkaGw3SVJMQ2tXM3B3d3Bt?=
 =?utf-8?B?MGRScXd4TmZVcE1VRXo3R0tKYmlWcmIvNFlwZ1crU2VpdWZaU2xLUG5aU0Fu?=
 =?utf-8?B?RVRTSmNERFNBNDg4S25PL0t0b3FKc3NYL1hLbkZFYmg2Z0lVUjY0bnNvY1hP?=
 =?utf-8?B?cTU3UmZDV3VlbFErWno3WmNEMmhPeGhhNU5UNWdhaVFpa3FITkJiemNNdmhO?=
 =?utf-8?B?RG4ya2M0YnpWS29qejd0eStyWjJVcGlySVJQeGxqMU8vY2ZPTkNzNjRXU0d5?=
 =?utf-8?Q?XJhDMx9PZJb4+ACAWIm074k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e2635e-c1c3-4e3c-cb3f-08dd504c5699
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 18:44:56.1001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99hMUu/Ukznc61CNCr/b1/i6D3JoECt0/p1OEAZYZmOOmQx7ecKT3gveNWY53mHXkO7ck3gQ22aKEy26kIVj1L9C3mBcx4yIzcugX4otrc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8310
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

On Tue, Feb 18, 2025 at 10:34:53AM -0800, Dixit, Ashutosh wrote:
>On Fri, 14 Feb 2025 17:06:24 -0800, Umesh Nerlige Ramappa wrote:
>>
>> Introduce oa buffer size test separately. Pick a random valid buffer
>> size for the test.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 30 ++++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 03d223df4..ee87b7338 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -93,6 +93,23 @@ struct accumulator {
>>	uint64_t deltas[MAX_RAW_OA_COUNTERS];
>>  };
>>
>> +struct oa_buf_size {
>> +	char name[12];
>> +	uint32_t size;
>> +} buf_sizes[] = {
>> +	{ "128K", SZ_128K },
>> +	{ "256K", SZ_256K },
>> +	{ "512K", SZ_512K },
>> +	{ "1M", SZ_1M },
>> +	{ "2M", SZ_2M },
>> +	{ "4M", SZ_4M },
>> +	{ "8M", SZ_8M },
>> +	{ "16M", SZ_16M },
>> +	{ "32M", SZ_32M },
>> +	{ "64M", SZ_64M },
>> +	{ "128M", SZ_128M },
>
>Would you have the running time for these? Hopefully not too huge for the
>large buffer sizes, even if we are running just one of them? And what about
>slower platforms?
>
>That was the reason we restricted OA buffer size to just 16 M.
>
>This is what I measured here:
>
>https://patchwork.freedesktop.org/patch/627269/?series=142128&rev=1
>
>	$ sudo ./build/tests/xe_oa --r oa-buffer-size
>	IGT-Version: 1.29-g724fd0b79 (x86_64) (Linux: 6.12.0-rc4+ x86_64)
>	Using IGT_SRANDOM=1733459091 for randomisation
>	Opened device: /dev/dri/card0
>	Starting subtest: oa-buffer-size
>	Starting dynamic subtest: 8MB
>	Dynamic subtest 8MB: SUCCESS (0.403s)
>	Starting dynamic subtest: 32MB
>	Dynamic subtest 32MB: SUCCESS (1.595s)
>	Starting dynamic subtest: 128MB
>	Dynamic subtest 128MB: SUCCESS (6.326s)
>	Subtest oa-buffer-size: SUCCESS (8.324s)

I can run 128MB and see how long it takes. I guess I didn't hit the 
larger buffers on random runs.  Technically around 30 seconds for 128MB 
buffer with 20us period and a 256 byte report. If report is 576 bytes, 
then 13 seconds. As long as it falls within the IGT timeout period, we 
should be good.

Thanks,
Umesh


>
>> +};
>> +
>>  /* OA unit types */
>>  enum {
>>	OAG,
>> @@ -305,6 +322,7 @@ static struct intel_mmio_data mmio_data;
>>  static igt_render_copyfunc_t render_copy;
>>  static uint32_t rc_width, rc_height;
>>  static uint32_t buffer_fill_size;
>> +static uint32_t num_buf_sizes;
>>
>>  static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
>>  {
>> @@ -1094,6 +1112,7 @@ init_sys_info(void)
>>	rc_width = 1920;
>>	rc_height = 1080;
>>	buffer_fill_size = SZ_16M;
>> +	num_buf_sizes = ARRAY_SIZE(buf_sizes);
>>	oa_exponent_default = max_oa_exponent_for_period_lte(1000000);
>>
>>	default_oa_buffer_size = get_default_oa_buffer_size(drm_fd);
>> @@ -4805,6 +4824,17 @@ igt_main
>>		__for_one_hwe_in_oag(hwe)
>>			test_buffer_fill(hwe);
>>
>> +	/**
>> +	 * SUBTEST: buffer-size
>> +	 * Description: Test various OA buffer sizes
>> +	 */
>> +	igt_subtest_with_dynamic("buffer-size") {
>> +		long k = random() % num_buf_sizes;
>> +
>> +		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
>> +			test_non_zero_reason(hwe, buf_sizes[k].size);
>> +	}
>> +
>>	igt_subtest_with_dynamic("non-zero-reason")
>>		__for_one_hwe_in_oag(hwe)
>>			test_non_zero_reason(hwe, 0);
>> --
>> 2.34.1
>>
