Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE1EC282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 08:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A403410E2F9;
	Fri, 14 Mar 2025 08:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jw4v/9Gn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E31510E2F9
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 08:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741941154; x=1773477154;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JTolpYYvlORE9Smqn9NTtkjEUPa0cTeGXkBEAzuo4lM=;
 b=Jw4v/9GnLwZBL183zAecpLR7XcOxS1jFe7rCq8ZsO4Iasn833SHsK+d0
 0eWeXn/OUKwocjvZjQVgPNqQP25fapTYkNQCjNG1oWoD8aMmOSD4l+q7c
 rjxQ2ZOvGPxLyi7b7+X2rRuScbZoor9tEo/CKxTXhlL5UBwUltPaMmVaQ
 UY2Cy6VerSkEhA6VoliVXBHEeT0e0k7FOGlK1MHBf0mjETYj/X+UxAo5K
 qtf2acI3HTIePyeRrajsEjqf7BzTH2fpf+JkUG0y7gIl1msCyE0ckimOU
 t6g164FNa73LaRFAxAzx1DoTvkLyUFbR9gy0NlqelVDvoss0Kf1bcshiC A==;
X-CSE-ConnectionGUID: WasQmDonTeK+eCzzeyoo0w==
X-CSE-MsgGUID: c4b2bTLsQxG92RCbwuhz4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53725201"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="53725201"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 01:32:33 -0700
X-CSE-ConnectionGUID: TlRheIUsQTWxnTg/Gr5k1Q==
X-CSE-MsgGUID: thz0JlzjShq4usUkmnVSyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121907430"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 01:32:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Mar 2025 01:32:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 01:32:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 01:32:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBQMa4X1chaGNcY1sT4+VigbM9hXooqH7MZvSJkKbXvVdBoefKDKyWs9nJ53xhrDm95X8dhm47wvFnMxf/39Je6uAc1nV8WtVsBBez+R7ZEHvhoG9M2ss4ymdovCREnT7jMnbfPPyWC3RZt602m8vFX9GbbOnSGT9ZEF4+LNGHgBWQk7g+cw/eMD+yVm5FFkcx1bdIHnbnFxoEEsHLORKYOphkWOJ9B2fzLRoXJnbXZbMGIR5liskz2z6JSUNCgqTudhNi8tDdQ2fWspOVu8vbKygkoSS+aRdlhf2ulbYeus7oiX/HOlwGVkrRF0bLkGggTEjUUniam+P/dBVSMvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOfyu9T6rYVwiCBxuj/erGqQGt1dpzPIpiezGQNnXsc=;
 b=kZxJoEVFdGzP7GzBpTePxCZCkpG27yKFS12zZOmYbeZbMedJFxBOYVwf0tHxG68BBdlZw4f6CsdlL/BomlY2ZsiSDUOdJanqAHu+2N6rrMD5qIIkPo5EejyhYtqgIBg/pMYq3G99nZny5FnwO3LmLW12rGXtdGv4xW6oZnvsWl6uZL0TMxQ4bTdGgC/4XfFt1ckZJg9QukdfK4sBdnuig2TrhBoTu6bAXzNSXw7bjOkAmJt7/qBc9a8e3pKJ337dvPcQfJooVRL1/yCkGgco4usjLmx0mNVrjaM8+0ozH+nvdcjyeyF9CEuraTQ7gC0fENs6mMYIHDoswiUlPL9JlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA0PR11MB7695.namprd11.prod.outlook.com (2603:10b6:208:400::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 08:32:24 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 08:32:24 +0000
Date: Fri, 14 Mar 2025 09:32:16 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t v3 1/6] lib/igt_sysfs: Add support for device
 unbinding
Message-ID: <Z9PpgiF5hdk76tQR@fdugast-desk>
References: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
 <20250306101041.26827-2-satyanarayana.k.v.p@intel.com>
 <fvh6tqhtox7iw7lov2cok6575fprql7d4aa5crpt3yxktycfcf@ibfjqf466jmp>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fvh6tqhtox7iw7lov2cok6575fprql7d4aa5crpt3yxktycfcf@ibfjqf466jmp>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0021.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::14) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA0PR11MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bdadb1c-c279-4cf3-5c12-08dd62d2bebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1N1UjBZTy9XV3U5REl6YUVwa3NJOW5lYXg0M1lnWXE3NlN5QjNvTUtqWDlJ?=
 =?utf-8?B?RVQ5U1ZyNXZ3Q25Ec2IxdUFHV3lyU1p1UEo2aEZ2M0N1UFR0QTdJMXpOa2hD?=
 =?utf-8?B?RThYOVRNKzV0SmhaWVBPZXRDN2pyVDF3anhiUWUyQmxzUzFSOHpWQi9BaFFZ?=
 =?utf-8?B?dTlnSkhCd2x0cnJYMS94YVMrbmpBdkE0Y2dJZTJFWGhsblBwYkV0RXV5RW5r?=
 =?utf-8?B?dk80bHljcFp4Q3V4WDh6aTVGMTJhQXBqU1YveUhQM1ZuM28xdStabVBuTFV4?=
 =?utf-8?B?NFJsdmVqZ29qVmZRLzVEMVRkZkJhVW0yK1BJUW1EaEp2QlV5bC9IWXdqYXA0?=
 =?utf-8?B?TEVGRlJJU0dtYndZbyt5VlBFc1lrN0c0YVBEcnJjUjMySjhRaVFVUnc2dGgr?=
 =?utf-8?B?QWkyRjNQOG4wUXRUS1JaSHQwbTd1ZUhXaldBWHJYWlBkdFJpbkNTMFZ1S3ZT?=
 =?utf-8?B?WXVtODBwYmpoUjhrbWxQMXlVUkkyem5WVGo5cE81dTlseVlpWmlNaWZCVlM4?=
 =?utf-8?B?d1VINzlhUTZzdmlqNFZYU2tDTVcwN29YUWFIeVIrbnJ3MnpQRUE5cVUxZ0x1?=
 =?utf-8?B?UEpMRHRhRUEzZlhEMUgvMXk4eStMNmV2ZUJ4RTI5VE9lRFdxbVV6VGRLdFMw?=
 =?utf-8?B?SUtSN0FGcVMyNFNxRW9VU25ERXY4UVA0azVIRkxQQ2g0MWNJMTIwUXJLdUx1?=
 =?utf-8?B?RGo3M09JdXJRQ093am1oOUFBaFN6QkxvbzdkcWJBTjYxWlBraUtpRHAwK0J0?=
 =?utf-8?B?S2c0YmJ1QjArNml0SndpVTc5SEJ5M3lFeUlobzkyTTYrY2RoMFZOVFMrQnRx?=
 =?utf-8?B?RXI1VTZjRkYzU0k5bUVia0UyZGQ2T2hlZlRuZWlBNldVYzlOWkNVZ203U3BW?=
 =?utf-8?B?REtnZUVhSkZvalo1T2w5T3BHYlBDdDFqWnh3Z0FVQXMzcFZhbDMzbGdoWk5k?=
 =?utf-8?B?aXFoUzB6UGtOZVhLR2U2djB0RHVDK0x6RmtrRks5Qjhkc3d1NHprcGVMN1VO?=
 =?utf-8?B?bnRuRnptMjJuVkN4SGc3Yk92YkRMbTAzc3pZQ1FBNndIMEgrL2szRUVodU9l?=
 =?utf-8?B?WFVTWlN2bytuZk9wMlNsNHNIN0RNR3lLcDkyRlM5N2o5eUxLbi9KZGhLenRZ?=
 =?utf-8?B?VTlNRHBBQmVGZThYRy92QnFrRFhxeVhiQkRHQnlwSnMvVjBveWVGemVzVDZl?=
 =?utf-8?B?RSszWFRwdDNZQlBVZFFTUG5hQWFuMnhWaSt0M0ZCWEc0YlY1K1h0WTYxdU5u?=
 =?utf-8?B?SXZkcTRHbXh6d1VpdWJNNlNuOFcyYUV5NitidXpjSFFmTW1xanFMNjU2MkFX?=
 =?utf-8?B?alR2UDZqTXFYelRNTXdLcDJaNzFlZGdwOTF1WVFKMUtvbkFJT1ZWdVMzUUNW?=
 =?utf-8?B?RTlNSzdER0IzSVNsaWJVMm5waXdKaXhLa1JOR2RDK2laTlRYT2xyTWZNaEZo?=
 =?utf-8?B?cWplZmlDbDJXYlJ5cWNPb0dIUGpGM3VFaDJkak43QUxlcTRib2VSb2UzZ1dq?=
 =?utf-8?B?OFdmWnZUeXZkTG9ncVRiWXdMRWFZaXl3WVQ1TktDVk13bEV3cWNQenhocFdF?=
 =?utf-8?B?ZGZFZGNPNnFkYkRUSUdSazc3d1pSYXNQZFJQQy9Icy91OXlSSnBJM1Q3Qk95?=
 =?utf-8?B?RzlLcENyZ0NabDFsRW9GbDh3SlY4bHpjSFB2Q1dZN1d0WGF5eXp5RGI1ZVNJ?=
 =?utf-8?B?MTV6ekNvWWJ2ZU0yWmtENTIzc1BuSW9Fa2s5NHJDZkF6dGl6T0R0TkFkRSsz?=
 =?utf-8?B?SXcyNkVxTWtaYmlxdnh3bDQxSHgrQnNLb0laSFBVN09YamlQODEySkxhQ1lL?=
 =?utf-8?B?R3RVeGQrS1ZwMUlTQmhzUE1oc1IvekN2ckNMMFh0VFBpbWJsVWVDSk1ERjc2?=
 =?utf-8?Q?/1LeON6GtS4YJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDFmQmVKd1hqVFJDcEl3M3ArWGZQMVRmdW9qejJQS2o3TG8yMXVxd1RVQkF1?=
 =?utf-8?B?V2lmeXpJV1BFZTBOUW1NQ2t1TWQrd0FQWTZMZVU1aDVGTUp6YXRCbjVFc3Yz?=
 =?utf-8?B?dkNhUHhWb0p6ZElhMkY2NUZnVHBkVnZiQUdyMjd4QWhXeTZMS3FCU09laDF4?=
 =?utf-8?B?ckZNYlN5cTQ5N3QwTE8yY1JpWWtpRnkyS2hDT3k0L1hyODV1R1lVZVowdDlH?=
 =?utf-8?B?OG9TTVlKd0hvZWZGallUOFBTZlRKZUg1WVRxc2xKTGpib0lacmI2Q0VLZHM4?=
 =?utf-8?B?TTM0cmp6dGNoamRTamZ2UjdZZ25UQUlCa3pJNG5DU1RZZXlDMGpvZDVSeUZE?=
 =?utf-8?B?aHYwYkdUWEI5T0QwbnJhRVNhbUkydjlJc20rSEF0cWhRNnV1bEI1dE5lTVpv?=
 =?utf-8?B?OGJrZnBoRU44MEJKbFRzeXBNcFp1eXE5blpwY0ViblRuSFdYL3FCSmNFL2o1?=
 =?utf-8?B?M01XY1NUVGlDbmZGb1cvQ1hZRmpGUUJUVmh0Q1ptQUdMMjQzNCs3Q1lzTThV?=
 =?utf-8?B?ZXR6cmI5Rm1qMWh5MXB3cHVLZnZvN2lwVFAwcVBpbzFGV1Y4ZVNYWGpaalAw?=
 =?utf-8?B?TW00alNYRzl1WTRtNzhwZkQ0d2lwZEJJRGE2NkdVeUg4WlBEbzJGdDZkYVBw?=
 =?utf-8?B?QnFlRXVKbnNaRFdOQ1RYMFhwNncxU1ptK08yd2xpU1FxaUZXdVgwL0Z4ZzJx?=
 =?utf-8?B?Zm95cVZXdUNDeG9vaGFRWWtZeFQ4RnV2ejlwdVlUYWZmSkU2VUR5QWRwUk9V?=
 =?utf-8?B?RDBLV2l1UGV1WmtYQjcwaG5ReHhsTXZEaFlrbEt0a25EQUNNODgxeUhoeExw?=
 =?utf-8?B?eDJjczVHWHYrV1JiWStpRjFBcUtOUUY5QmJtVXNWd1MrQXRNUXBpNzVERjdp?=
 =?utf-8?B?MzJ4RVdvVjhHY0NmZjBlMmFTMzYyL0tDNTZhcnR1NGZScFdjREZnSXpycStq?=
 =?utf-8?B?b3JIbk9KMDJSTGgzNFFEM1pBNVpNZ2x6Q0VucGpUOGNJSStTSzlKTFYzNnhN?=
 =?utf-8?B?SUdXSXVZK1RCQWJha2VBQlM5WXdvYkI1OWpzUHVXMFlpZ0lQc29RRmRnWFZz?=
 =?utf-8?B?WHlUS25CUDFMUFNOQ0NvUkFWd0NXN0Q4TnZWc1VZZ1M3T29PSFFJakJMckdy?=
 =?utf-8?B?Ri9mUWRsenRCMHk1bEY2b1ZyNWV6ZnZFSUd0K0ZNZUVTb2liaDBhdlJCKzFG?=
 =?utf-8?B?UlpleDRZRk5IRENaSno5Y0t3UkpMQU9naHR3NDNzbFVVZlk1TjBPSHpqTkJ5?=
 =?utf-8?B?SFpmcHIzZU9wRjRSVUZuRDE2K1NsUkwxOURiclRVRlRFOXFBc01MWUYvNG01?=
 =?utf-8?B?M1BNTVdXdGI4RGFKOXRoSVdvQzR2d3VldEJQYUhISE92Q2FFcHpWbThSVjl4?=
 =?utf-8?B?MGdTdFBtaXFVbDdxTll2S1lxWGZSd293K3R6TmZ0bUJVcFRtYnFHbWJzVWdO?=
 =?utf-8?B?WUxNNjRNWW5FS2wyd0RPMGhLT1Mzb1pGam9jMC9WZ0d2Q3NrY3dqallsSFBI?=
 =?utf-8?B?aFFJN0V1Yng1NGVUQ0praFlBbTBWN1JZbllwdmRRVHJUajNxd0daNG1WbDJR?=
 =?utf-8?B?b1JEaUY0WW51cExDdGgydVlYUVYxQ0hpSzdkb1VVVlpSTVJ2bVZMTlBlenVk?=
 =?utf-8?B?SDl6Zk84MUJ6eDlwSTZlQzdkRHo1dlA0VTREckoyaW9mMUgxZ2NkK0srZ3Aw?=
 =?utf-8?B?UFg3YnE3OEJTNHJRSk1QeXZhTlovNXpJSDU0dGJMTExQc05aZ201UCtJNG5G?=
 =?utf-8?B?UnMvekNjd2ltN0JMSENhZ01ralF0VFEwbFA4cUwxalVidE00VTYzdlBRL2dK?=
 =?utf-8?B?Ri9LNUg5YS9LVGNaUTBsMTBJWVc5NHYzaTdyQ0Y2aWt3dFpzd09qZS9tOHpQ?=
 =?utf-8?B?YiszbHJzVnE5WlVXQzZDK0tPSXhlZDB0Q0NiQ2p2cUtxRCthU0VXVTI3bjl2?=
 =?utf-8?B?dlNNa2tYb2V2MDhuMnF1R3JLd0dHMWdoNWp6ZlZ5WWFBVjdXL0laOXVJSXFS?=
 =?utf-8?B?T292cHF5VnJrWGZxNnI3R09mdlhOVFhSVUN5NFczZk9ZK1lRL3ZuZkdMQnpr?=
 =?utf-8?B?ZElaSFUzWVlDYllvMHFZTUFwZnFkOElXVTZQSTRsRnowMEY0UUt5K2Z3TUdO?=
 =?utf-8?B?bFFVQkhsYzRxb09Kd215djRpajFTTjQ3Skk1NEZaQjdFL3VVVnh0WktzYWR5?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bdadb1c-c279-4cf3-5c12-08dd62d2bebd
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 08:32:24.0410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtynBFPZ2WbWx0naOhQZ2eblToqecwSJzdewkbwTANEWU/Vz9jX9nH+BWRC9cuqTErmawlf6WhSyOax0vmDhOaOqLNrSs2O4OJKGYyVYPk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7695
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

Hi,

On Wed, Mar 12, 2025 at 10:25:15PM -0500, Lucas De Marchi wrote:
> On Thu, Mar 06, 2025 at 03:40:36PM +0530, Satyanarayana K V P wrote:
> > It does not harm anything when we try to unbind a device which
> > is already unbinded. We do not want to throw assertion when
> > the device is already unbinded.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> > lib/igt_sysfs.c | 4 ++++
> > lib/igt_sysfs.h | 1 +
> > 2 files changed, 5 insertions(+)
> > 
> > diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> > index 2e4c2ee63..3fffaf96b 100644
> > --- a/lib/igt_sysfs.c
> > +++ b/lib/igt_sysfs.c
> > @@ -1509,6 +1509,10 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
> > 		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
> > 		close(sysfs);
> > 		break;
> > +	case XE_SYSFS_DRIVER_TRY_UNBIND:
> 
> oh no, this function uses the wrong design,

Yes, my bad.

> let's not make it worse.
> xe_sysfs_driver_do() should really be dropped and we should use the
> proper functions.

Those would be igt_kmod_unbind() and a new function igt_kmod_bind()
which would be allowed to fail, that is with no systematic assert
on igt_sysfs_set() as it should fail in the case of fault injection.

> 
> It's also in the wrong lib layer. igt_sysfs is for supporting sysfs
> things like opening, writing, mapping from a device to the right
> directory, setting an value, etc. We shouldn't do to do arbitrary thing
> **using** sysfs.

Another reason to completely get rid of xe_sysfs_driver_do().

> 
> Finally, when we want to unbind we shouldn't really pass an fd. The
> caller has no idea if the library function will close it or not. That
> triggers several different paths in the kernel as userspace holds or not
> an fd open.
> 
> Please do not more to this function. We already have igt_kmod_unbind(),
> we could have igt_kmod_unbind_device(). As we could have dedicated
> functions in the right layer for all the other actions here.
> 
> Lucas De Marchi
