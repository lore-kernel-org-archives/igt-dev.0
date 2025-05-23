Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE77C54ED0
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 06:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE22610E718;
	Fri, 23 May 2025 06:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXjticNS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A4A10E718
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 06:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747983141; x=1779519141;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H5falACqQR4Lu1JTnBq56Zse0IqYeJLm5vogsFPFq44=;
 b=lXjticNSHZzBiZw9yBgmFgAerm1TqSyM/cqNPN8YJXJirWy4wpshKQNR
 35f30x3QQHiC/Aau9ICR19j3ib2aMyuSXVjO3KTL7YxdaOxj+IfF05sHN
 5wZpaonfkzWbOYIq6dxSic9W6Q1+xm7cHXaOw10gHyMucpRVk8ZBtInXc
 592c4ZHtgxB+yytAi6fa8p0wz+W6SThU9K2RQd0SlR2Z1yQ/bXPvshzhK
 4p/yjLvy9VaiWKA6NrXREnXD0esxWTWvtqQ2zrjkXJWyG7QsWAp+bas3X
 lmMr5TjBqYPFFens1xMxbMYHBCF3y3gbFu0a97+rFzceo07Goyl1E5rXO Q==;
X-CSE-ConnectionGUID: M6kDI9ODQqGjmSzZyoZ80w==
X-CSE-MsgGUID: MLNCl/P4RMqh2PfMjJnMfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67593717"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="67593717"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 23:52:20 -0700
X-CSE-ConnectionGUID: Z4X9Bdj2R4mESVqRKs7bSA==
X-CSE-MsgGUID: ogVXq7ueTTOs3qIN7IPQEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="171988190"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 23:52:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 23:52:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 23:52:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 23:52:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rt8deOL8VPwOJO2kaO0F9MnGfjpv7tFh/+oLNR0QNhqUgh9cVvCCO8n3mHbEkpMzWi+ePfBcGcJDrR2r03KV570+sBplQmRgYJaeqtEI+xgsrkP/GeZdBL3WiQUCjEHn1sNgojyNkwqaOPB0VWo+YhZvIoKOMfYZ6bv6HdebWoYzH69T20Vjjp/vaBLWkRYVv80yksZddKkMtd+NGvtRsQnh/2GdHyIEou5FGSRTQoFlCK03+jTCDfTIcKHeh/0PL+wYdqshTks9Zl3etIpYX/Py9DgVz9yZVTPXv/dw4mgf/vEdZ62NO5RTeOMP1dOanFcqbH4RgwQHuQob9iTwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2+pMC29gSaRmwUG1pTtjSPxFSdk/4KBMC5vWNkETG8=;
 b=TrYNf5TppuL40sL2sv4CcheXqmtntR/5Xxmefz6tIxPuwr9Csnguj7kUbeimodlZP5WUhHj4hakIeudSBaIhdfqNQosE1A8vIYBp1lM5Ipob4fheP9I8qpzI3wo92YNfDUX03cf7G+VY+vGokjr+v8cevNJoNoi7wi+6OkCNHU86BTIRGU4NQf4OIz6XG1S8obNtMLUdmN+6y6dlDr2Mu1+Pz6kTfMoQIzAZT/lLQxW3AZTjoOs64QUne+TFRBCV/RNo26CSD3wwvJpolZq6dOvZUz69haBeFJe4fMaKk6m0qodANy01bqBBT5r3U9kESV8M12C6JBV+yYjSRmAOMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 23 May
 2025 06:51:42 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 06:51:42 +0000
Date: Thu, 22 May 2025 23:51:33 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test on SR-IOV VF
Message-ID: <aDAa9VK3fkoKnYve@intel.com>
References: <20250522172441.3914198-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250522172441.3914198-1-jakub1.kolakowski@intel.com>
X-ClientProxiedBy: MW4PR04CA0342.namprd04.prod.outlook.com
 (2603:10b6:303:8a::17) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f20eb9-73bb-4bcb-a800-08dd99c646b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWNVa2I2dnA1OGptWjZacDd4Q1A1LzZRb2tUMXFjMjJuV0sxREZyQkFpV21Z?=
 =?utf-8?B?SklJQ29aYXN0VmFoZkc2WjR2RFpBQXBIQ3NGQzlYMFFyQjhEV3pLenF3OVNE?=
 =?utf-8?B?VjE2aXU3VmN1M0RwSG0zNnVISTYraHBCckJickdTMWFIdUt5T3lESkE0eUlN?=
 =?utf-8?B?enlUcHBhMHAwM1RQWEQ1clloWmVFS2gzM0pWZ0kwUlNaZ2l5RkNyaWQvek5R?=
 =?utf-8?B?L29OTTNnOVB6MWhPaG1OdERURk1oWGVmc21uK0FhdDdjS1pwcUdSSWdJdlhh?=
 =?utf-8?B?akFHS0RTd1lYazIvazNRSXprdVY4NGZZVUdqWkRXYkcvR0l3K0I1UjV0RkZ1?=
 =?utf-8?B?eWJ5TWZjaHA5bTJtbjUxczRpN1JvVVUwSG56UHAxdjV0Q3h6dkNVZGYwQWNQ?=
 =?utf-8?B?UlRZUWVCTFRwN2N4S0cyMDdIOXNXNGNNRklxd3VjUVpIZi9uc0Erd0pKTXEx?=
 =?utf-8?B?clFZSWZRQUF2MHNFaWNaajZ5TTF0SXFlR29UQW5RVi9OSERobjZlQ0NQeVh3?=
 =?utf-8?B?TnFYMjQ1Uy90VSt2cERRMEZtTnZDTVNpdFZKa2hwbjRoWHRFdkFxbTluM1dw?=
 =?utf-8?B?TTFyc1d2TXgvRkxDZElnN1RDOXp6eGZjL2UrNEdOSXFMdEFyQkZlNkpTWkFU?=
 =?utf-8?B?R01vRjVJUmUxUWFTVldCYjZlZWhsd3ErN2lQWDd1Rlpxd1Q0bk8xbEtMQWJO?=
 =?utf-8?B?NWM1Q2tXTzZDMkpnTVdmNkJBbEZUSWhSU0l0RHJJcGJwYkZmVDNpcm5ESmtw?=
 =?utf-8?B?Y2JvbTY2UjdMWWNVeXZTWFMwOUtQaVI3OXpld0V0YlVHblhEaTBoMjBSejlB?=
 =?utf-8?B?QlllVnhXV05YQjFMRFN1L1VzK3lwV2RVUDhzOXF0SGZPNUJ6NDQwcFZpZ1Qy?=
 =?utf-8?B?cFRtcnpIOERIaGVsenU4bVVJVWc4R2pFdzY3bGtKK1ZkUVlNaXpMUWJZejRn?=
 =?utf-8?B?TnpWci9abGxCMG5PallVQjZObCtDMDdrMTUxellWY0g1VUljRXd1dGJaUmw4?=
 =?utf-8?B?MXNjS2FHWjhOQ3pxVXFmQm5Fc3JuamNoZ1hqcjBkM0Y3bm55dS9jSmcyalB2?=
 =?utf-8?B?Ty9JUVpHZnJXdmx4c2RFeDRMUVExbE96cU5HUm4xalByQTZiaHcvY2l0SXk3?=
 =?utf-8?B?QVVIVjRxSWQ0ZXlORWVQVnZSaFc3TTJ5RHhLYllmWjA2Szd5T296cm5rY1dP?=
 =?utf-8?B?NitoT2lQZWZsZEtRMnpMclVLWVd4ODRRbTRwMDh6YW9teXRhS09MVU1nVmdn?=
 =?utf-8?B?TndsTTZrMkVva3Y3dmNlZVB1MTRFcDQwbXpnU2N1cjJOQmVKNGhNZGJRdkUw?=
 =?utf-8?B?WFlWRVFLNk14RWJtNU5BbmJHbXhaWklEektWaXVkOHlNaTF1Z244enBOZVZK?=
 =?utf-8?B?R21ZWWEzTjg5RVJ3TndYRnV2TUhuOUsvTk9wTFYvbXVaV1F1UURhODBvRXZi?=
 =?utf-8?B?TkhWWkYyajJ2dkczbmZHanFwWW9VRU9hV2gvNnNEVE1kQWlQTDEzTTVFM0VT?=
 =?utf-8?B?RjlYVGhXOENmckJLQzBwR09NOUt4TlFkNVZSbmdoOFQyd2VoQTE5VGg1Q1pr?=
 =?utf-8?B?dC9qUkdXRWtpMUwvVlBHZnFzTlZuN2lqMm5lbUZxU1U2UFlRM1QvbmZva0ZL?=
 =?utf-8?B?MXRvNExlSGxvY2czYjhHUExURlFudHhCQktrZUdSU294TktGdTkyOEwwbUN4?=
 =?utf-8?B?MUlvUnllWVpYb3ZpaU4veithbEpCMG9SbytzMi9KYTB5R0NmRG1JK0RmS2pI?=
 =?utf-8?B?WkpXbEpvZmladzM3c0JKSzZzaXJNK3JuLzU4VXFsT1Y4MEpzcVU0WGJjY3c1?=
 =?utf-8?B?TlZCZGhHTTZyalQ0dDlzTjZiTjAxMHl4cGJMLzZPNnVrV2pGYlRkQlMwNlYx?=
 =?utf-8?B?ZDNoM0hacXZ6T3hGNEJ4R1orM3NZK3VBcmJKMERhaG0vS3pTU01wYWx6ZEVV?=
 =?utf-8?Q?L+pm3kkYd/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajFnT0FjVXFpdFZrWlQ2NDVXbisxVVhKNTlBMVRiUVJ4Skp4RDBuT3YxdXU1?=
 =?utf-8?B?QzF0dmhKUk1ac0xJZFYwbHlyNHZWZjFkWFo1cnN1eVBTNlFBb0MxT00veU41?=
 =?utf-8?B?SmJ5T3ZrRVFsZ1d3dzVSV095ZFZGNGpUeUk4UmI0V3U1N1pyOEJzZlM1VDVF?=
 =?utf-8?B?eG9kL0dRZ3ZsQXZuRjJsZ1lXdE9pYmltdWdyQU85T29vMnBpL21CQnZIc0ZM?=
 =?utf-8?B?OFgwL1loN05oTDFTZzRYeE5jcXNjRFNrUWtrdTRxbUVRc05JYk5EcW9aZ2N5?=
 =?utf-8?B?eVpWQllNR0tOK3NvMHdWU3JYY0dvTnZZN0RCbUNXWklwalEyV2ZUdzRUbHVx?=
 =?utf-8?B?M29lcVIxczVTaU5GVEM3Y1BYenFsR1VjK3R6djlNVEFIRDdMOXdramVrMm1L?=
 =?utf-8?B?eSs3Q2M5b1FZR3dvbi9NaTJnRXg0NkUvZXJNUnhYdjdvelc2QjdVTUMrWFN3?=
 =?utf-8?B?ZHI1b09sWGJ3bEFKekJPSTY2b1ZFRWh1Q0dXd1NiZXJXcXBXYkhKYkJpQWhs?=
 =?utf-8?B?eFM2aG9JTWcra2E3aTB6cXFXd1FMNGorYjB2SkVoZythNWRCTEo3djhXNkZY?=
 =?utf-8?B?emRiQlF3QXBKK3FseWpnNXJhWGRTMksrUnBUbWgyVEd2ZTRCb3hsaStVTTJO?=
 =?utf-8?B?TWVab2RWUnQ0VWs1ZFBLNUZZMHNIMHhNaEh0N2oyeVFoZ3JTSVdBWWlObk4r?=
 =?utf-8?B?WjVQMzVhcTBMaXg1NzVjN3JBMVBYNjVHdUw1OG80cjdvVW9BZ3ZoZHN5Q3Vt?=
 =?utf-8?B?aVIxd3l3WmF6OFdrTGRXbnBkRXJQTTlBUnlkNXVCMXQxVFl4RzdhZjVXWTh5?=
 =?utf-8?B?eThWOEZTSlhyOUlSWVA3blgvVG5qdHNJcGNMVktJMlVkb1QvMXlVTjQ3cEc1?=
 =?utf-8?B?eGN1QlZRdW9oQVpIWVp4dEt3a1UrTnl1aTBKdiswOUtKTmtxblBTWHJTODFO?=
 =?utf-8?B?OWVVT2twUUxRczh3bzJiWkhac3dXcFo0QnRVZTY2WW1rTjRpNWhnS2pLU1RH?=
 =?utf-8?B?T09aa2tmWU5YZk1WYjlBZHhYV1MvaWgxYkZkZTFGK2p0VS9TcEdIblZGWnFh?=
 =?utf-8?B?RXVyTXFsdGw5dm1JdW53WkNHZjJHMHFwaFEzU3p0Ukx3NWZBdkJEZkxwNnZr?=
 =?utf-8?B?TjFhM3U3bVZFakJXNytRczB3MjR1b29kTFNNcUdEMHF4ZktKdHUvZkxDbSs5?=
 =?utf-8?B?YTg5TTl0UnZSMkRUK3IzdFZDMUNiMU5tcVFrdjhralVjcVpKcGg5VlU0WUhL?=
 =?utf-8?B?eGpGUVVQWkx3aWl2ZjA3Z1NLREh4K1ZvbVJROW9zOFU5TnNUZS9leDJZdG01?=
 =?utf-8?B?ZU5OYmhFQ3pxZnNkRnEvQVhobWhwS3FGVjVPUmV1dnFFM2p6RkNLNDdPbkxE?=
 =?utf-8?B?NEoxaitRTGR0Z0Zvd0p4ZEtwc3JmVjg1QWhmWllDSU84NFdYU2dxRGIrYXBi?=
 =?utf-8?B?RlB3YVJSc1FwTDR0SDlPWWRXOS9VVHlCVDdXaEJtQWYzL1JaMW5BVWVTOWE4?=
 =?utf-8?B?c3hhZVFDNkNGZ2xpL1BpYkUyeHdlQmFtOWJiR2FRUHJmUGVTT1E0cjROS0ww?=
 =?utf-8?B?QjZnaWtZUUl5ajlGWFBzT3FBcVg2WjhEVEN5aUpuRTNoc05Hek5RNDZkbjNH?=
 =?utf-8?B?MjZ1MUtpNlpYajM5T1lPU0pCY2FpNFRDK0FpdE9jemt4VHp6cUhFTG8zZnBS?=
 =?utf-8?B?dWxiVzN1MElaZlNueERjWDhucmp2WlN2NnpXc0U2V3NkV2dpZkxjWFU5SFNT?=
 =?utf-8?B?aTkrYlZvKzdhaEZoMkNNdm8wTjd1OWpxVmEzTU9DdVVhYWpiTnFtVWdmWmZx?=
 =?utf-8?B?SnI4MGQ1Z1A3eGJJWXhuaWM1RzBhOHZmL0dUbnZONzkrUkxPUVdQV29VQkk0?=
 =?utf-8?B?ZkpEMksyZFNZd1RZQVRWRkR2c0ZpZlBlMERrMngvdWRWMWU0Uk5mQ1dpUUo0?=
 =?utf-8?B?czN3Nnk2cDlESmpiM2xKSFMwZFFJR2hZMHBhaWtwajRNdGZnR3lLUkliSjJX?=
 =?utf-8?B?S1I5ZnVRNnh3c2w3YkFGbWVxdi9KU2lsc1pLVldmRnFqWXJRQlovRVlUZ0hB?=
 =?utf-8?B?VHFOWnRBaER5RHpPZkU0bW5TVkgzUjVXd1Q4TVZJOGlzbW84OERWd2xtTERz?=
 =?utf-8?B?WHB4emhIS1VjaTdubU9Rcml4NXpKQVUvN25sNkdZK0Frd3hWUFEwOG1LbnB5?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f20eb9-73bb-4bcb-a800-08dd99c646b4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 06:51:42.6445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Gzcxb+qlSbgvnSUM8JpLxHRhGMKIf1EYFYmPVkUHuQunZrX54VreATSp2KQ/s48VH/i4TQdNaxqWA3ac6vfeXTmQtu0KFH8D06Ylk4KM6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
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

On Thu, May 22, 2025 at 05:24:41PM +0000, Jakub Kolakowski wrote:
> EU stall sampling is not supported on SR-IOV VF. Skip the test on SR-IOV
> VF.
> 
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

Reviewed-by: Harish Chegondi <harish.chegondi@intel.com>

Thanks for the patch
-Harish.

> ---
>  tests/intel/xe_eu_stall.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> index 411c30871..aa94d9565 100644
> --- a/tests/intel/xe_eu_stall.c
> +++ b/tests/intel/xe_eu_stall.c
> @@ -44,6 +44,7 @@
>  
>  #include "igt.h"
>  #include "igt_core.h"
> +#include "igt_sriov_device.h"
>  #include "xe_drm.h"
>  #include "xe/xe_ioctl.h"
>  
> @@ -653,7 +654,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
>  		drm_fd = drm_open_driver(DRIVER_XE);
>  		igt_require_fd(drm_fd);
>  		devid = intel_get_drm_devid(drm_fd);
> -		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
> +		igt_require(!intel_is_vf_device(drm_fd) && (IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0)));
>  		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
>  		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
>  		if (output_file) {
> -- 
> 2.34.1
> 
