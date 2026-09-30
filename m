Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BD6CA5FBA
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 11:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F43C10E168;
	Wed, 30 Sep 2026 11:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRRCdKW9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAF910F2F4
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 11:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790766376; x=1822302376;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=HQdWwi++La0VZGPShbo+ZMp9yZwHlY4X3B5kglejrIc=;
 b=JRRCdKW9xl/F6Kd3GfMulNL5T0H8/83CWiR90t/bw/OqCvjTdSTDeYKB
 4x8C7boprVttoNq1hX8Gi5kI8swDeMQ9SfkkyNYPzKm1afEeEzf5Ctndy
 PzpX5clL9V4vHskQtMLrDjd5yzJ7KHEnMoTyLluZ0mZ4wV2y1lE4wht1E
 ZvlVL8x20iNLzxC+l0a96iP98AAX2P/5H40x+3KeuVco0S5tNPHzxMVPX
 fX80KO+KhA20/pGrQyvKw6eKau43cUnsdltMiO4wKGepCF/aq3ZLw4efr
 wWWoGTQvscEDrfMGKKLlWC+jijhAYOieieCMG6Vnenukl6iAssmhZ3o9U A==;
X-CSE-ConnectionGUID: ac6VRNj7R5CvK7o7pARY0Q==
X-CSE-MsgGUID: s/ZgiA9mR3OQkO07Ucp4iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102072011"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="102072011"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:06:15 -0700
X-CSE-ConnectionGUID: jh/mDSslRMu6C5QlhKMBjQ==
X-CSE-MsgGUID: AqQ/EZj+TXmik1nSEPhliw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275221185"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:06:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 04:06:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 04:06:14 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.52)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 04:06:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyRVoDngUwEnDzzkQl3D+H9eYiCaYbYXCk5A/pj3RbNP6mgSEHHxGAQISX+cRKW9okIcqIwsypzcrOB/ykSULU0EyO6Rdj+S7d9B5ta/DULfWGxDl+LPd0TP7lLfpWzsFgAQS/YfTb4vaaz+k4dVZ05BOmzTYsNLL2AWTsfKmbYnv8yUyM85ULKm02szwovhAzzS3xVI6savSo/6zA1bXgK+WVtUxpmkKt++I7+kZBCjEnl8m1ekHinnHuzNYyhfwXTNUzKfgKRdSECm82khPBiOxvfKE4M1XeRxnGy/h8Cl+ByWDqkqXLVn3qK+dEnQgdCwvt/ZxU8ZTx6AmNhIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQdWwi++La0VZGPShbo+ZMp9yZwHlY4X3B5kglejrIc=;
 b=hlGkXNrmCBj96PiAuPcztF6y6gs+pWTj7ZTrFHyYsopKMW/wEPVRCcjK+oGdaSByyBSZFxGlRPFaYfPuyUkezzlF9Ze6GOArjiCzrGvjXNvhuvUQeT77+drkWtwecE6KtDTjFmc6pjWSCRRgq/OwUIWSfk9OIYkwhgmOqpvHVZXePo9upyOOper+vH6LEgNA3yDpKm9hdqeIWB4WtcMPOJc5+CKKoleO4o2PV6XSp+jJPM4jJPhwHETqIXhrNFR7ak8mFuapKM4n+DWtzvinSTBNLOb45R0wTyQ3cYRIAFGRaNkl4ji0Ag602Uidz70aRN94omc0hpRCOR8k6SFnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 11:06:11 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 11:06:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 30 Sep 2026 13:06:22 +0200
Message-ID: <DLSLPB47KBCX.3B4RTMBTWH25L@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 4/8] tools/gputop/i915_gputop: add i915 PMU engine
 monitoring
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.22.0
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <84e6c1f62a64cd5f6a9ebe549ce32b123d623f42.1790331690.git.sebastian.brzezinka@intel.com>
 <2wlmpoiinqrdba6skfdwswlvce7fh64zawqfb4cx7kp7dfjjfp@mrocbsbiys5e>
In-Reply-To: <2wlmpoiinqrdba6skfdwswlvce7fh64zawqfb4cx7kp7dfjjfp@mrocbsbiys5e>
X-ClientProxiedBy: VI1PR0102CA0079.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::20) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|LV3PR11MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b18a2a-60fd-4861-196e-08df1ee2d62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BPHu6DHYjsvxR0Cj1Iwq5iGXysAsF/uK/acrTgoOMnTtqF6UeZF7kyJFiJSTK66fSDU33DHjcodg0qnWMds+eLG1ZggtpG8Ja/ZAAKi+hmhF3NLdbgAmN6iFyLRvdo1kMJBVLo9zlOQ0v4o9OzdCRP9eGhYEA0ze5lqVwvLbXjCjHjh9XMKgGFZw0jCGzEdRx1zWhLX5ErZXv09KAt0rdtl6K34EI7eq/6iCED4CYZ7NDallHUhJ5KCmJJIFVD9QjMat6Jy8NHbQLd7xkxmbSrz8/Hx8/mlGpd6X11+uLyvAy0wET/FCK/w+FT7ZCzXbong0syDLcAkm7bJWdPqYVYggQZr+BhAGszMRLRvsrrfr15VJSfexys9O+Ol6uTgNaBxDLgoyLOKJoJRRXvQXQEE4rUUI4KaTTB9yaIGIZN5U0SHfEIzaI3O+G4fM1Q6EzVrStNrJpkDncTKvvncS6+ny9W90ih90wSLHh866wLyRrbD5JeKxPUgAwxZyrwna51FtvOQ2z25+lo6SMZv+KrrLStoNhyv2LGskRzy2LUV69mF5sYLTWmsMdSsUjxYvYoid/KHJm+fzS4TrBfpCD24dzVixyfJnoyeQsklZCHO56jeFymSDB+w0YAsTRhwzSA6bsXKeQbyCFjVB55mNkmHs84Qa9avf9+QB2rPbFms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjloN1dMUVJFdWJMWWJLdDhoQytFbEMvbzJYVENpbEFRUEtiTThwTnNUdC83?=
 =?utf-8?B?SG02L3kzaklyVnVzaytvTGNVQSthQWxMSmU1ZkxaTy9CT1U4WkZEVUdDVEw5?=
 =?utf-8?B?a2w0VndOUzlzb0ZaWlByR3pTUExzWCttTzR1SG9pOTUrRTVkazZFVGNHMFNH?=
 =?utf-8?B?OXgwNVF4MFV2dDN4cjFKWTZrTXk2R290OHY4SWl1RFFPeVJZckVJT2dCaFE5?=
 =?utf-8?B?VnV4OUlHTGxHblluYWpTemwyRGlubXptUHRRMFF4TThFNXBpcjFLckFkaVAv?=
 =?utf-8?B?ZmI5bTFJMDJQUW8wOVRGSEs2NlQ2SVU5OVBsd3VkNENsdjRHMFFDOXpueTRV?=
 =?utf-8?B?Wm4xQzhKSm9HQ1hmQ0k4ZkpqQTZ5SlRVakxLVGVBdno5NS9aTyt4NXc2ZGtH?=
 =?utf-8?B?Zy84SDBrNTM3RlJLeTVHeUNFaVlhdVM0WkNVT25JWW55R1pSRW5ORDR4Wisr?=
 =?utf-8?B?MjkrZFJLaktuTVVxWXJXcXdPbEtJWS9iVUNkYU5QTEJjeTFnRGtDYzRJdjY4?=
 =?utf-8?B?UDNjMWYwVnpWR2hlVXFBRXVMcnBVQ1dvWk1XdmZGLzZuRDUyMlZGZXdvSldu?=
 =?utf-8?B?WkVXNEZwU2VCNnZtWSsrQjF2K29nd2lWam03Y0NGaVZIbmh3alp2cG51QmhP?=
 =?utf-8?B?MTZOUmZxV0hsREdHK0pTTkhNaThiNFlSdGRVaUF0dlhhKzUwT050UGRrNy9P?=
 =?utf-8?B?Nm5VbDN3NHdEejNSQ1grZGFqQUtjTGJTajhucE1YVjFKKzUvSkNCUzNpdERi?=
 =?utf-8?B?aENyZWdkaTkrTVkzdldTbjdvOWE2b2ZYQTcyWktkRitjbE8wTFE1V3F0bWlV?=
 =?utf-8?B?QUp0Zk9HY3NFR0JFVFpyc1BsUktnMTNNS0pRWnZFVWdzKzFWTmlNSjhZR2xB?=
 =?utf-8?B?RVJrc2l1VkZUVnV4L3BRRUxuWVNEWDAzVDVTQ2dkaWtMc3pJOHBXSExldWFm?=
 =?utf-8?B?YlEybG5FODhPS2VJem03RFFrNlE0NFBRUkxOZVVtaVJIdlRsT1Y4NTYxdFFL?=
 =?utf-8?B?blByZktuNzJiVnFLNWxGYk9raGY0SHNlRFRwQVV3dmJZT0R2M2lDMmxpK0lj?=
 =?utf-8?B?SzVjL2hjLzZCajdoc1Ayak1GU2ZMbHFiUzg4djFob0JRQW9vMDI0Y0xrazV5?=
 =?utf-8?B?NWJDZ0VOcDAvWU14WE0rODBGMUw2M3J5UENqWE1MUGFNd3c1RFIrZVN4SDlj?=
 =?utf-8?B?bHovc0ZpQlprNitjcTNRWW4wYjI1eVNRMzhtTG1Fd2tpV2lRWk5kUHhNelln?=
 =?utf-8?B?SDNtTmZSMjVqbmN3d1YvOU5iWEFsSDRMcU1pb3AwZVBIQlJ1cFNOYWtSSzlX?=
 =?utf-8?B?bWVEczVKREg4eHg4cHR6VXhLTWFQUTh6MStwNmo1dzZDUUlpcThsYnBXYWEz?=
 =?utf-8?B?YjhyNFhXTENwUUhwWHpJVE1XTUR6U0VQWjVhcnAxTU9nbjBvS251RWFRYkJa?=
 =?utf-8?B?QmVSdUViRVFkdno0SUs3RWNaS3pJMWJuNVd1Z0orN0NldXorVVphSENnaUdE?=
 =?utf-8?B?RVZRbndiMHNiNENlck1Uek40SnNMbkpXTEgzK3JpZlI5VVo3aWdaaWdUQi9i?=
 =?utf-8?B?Tk9pWGo5S0U5Q1E4eEhBRUpaMjBpR2JHTXpqcGthQkp2aHQ2bzFNMlZJeUpB?=
 =?utf-8?B?TUVHRDU4bDVRRHhsOXNSSkd6a0lnVFlQM3VrWUllUDZ1WWNaWmVQNG5rdVJS?=
 =?utf-8?B?VWRsclJPZlM1WmczSnRWTDIzTTNrdFJ3S1BlTFJaNTdZVHRidlVHNDRwZm1L?=
 =?utf-8?B?UllrUUtvNUFIZ2wrUUhnQ2xEcEFOTlp3YjFFQ1ZwbTN1QTE3TlhHL3dvRkVF?=
 =?utf-8?B?SXUvSzltejNSNWNMYmgxOVIvNFFWKysvL096Q2kyQnBYNlRHY1FNNGpJQXk3?=
 =?utf-8?B?LzZOWS9JOTNZK0doUUJFR084bGY0RDVvK2x3L0l1dERZRFo5aC9wRXR2bTNS?=
 =?utf-8?B?dG5sT0tyRkpjcWdyMU1jT3hRdnQyYlNaVEtXMHZNU1FZWWZ3RDRCbjgwelMz?=
 =?utf-8?B?MllWZjU2clhNSDNLZ21YYUs1c004L1FuRGFORVBmdkZIVTZud0VJOW5WVWJF?=
 =?utf-8?B?MjFjVXg5eFdpN3k0c29rZWxLSDdxUmN0OXhvb2F0V0ZIWm8vZWNKM3F6YnM1?=
 =?utf-8?B?WTZQOUszR1hVQnpGSzRuN1VQTDVNR2VVVzRzV1oxWVJONjBpRkczL0dVcndZ?=
 =?utf-8?B?QzVNYXpEZzdlajllb0RkQTFrTS9sL1lCOEx5MEwvV3dVRi9uU0pFWE5MV09x?=
 =?utf-8?B?aUZySTBBbDZYWkJTWCswd3piV09QYXByWmFVcmpRWVhlTHhFNWp5VG9kcTRo?=
 =?utf-8?B?cjBSQ0hGSndwVlFaUnZzYUVnTkV0UnRYa1hJWEJBTHJFeW5zdjFvcng5Z0w0?=
 =?utf-8?Q?zyAhXktzKTt63keU=3D?=
X-Exchange-RoutingPolicyChecked: Gy7wEQhLHrboizxx4lK+mBi46lrckmBNTMZ0YGYSO2I0UmYcBbax4CChju7nBVSpdaPhg3ISRRLZG0D63PzkidBDeZfEAWm/6YAP+9fT6JvXlrfKZ5AKKyOVsPmSKhgeL+yyfjSBCeRcExn5cVLKmqYEATMorQmaYoQmgUbGfE0fDz8b/8RkP3bcpzXIZglP4r3WskjAjvn9ew4vpkp9UmKH+j/nT8OP/KIsX8DJsPbTNUlteUXonRiadvqdK0mZYDN23Mdlr5/Ook5K3qnHbq3Z2mvjwfs2n+rAL0ozpZ5+e4UTym3xBN0sMb3cG4yawFaCw4aTUaOIEgU412GgFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b18a2a-60fd-4861-196e-08df1ee2d62a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 11:06:11.5760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndfDlZJNuA9h7xzUjkzEaOgxHJwQyxGVRyzBw8guZkv5Z1gmW+BmUnwX4xXgF/iCPwwwYmMd6KFW5zrE5Ew8tDSi4y+OCfbN0tapPkzaPPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8505
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

Hi, Krzysztof,
thanks for review.

On Mon Sep 28, 2026 at 1:01 PM CEST, Krzysztof Karas wrote:
> Hi Sebastian,
>
> The implementaion looks OK, I am wondering about the duplicated
> bits and whether it is worth it to make funcitons forcibly stand
> out from the Xe implementation, e.g. sometimes you have tiny bit
> of difference in formatting, or there is one more helper
> variable in one implementation, but not the other, etc.
>
> I'd say it would be worth considering extracting common parts
> into a shared file, but not necessarily in this patch series.
Agreed on not doing it in this series, and honestly, I'd lean towards
not doing it at all unless we actually get more backend. Each vendor
backend implements the same interface on its own terms, by design, so
each one can do things however makes sense for that hardware. Merging
the common bits now, with only two backends to generalize from, risks
guessing wrong about what's actually shared, and we'd
end up with an abstraction that doesn't fit either one cleanly.

It also helps that gputop is a small standalone tool, not core library
code, so a bit of duplication here is cheap. If another backend shows
up we can revisit this.


--=20
Best regards,
Sebastian

