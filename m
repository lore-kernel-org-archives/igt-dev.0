Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20878CFA466
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 02:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA20210E0D1;
	Fri, 21 Nov 2025 02:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHIRKDae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA60910E0D1
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 02:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763690859; x=1795226859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XM5OTGWZj6Xsfb/5N3wlXFdJYVITUWuY2RBD0qgiNyo=;
 b=mHIRKDaedU52yLgsGHQzQDqc5qhOr/FBxvsDrbdQGdZx/32jBgOISOvV
 EnIGYpc7hXxQ1tAFr8VF3otoqKFsZomcs2vu14qBK/nWVa3gFM2UWzghe
 Bc4+UVBAs/E5ydCzRu207gbZaMMk3XCv1LNCJqEaoIuv77V+y3rnAsY/N
 lOiYyMcDR3Jk8wK5CBr5dLVtnOy4Sg+jhiuUSaxuUEECvkShuAc/s0unV
 sQtL9MQAGINzV+xCboxhlr/oQn89mSH2DWrr2c9y3wd2B+zpn6hO+cOf6
 /o9nU0P6xPMSax8nb+0fsXKBEZyGuUXFRIJ7G6D6Dphw008tDen8t+dBR w==;
X-CSE-ConnectionGUID: OiyNPdhoRHWra1f+p67jZQ==
X-CSE-MsgGUID: 35o2mgQnQuC3RBbY8TB/Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64785713"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="64785713"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 18:07:39 -0800
X-CSE-ConnectionGUID: /1PBC/t1Qz2+t3qlT6PLzw==
X-CSE-MsgGUID: 1RhUkHreTUeF55s3um2MQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="195830395"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 18:07:39 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 18:07:38 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 18:07:38 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 18:07:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBRFCCpcKx3HpcHCJSzhgUSD0Nw9FBzzRZM0jMwqK+jKi69padiNMBAJJxzhgC7N45tEnam5H027QEaLKY+ekYalI08L/D5O1Lxn8wRPaBhVvDkr3qeQ/W62RO6xLqFp4hG/LHP24X/P41hwLkK53/pwuQ8WOQH98cX0nc/LhMOpF0poZYCUbYav1liiocuHtc/LuEKnFWlv9vQsTDAqHfQnoS6uq3/v/J44AqkP9JSCN1MRK2KN4NO7F42IBrkcDUDY+MaFVWR7U7Ybe6YzWrxzi2T4Xo5XztrMlN1WggrpKtjs3+Jqtxm0BJkgEXtBbtwMP87UWrluhtiZLGld3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0tN2Y0grpM4qpC4Cju1kw71Kf8+Cb1Ta2Lw9/sGRQc=;
 b=r+4KIXxbcZiEdlP8Axxk9s4ck/xEqaDx/I+8mKu5Q48Y0Ste9QnpYG81glpIXSNREEpNCck1r49a8sE3NagN7sN4hvdG9SqyXXuXnJc6+HxQzKbkt89KW8XlZsBKQRVfN8zAMhdWhfnLwB8OOCEr3cuFcFuMg3SR/A6nYtuVNEwlUf7UX2tEr0TrHjYmsRZiINJSNzIo3qcseE0d35CM6TNQOT3aFVSIErDc9++0/FkRCjdQMErqOkBhp+gf7C7ReO/Db+X+16XQQYpi2TF+k0gIn2ROsJejXnaBuSk3t4IRBejwKDOxpTcL9JqKe0Slxw0WWc8QqEdkyOC7gSlrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DM3PPF3E6742BA8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 02:07:36 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 02:07:36 +0000
Date: Thu, 20 Nov 2025 18:07:34 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 16/18] tests/xe_exec_multiq: Add submission sanity test
Message-ID: <aR_JZsro74e5noiX@nvishwa1-desk>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-17-niranjana.vishwanathapura@intel.com>
 <BL3PR11MB5747A3026061E15571C4DD66D0CEA@BL3PR11MB5747.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <BL3PR11MB5747A3026061E15571C4DD66D0CEA@BL3PR11MB5747.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DM3PPF3E6742BA8:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ad9f00-4af5-4d0c-11eb-08de28a2bdba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DpHxQmOxvQbKJuPyFYlCaS/hzAI3hBzjp6m2hVMtH9FfDqlLV1YZ2Z3dQ2iB?=
 =?us-ascii?Q?qUOSo4LXn5fLZxLiZFFX4/x4aMoi87nKB9si8yFtL+fGoChA2d4ogqrSaarp?=
 =?us-ascii?Q?AmbknW6KGBAQh3KzCBVf20lPAS2nHwzOzLmMmjCIQpN1865p3PAt0OEe2p19?=
 =?us-ascii?Q?4S8SdpJVt0VzMPf3+kizI+sCr13Uz2NA+koBtllIU1AiWyT9b5/ZGNhaSubL?=
 =?us-ascii?Q?Tsh8Sjr+zOFij4pwKmioOhvaLrwcvMXRAfouifjSPkchwCU42o2/zgIWmDwE?=
 =?us-ascii?Q?+VY7FfaKcuVhXGA0jzRBW1IieQAwU3lvayrhem4eyJhz2arrgcUi+9Cn+xqB?=
 =?us-ascii?Q?ICGuJQ/DyYUZLbalWx/3cstm/1cSPwgUckdPi0weZWBwdoXL3qfnr1pZ4gPF?=
 =?us-ascii?Q?qppcdn2o/j4eXceTszMdEEPHXv+5W+mjcgzBvD6T+8wJ3+Opm7hLoL81EOX5?=
 =?us-ascii?Q?W8+wT/9J+8ot5Ooaqe/8uxgYV/2TMrNBgOMkQLRZfE7vnAhTifPxMLBSNapx?=
 =?us-ascii?Q?+/a3AgHlyX4Rs0YAJOFRBJGcWkYXVHM8D5Xu6mFpnc4lNBipKEUCmvpT/vNl?=
 =?us-ascii?Q?cLhEAp4BXF9J3dtN86J3dtXaDhTymmuSyXRfOIxH/ctxioiPc1WGXaHUnGqn?=
 =?us-ascii?Q?EBqQln7t3BFywfJspzj+UyOfHlE6v0X2/B/7AvWexQOL1fis0OLRp007OYYD?=
 =?us-ascii?Q?m4ClnZnCrh4iUEeGOyDLLLFoHLynkgi9IgydwhSfqGK+EKEwZRWVvdhqAV8l?=
 =?us-ascii?Q?iFtDRFq4EeSDh09zeEan3qPwTiLBI69hbEp/xWodM+dvp+K7U9M1KNq5C4Ds?=
 =?us-ascii?Q?qvVgspGGtfta+9a7QkWcBBSUXe34Lok+90Tlmc6xuSWpyfOxUzX5owob+D5u?=
 =?us-ascii?Q?lmv0GUg7+2T7Acuw4HYv0WtexPE42CezXEspLBD9AdO8VULW65+pTutQOXwW?=
 =?us-ascii?Q?9pZ+QFYauU5ci0EhjARtJV3uZZiNSWKrTHSWx9vD1jK7pWNCfq+BgaQIKGWn?=
 =?us-ascii?Q?18sCHwqQYJ5n+f7xfEOB2ccTgKWfLiL03SnX9HtLkL7s2d4uoN9GhdOE1SvU?=
 =?us-ascii?Q?NU96m+078LmxdPLOHYYngL5JgQRlHAk77pXnQbCmblJlgrJKddB1sRjbjZpw?=
 =?us-ascii?Q?JkbffyE1+/tXOCD4o8RNqlOYkESoP1ndaSYIN0ZQkZU+1X9JHalHAI4dO4XQ?=
 =?us-ascii?Q?1y+Eb0S2PwpIDlej+ctKtE89kBxMlMUxX3PciYXsyMsNMOqTRe6O7Ijnot0f?=
 =?us-ascii?Q?9dUHR0BsD1UPWS2Y3+x8Hjp46nawYqq9qeIva6WmmBmORyh1jX/ht3HNRV5V?=
 =?us-ascii?Q?0jZ3cTwmV+LbM+DljrgYXx8H1X2JzRFZPcrBEk0DGDPVunw+i+VXNwBvcQVJ?=
 =?us-ascii?Q?wZn6I57nKi182p7PGakdSAoQzP2Lb0EZFzIYnVbiRU8DWFEv82hBTg/13Ah9?=
 =?us-ascii?Q?foZE2Rcl602+wWmdW92GuDFRzaXi4SIW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vi0042C7PFqCeB3tjqNh02/u2txFjkw7f9bnfhXxzDRsqM4/wkC9/SSX4RRZ?=
 =?us-ascii?Q?3KYbD+QfoUOPDs31dg7ceRs5neZxMnf1Q4PPGz3nM8eA9ToR4ZG7n2Cs6POM?=
 =?us-ascii?Q?FHR4pluRoTwRR5o+oZL0m4lT6DoWfovi1fng0Jc8alRdQAt0UV1OmuOJVxzY?=
 =?us-ascii?Q?svCu+Hzk6OT8txwsyr7k8u+QP1B/Kn+1+prTFPemb5XtSggvVVMwKQAgl/EA?=
 =?us-ascii?Q?J+WcF8ABD+FuYatuyQ5FYJ3A30orBDtZd53dqi3klSbN3390SNo+43T4X7nW?=
 =?us-ascii?Q?vCP/IqCVewOOgUGtgb6MOCe8dVoN0qfyQQ0FFWiMBvUUPErsw8hv3hxoIMC5?=
 =?us-ascii?Q?v7G01v4pU6DorY0w2BdYz6MSTOipPZQVZNQLhvYIGHs0WgGWKGz9cNp2+PHo?=
 =?us-ascii?Q?gRAIm9vQlnC3AHxpuIUbKrvRUeXWnFNtmSZYc+7wZ/LhtBWYeu2H8hzaCUJs?=
 =?us-ascii?Q?4qgRUMykRnbZkxzEKcr7nTwUiH9xaf9PewTYWXcnILeWRf8n9Rk30JHSxZV5?=
 =?us-ascii?Q?lJbF9ER2z9kYMBNt9wQupk4CrrnboLIj6BpEBqqsqiYPzsnHs2Jjtco6ooP0?=
 =?us-ascii?Q?nOaxobTD6daOy3yB4rl2iszHbo4ULXrRQ0wOKGhaN08n5pmlsJLElroVPHNQ?=
 =?us-ascii?Q?pJNwUIlecHKHUfr5sSDzJH6Zw7VEQ8J4uNihQSMTU2sYp5bX1TZEOkrcfvMG?=
 =?us-ascii?Q?VJzGLy5FCQEsRQOpLGzPPTRWFmZm685lbmBZa5ZXuzCMCzla2NFbEAmaqeNu?=
 =?us-ascii?Q?1qHF0eYN7fXhFYKm1c+qNgB+41lMkE4idakw62mDHlaGoOeGzEGEWUjCeMam?=
 =?us-ascii?Q?0et894ICuqPe7EJPkFtQSW6Qpcg6/gg08DncwCfyL2GB/8UdmGk6TreWH1ZC?=
 =?us-ascii?Q?FWsgukPA4jFD2I82ZHclDnClTRuVxRELDMdCSsfa7noAWv0GuDWgtVT2Ah90?=
 =?us-ascii?Q?8xrDqxQeZ8yQ7fW5yDXIBZ1iFvA94VhDItJ75RZ4/Qes/Xgcnj9YpO8CnAyY?=
 =?us-ascii?Q?4yVSawB9h7o6qjYtfiM90iW4s6zIIry3+ND/eV7xX4rzg7MbM6CmhjKNJga/?=
 =?us-ascii?Q?fiv1mat6/rn9YRJrmQ8QkvJrAgjOxqM7P7r8sSVa3Hkb1Vnl3DOGqePr93uP?=
 =?us-ascii?Q?52NhNIPW9qp15xrJTqgqq0TvRb8YPJVaTVlcNbr8hXoPaB+nQ4ZVITKxftmi?=
 =?us-ascii?Q?vM6OXExO9SvwY4duci8Z5l61RwXhkBPZ3UivNP3IjLusgHMNoIAAgft2GEfX?=
 =?us-ascii?Q?mBSS1jH05S6jyZnyEfK1bpNKnnn01q4PAkEpwXRwMKhvS7Nz0GCuefCk6QOf?=
 =?us-ascii?Q?daNoTSmg+BpCMc+fs923hUFKgxCLS9X3WzOuFW2BHWp3Y8Bxszzl28+bXbxR?=
 =?us-ascii?Q?POPqEYDmatjipph9Y2SbKMEKRNJNRZrEUPKDQ4+qwhChUffOCWWN1+I45MAO?=
 =?us-ascii?Q?CsmGkAV43QaVs2bBpNjRBR5UrbNjw2po3KNzK6QGEBSjkekrlRBYMOLs3+/0?=
 =?us-ascii?Q?2AQ0FHaIby6uRIKVeJC6x4s2BKlvU+wTUjVY6pXIp3IhnJuvQXZm4m2oebKj?=
 =?us-ascii?Q?d/kGCldW09BYm5FCfTLT8VjbZTQOnatVW/YPhdifgH1x8MJnF6FDDZmfYzr+?=
 =?us-ascii?Q?/IkWKRz304CclOR+HJlrkoc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ad9f00-4af5-4d0c-11eb-08de28a2bdba
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 02:07:36.7336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzDDeg8HLRSGyQqimC1iHmHeb4yzfD0XbjnJro/s3NgvMILQTGoZ3HZim6Fc5WMcsDYBBqI/wMvytiSVVJt5mTtTzlYcspSiZ/tHAa4XtUE4ei3YjRFMEBbAbqmTxGUb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF3E6742BA8
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

On Mon, Nov 10, 2025 at 09:55:17AM -0800, Ch, Sai Gowtham wrote:
>Hi Niranjana,
>
>Please find my comments below,
>
>>-----Original Message-----
>>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Niranjana
>>Vishwanathapura
>>Sent: Saturday, November 1, 2025 12:06 AM
>>To: igt-dev@lists.freedesktop.org
>>Subject: [PATCH 16/18] tests/xe_exec_multiq: Add submission sanity test
>>
>>Add sanity test involving exec submissions in multi queue group.
>>
>>Signed-off-by: Niranjana Vishwanathapura
>><niranjana.vishwanathapura@intel.com>
>>---
>> tests/intel/xe_exec_multi_queue.c | 138
>>++++++++++++++++++++++++++++++
>> 1 file changed, 138 insertions(+)
>>
>>diff --git a/tests/intel/xe_exec_multi_queue.c
>>b/tests/intel/xe_exec_multi_queue.c
>>index 9cd4a7a16..10b89692f 100644
>>--- a/tests/intel/xe_exec_multi_queue.c
>>+++ b/tests/intel/xe_exec_multi_queue.c
>>@@ -44,6 +44,9 @@
>>
>> #define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
>>
>>+/* Number of queues in exec sanity tests */
>>+#define NUM_QUEUES		2
>>+
>> static void
>> __test_sanity(int fd, int gt, int class, bool preempt_mode)  { @@ -216,6
>>+219,137 @@ test_sanity(int fd, int gt, int class)
>> 	__test_sanity(fd, gt, class, true);
>> }
>>
>>+static void
>>+__test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci,
>>+unsigned int flags) {
>>+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>>+	struct drm_xe_sync sync = { };
>>+	struct drm_xe_exec exec = {
>>+		.num_batch_buffer = 1,
>>+		.num_syncs = 1,
>>+		.syncs = to_user_pointer(&sync),
>>+	};
>>+	uint64_t vm_sync = 0, addr[NUM_QUEUES] = { 0x1a00000,
>>0x1c00000 };
>Imo, constant can be defined instead of hardcode values for base addr/offset.
>
>>+	uint32_t vm, exec_queues[NUM_QUEUES], bo[NUM_QUEUES];
>>+	struct xe_spin *spin[NUM_QUEUES];
>>+	int64_t fence_timeout;
>>+	size_t bo_size;
>>+	struct drm_xe_ext_set_property multi_queue = {
>>+		.base.name =
>>DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>>+		.property =
>>DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>>+		.value = DRM_XE_MULTI_GROUP_CREATE,
>>+	};
>>+	uint64_t ext = to_user_pointer(&multi_queue);
>>+	bool preempt_mode = flags & PREEMPT_MODE;
>>+	int i;
>>+
>>+	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
>>+	if (preempt_mode) {
>>+		sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
>>+		sync.timeline_value = USER_FENCE_VALUE;
>>+	} else {
>>+		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>>+		sync.handle = syncobj_create(fd, 0);
>>+	}
>>+
>>+	vm = xe_vm_create(fd, preempt_mode ?
>>DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>>+	bo_size = xe_bb_size(fd, sizeof(struct xe_spin));
>>+
>>+	for (i = 0; i < NUM_QUEUES; i++) {
>>+		bo[i] = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>>eci[0].gt_id),
>>+
>>DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>+		spin[i] = xe_bo_map(fd, bo[i], bo_size);
>>+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>>+		if (i == 0)
>>+			multi_queue.value = exec_queues[i];
>>+	}
>>+
>>+	fence_timeout = NSEC_PER_SEC * (igt_run_in_simulation() ?
>>SIM_MULTIPLIER : 1);
>>+	if (preempt_mode)
>>+		sync.addr = to_user_pointer(&vm_sync);
>>+
>>+	for (i = 0; i < NUM_QUEUES; i++) {
>>+		xe_vm_bind_async(fd, vm, 0, bo[i], 0, addr[i], bo_size, &sync,
>>1);
>>+		if (preempt_mode) {
>>+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>>fence_timeout);
>>+			vm_sync = 0;
>>+		} else {
>>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>>INT64_MAX, 0, NULL));
>>+			syncobj_reset(fd, &sync.handle, 1);
>>+		}
>>+	}
>>+
>>+	/* Validate job submission on secondary queue before primary queue
>>*/
>>+	for (i = 1; i >= 0; i--) {
>>+		xe_spin_init_opts(spin[i], .addr = addr[i]);
>>+		if (preempt_mode)
>>+			sync.addr = addr[i] + (char *)&spin[i]->exec_sync -
>>(char *)spin[i];
>>+
>>+		exec.exec_queue_id = exec_queues[i];
>>+		exec.address = addr[i];
>>+		xe_exec(fd, &exec);
>>+		xe_spin_wait_started(spin[i]);
>>+		xe_spin_end(spin[i]);
>>+		if (preempt_mode) {
>>+			xe_wait_ufence(fd, &spin[i]->exec_sync,
>>USER_FENCE_VALUE, exec_queues[i], fence_timeout);
>>+		} else {
>>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>>INT64_MAX, 0, NULL));
>>+			syncobj_reset(fd, &sync.handle, 1);
>>+		}
>>+	}
>>+
>>+	/* Destroy primary queue */
>>+	xe_exec_queue_destroy(fd, exec_queues[0]);
>>+
>>+	/* Validate submission on secondary queues fail after destroying the
>>primary */
>>+	xe_spin_init_opts(spin[1], .addr = addr[1]);
>>+	if (preempt_mode)
>>+		sync.addr = addr[1] + (char *)&spin[1]->exec_sync - (char
>>*)spin[1];
>>+
>>+	exec.exec_queue_id = exec_queues[1];
>>+	exec.address = addr[1];
>>+	igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
>>+
>>+	if (preempt_mode)
>>+		sync.addr = to_user_pointer(&vm_sync);
>>+
>>+	for (i = 0; i < NUM_QUEUES; i++) {
>>+		xe_vm_unbind_async(fd, vm, 0, 0, addr[i], bo_size, &sync, 1);
>>+		if (preempt_mode) {
>>+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>>fence_timeout);
>>+			vm_sync = 0;
>>+		} else {
>>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>>INT64_MAX, 0, NULL));
>>+			syncobj_reset(fd, &sync.handle, 1);
>>+		}
>>+	}
>My suggestion would be to add a helper function for sync something like
>wait_for_sync_completion() which handles synchronizations in both modes basic and preempt-mode.

There are only a couple instances synobj/ufence synchronization and
not all of them are same. I think it is less complicated and more readable
this way then to force an abstraction. Besides, it is just a few lines.

Niranjana

>>+
>>+	/* Destroy secondary queue */
>>+	xe_exec_queue_destroy(fd, exec_queues[1]);
>>+
>>+	for (i = 0; i < NUM_QUEUES; i++) {
>>+		munmap(spin[i], bo_size);
>>+		gem_close(fd, bo[i]);
>>+	}
>>+
>>+	if (!preempt_mode)
>>+		syncobj_destroy(fd, sync.handle);
>>+
>>+	xe_vm_destroy(fd, vm);
>>+}
>>+
>>+/**
>>+ * SUBTEST: exec-sanity
>>+ * Description: Run exec submission sanity tests
>>+ * Test category: functionality test
>>+ */
>>+static void
>>+test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci) {
>>+	__test_exec_sanity(fd, eci, 0);
>>+	__test_exec_sanity(fd, eci, PREEMPT_MODE); }
>Why not add two subtest for exec-sanity and exec-sanity-preempt ?
>
>--
>Sai Gowtham Ch
>>+
>> static void
>> __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>> 		unsigned int flags)
>>@@ -911,6 +1045,10 @@ igt_main
>> 			xe_for_each_multi_queue_engine_class(class)
>> 				test_sanity(fd, gt, class);
>>
>>+	igt_subtest_f("exec-sanity")
>>+		xe_for_each_multi_queue_engine(fd, hwe)
>>+			test_exec_sanity(fd, hwe);
>>+
>> 	igt_subtest_f("virtual")
>> 		xe_for_each_gt(fd, gt)
>> 			xe_for_each_multi_queue_engine_class(class)
>>--
>>2.43.0
>
