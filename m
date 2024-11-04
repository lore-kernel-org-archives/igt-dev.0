Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A1ED132A3
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 09:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F7C10E128;
	Mon,  4 Nov 2024 09:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROLQHQam";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A660F10E128
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 09:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730713503; x=1762249503;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0+hUX8Ekj2md4mz1AWzB0dyHNUSG7tvQsyLmhYn7zq8=;
 b=ROLQHQamBbm8LABmfiIQgYm6ofUgop82FIBlV+9esMFeB8x11jhFYyKh
 9Ybax+VYsU/KLxhhVyLHh3zqZ/A9AGqqg+R9P4TldElWNiaJcWTzYT0ci
 JLHkmuS3Nwy5Z9uJgIY97DT0h7XF1J/bJYQtny+ThyTf+jZPWukh0nbVj
 O3kiB+ovo3KZjL0BMla52P37qJJ7iTUQx5wQN3OvV0XiswGLKuD0QFxVe
 zEEJuU7RBGnTxt68IJQqG8BYHd46xqF7ZuyCY24tzL34+U5IbdYEg9ka6
 TEBNkw3XTC8qYBoKqBaQz2su3jXYGtrsg8ZDCBBxP+BTB4gaC4Xg6JjOy Q==;
X-CSE-ConnectionGUID: pI/ZC0j3S0Cbf9wd/EPgfw==
X-CSE-MsgGUID: 8zWP7+2CQiankKrpIzhvaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="41034074"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="41034074"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 01:45:02 -0800
X-CSE-ConnectionGUID: DwCLJxT0SPO8TsXr3H7duA==
X-CSE-MsgGUID: CbcGff3hT7mS9nByJP+Sqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="121066101"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 01:45:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 01:45:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 01:45:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 01:44:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGA8msIFRFtcdCiAZmw8KQGo4fTNBthd6Y8dmyxPFbIHuh8i55W0sHqPnIn9tnn6hcJLuoux8q3ynVT48cqdX+r/X4BoGMa71zgB4N0a1J5Tvdp+YcGOQzggSBBmFW/+GwR0vKVWGMU9/vn/RhbS3C/OTzPZxOBWaJwCMnpbqddtplyECoV6fWvK9TnCZr1zhgiQDWthlLVNL3Dq1sTvzww2kxh3LHkJQeKaqhAMBeVRbi/FwnaTYis2mnF0vNXnNALjLegm6H0lxn+IUXbp5RaIfPhJTpYJsX5uWuvbl6iWFM+yu+v3re8otNu+mUpskfpgICsCLiqrUL23GQwVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvGcV07kitrONKDRrbANAGFm5Jbhb386tvF73N9cLgo=;
 b=s8eNkJScFlfJhRKfLHJarbq+3pOH7/LEoxzkTsP12uWkROYyB/pv3cHw7LGYCu/oBBqzuQifwV6431jAVvTLRe0bx/RfCYxABLG5hCl9sw2enBXMsZIe8K6YRKVTDAYtVfhnlaKi92UbXIzTyub8RJYnzgkUV8iP0iWkQC4iPxylhYkf1xeov8m5PCdkAXtSbqWkHNFz5VOXZhJzK2QqSo0C8E56FtOcN1mZaT82TOuyd2AcTItbqMth6uNurrrA35MaFhrBpr1NGhIH1z3z6SEP5Fu77WDuuYAV6/x9vTTrIZOzg/fkfk2Egy0zNUK1j41iEqLr2TL5mz5PmSr7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by DM4PR11MB6119.namprd11.prod.outlook.com (2603:10b6:8:b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 09:44:56 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%2]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 09:44:56 +0000
Message-ID: <e7831c5f-1bc7-4919-8213-42e142afc521@intel.com>
Date: Mon, 4 Nov 2024 10:44:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] scripts/generate_iga64_codes: prevent objcopy from
 modifying the input file
To: Jeff Dagenais <jeff.dagenais@gmail.com>, <igt-dev@lists.freedesktop.org>
CC: Jeff Dagenais <jdagenais@tesla.com>
References: <20241030184054.73065-1-jdagenais@tesla.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241030184054.73065-1-jdagenais@tesla.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|DM4PR11MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e8617d-e0ef-481b-08fb-08dcfcb5570c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3R2Rk4wSkw1bjlmdmNpQ2ZPcmNzV0FmZmtkOU1rSEdHWmZkemtKejd1dS9n?=
 =?utf-8?B?WXVvTVI4ZWZrbFVsUUJheEdNLzVlaGYyYW9Sd2tlV3M5blRWMEVwbFYvWjRt?=
 =?utf-8?B?MTN3RlFWV2tmVnRBTmcvbklmK0xIYjRHZkFNeDVGUWxhckw0NFdNNy9ZZ2VJ?=
 =?utf-8?B?ZWxEMEpRWk16Z0dKL0ZXMS9sd0JidUZmcVUzRTl6V1RwM2J4SGFXQnZkT2hP?=
 =?utf-8?B?bFJYZDRMWmV3djg1SE5nN3BselNxd1FBMVB0NU5PWXhBTzNNNU0wdWJUVnYz?=
 =?utf-8?B?d1FWSllRMDV3QUxyTnRycHM2Y2tUdzhVYW4ycEpiWXdCYTNMMzZXNklwZ0NV?=
 =?utf-8?B?dTVEYTBXRVpKVW9xS1dBSlBvck84cXRuRDk2dGlycklrQjRXWlVoVkJBamp3?=
 =?utf-8?B?cndoNlFQMDl2MTc5L1VnbTc1dCtZdXpiaVduUnl1aDVnQi9sSWJIMlVEY2hB?=
 =?utf-8?B?TFN3d0VXRkJVU2ZNd1MvNWhYOThDLzhya1oxRE9vTy82VkJwbkQ1d2hOSXZt?=
 =?utf-8?B?em54S2ZGcG93dHZwZDV0TzNCOFJQd0hhNzUyRFVCTUxGKzM5dXJBdDdVa0xj?=
 =?utf-8?B?eHJtYUdqT3BFNWp3WTZlYk8rejcxZ0h4Z0dBc2thL2pkVlAxbWgrNHZmTXd6?=
 =?utf-8?B?eERnYkFyR0Rjd0NlL3ZYUmR4YmxFMXZvYndZOEk0YlFxalZMVmFzQ2pEWnFw?=
 =?utf-8?B?RDFNK1lqTHBmTnJkMlN1WHNScFNrYVFhTzl0Z1hBbDAwYWw2emgvS2xJZXRN?=
 =?utf-8?B?ZDZaWWxXcXkxYmlNdHRmeDB2TFhCTHV6RFVFRjNYcElPWjYvOTM0Z2U2U0h6?=
 =?utf-8?B?TkhuVVdJSXhPRjZ0d0d3ZHkrR3owcmdXS0tVcVVBLzVhdmRvUjNRaE9ENlRX?=
 =?utf-8?B?YUI5bWZIZ0dVWnkycUh3Uk00eXFjOGFNc0ErZURtR2laeEROa0xtU0RCYVNl?=
 =?utf-8?B?NFBwL1hQYXI1Y2VOODgyT2FHS2c5SlRXeW1YSlRsSDlXWE9UWlpmb3ducjg2?=
 =?utf-8?B?Sk1JZitUZ1FVUWZBejZvQjRpcUl1aTJGWHM1T0JWNWR4YzNsWldtVjZGRkxn?=
 =?utf-8?B?aVhkNGNyaFVLdHBJamtmUDFnd2o5VFZ3d0RRUGw5b2JMRmpBcHpXUFJaR0Fa?=
 =?utf-8?B?MkdLa2R4NXo2WWU3VWUzbXQrU2g5MUxMdDlxbFYwWStrUjlnNmNvNVhQaGJB?=
 =?utf-8?B?Q1ZyM1hFZ3k2MWp5MUttc1MyZUhCT0x5Qk8wdWk3dUxGUVRiRGRHQktTNDJG?=
 =?utf-8?B?ZjNWeVM2ZDlkeHNpb1JQZGhLaVk5VTlKalJIN1U2NHZnMXVnRXJIU2U4RXV2?=
 =?utf-8?B?dDM4MEVYNmthbmp4ZEpRaXNYaU93QWorMGZmN0g2bWNsTm1ZTTFXSGtBck5z?=
 =?utf-8?B?WERjVlN2S3p3RXlCMWZJVlNpcmtzaklVaElaMXQ3aTZZUVlQeThxdTFBNkZU?=
 =?utf-8?B?R3dqL1hScnRNbEZrM3RXVVdSVUhRUm5CTlFYeTN5R1JQZ240Sk1pcDBZNm04?=
 =?utf-8?B?d0R4aFd0OFl4bmVuOWhvRXAvaDZNQ1ZSNjZtK2dwZWYrMkZiOUJOMHNtL2Jq?=
 =?utf-8?B?MTQ1UFV6VmUreDV1T0RIbnlFaTZuRGVwVHl0VjBJeXd1WEFDWmVPRHlVa2lr?=
 =?utf-8?B?Y0JJUkhOZHliS2JNNlJoSE9QNmowM1hrQlhGTXlmaFZMVjF2MDcxZTVERlJB?=
 =?utf-8?B?NXJMYW1iSGJEazVxNGdPbjh1dGljaGNnU3RHblFJK21VaGZWNWtBTEtKQVRB?=
 =?utf-8?Q?gcCOFcCTN1qyb0wrMEh3eaHzDHDKS84DgPLuXEa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlZrS0Qrb1FhbDlTSHNPZ3RtS29BVWlvL0hWYWR4aWwyeW1nOUJQUzVJT0Ju?=
 =?utf-8?B?OGhQRXRVK3k1ay9TRGtzOUo1emp4MlVmclp3Z2ZSZCtJZGxZUEVJbEJDWk1a?=
 =?utf-8?B?akhlRVFKTXFvTkRCd1VhbStnZkNhN0hqY3hiZnRGVjBVTVNMRDI3U1dOSytU?=
 =?utf-8?B?Q20wYWJudHRZRldOTXgzK2pVZ3h1cHB2Y1NoZkpEdlNOWEZISFBWa3hQNTZY?=
 =?utf-8?B?NE93MUFxSEVVQ3p3dkdNZjFtTG5uN0R5MFZsMnVXYlZRbjZkd21mUkt2UGVs?=
 =?utf-8?B?VTBObEZxSE1KZFQ2cnpvQTFid2hWNk8wdGZvUUxQNHI2bFQzZnNoa2k0eHl5?=
 =?utf-8?B?ZjBMd09sMFl2YSsxaXBUQ0lxSHJOSWZBNGxRczRmT0k4bjZtS21VSi93aG9H?=
 =?utf-8?B?MXN0VXdyeFhSLzVhTVhzaGZweTQxR3FEY0pkWWdYSnlOQkNYS2w0UG1DNjd5?=
 =?utf-8?B?eXcrb2N2VjRXLzZyakZaR0NRTTltZGZvbXhLdEtiQTB1ZFcwdlg5M3A3cTZa?=
 =?utf-8?B?ejFyd2tyamJCUlc0OW1WWlNqWVBaZjRIeUpKZHFzZUtkc2JxTVdlcFh5ZkNM?=
 =?utf-8?B?dFRqb2IwSml5RnE3WnZtTnhTcXpoWU50S2UxVWVjK3FZNUJpb1dqRUN2RDE4?=
 =?utf-8?B?YjdGMzFKSGZmT0JQNUNYMG1Gb1pweU93N1RKWFk4a1p2NnUvbmNpMUh3cmpx?=
 =?utf-8?B?QlMxajdYV2JNMjBoSjhyRWNSWkhsYkhSQnRlZXNjTGgrcDB5UTh5dDdabmVG?=
 =?utf-8?B?TW1XSFQrYjhNYXU2biszeTMrNVBHUEF0VHU0dHBlSURYdFZkVXBtOGNRN2RO?=
 =?utf-8?B?d2J0RGFpMkRNckZiUGxKamRaRDR0MkhJUG1sYThhVkhNdmVEMnZIRTNYaVFo?=
 =?utf-8?B?aGpWUktLM3U1L0VxL0pTSTZVUEtwT0NCNlBzVTV0QysrekcydlZwallHMkE0?=
 =?utf-8?B?UHEyWlNkMllnd1FFaEZGVzlPZkZhS0hBZTJmdjZlTXhtQTZFKzllMTdWbktE?=
 =?utf-8?B?TTNVbzZUNkQ2NGhtVW1BNzRKbXdzSmpTaXB1Rlp5eE9PZTQwV1dBUC8yL2Q1?=
 =?utf-8?B?VU00UmlrQmg1L1lHQWx3RFBOT0JGVkFwL29la2dyRXkyVlo3cm9aQ2VYQ0hZ?=
 =?utf-8?B?YnVWNzJualZHK1B2aklvS2lVSUxPQU56L005aVJncGs2VEs1T0tiL2JsUjk4?=
 =?utf-8?B?UTczeXFBNk14N0pVc0lkSHdzS1gyZnBlaG9vVFowRWgxVGN5VDkrWFJKOU11?=
 =?utf-8?B?NVRJSTN4UVBGdktHem1OcFpLSUVqKzhSWm13RmhObUs1YlQxUmNlT3AzWGlj?=
 =?utf-8?B?T2FRaGMvNTdkZzkyb3p6V1Z6YVc0Y1o0RzZiam91UGxrTUdDRDFQREdjaTFy?=
 =?utf-8?B?dFpIaHd0WDlCSnhnQUkyVjBKcjJIL2hoZUhBZlR2elVyWFVaUDd3Z1ZBMXh2?=
 =?utf-8?B?d0poMHIwWHFJNWRqYWV4YnlRN3pUMGo1ZFppS0tRQ0htUCtoOTl4VXJiZmVX?=
 =?utf-8?B?UHVqVDJYKzhBYmZISkd2aVBscmtUS3VnMUhFa0ltQ3ZGdDVTTkZ1bVR3cGI0?=
 =?utf-8?B?QUl4Tjc3TUJzbnZQSG14U0lYR3N3NkVaNERVWEZuWk8xN21XVDFoYzhSVDN4?=
 =?utf-8?B?MlR1bkxnU28yZllRaTlsSUMrSXYwbm10UW85RFEyQm9SMERmYU1kU3U3amZD?=
 =?utf-8?B?L2d3M2VUTTVsUkZlZ0tmOTY3MWZUYk1WQU9oOUIwN2JFY2hPUyt0Uk5tNEJr?=
 =?utf-8?B?c3pvbFkxQ0xleFNveklIa2lXdW9KTmFtRER0aWtCcUtGTXZXdEN3bldhWTRk?=
 =?utf-8?B?S0VpRTlOc0ZObkxTZUd5MVZaSUZQYVVWY1NWaHY4VkpCUDdnTnQzQjFoM2NV?=
 =?utf-8?B?ZC9WTGtxQXgzbk12WE1xTW1RSmtZZkFiaUI0T1ZjbXpWOVZvN3FVbXNsLy9Q?=
 =?utf-8?B?cUVBY0VvZHBqdnJxamdyMW1ObVlIeTFyMFQ0ZnZaZWlFZnA1bkJCZCtKMGx2?=
 =?utf-8?B?My9JckM5eE42VExXN1dOWlFJcGZKWDMrbkswaGU4TzJhaW9zWUIrMTFZc1R2?=
 =?utf-8?B?KzdCMXZlMXFQOWJndFBNMXh6eEg3VVY2SXlCbU90ajZYZHNtTGV3N01NTGtC?=
 =?utf-8?B?Q2F2MCtyckhWeWs5UTE0ZFdtQndBTG04d2tyS0s1eGNUbHBIWUNEYWlISlFB?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e8617d-e0ef-481b-08fb-08dcfcb5570c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 09:44:56.2381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ygp6CQ3/sfNZkhEa93PeoBIfKBHL1ql14esUvGD3qiPwUjXLF8wRQ33keFL6/GBmnMVUnGbJUTLyNgUfrzM5Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6119
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

W dniu 30.10.2024 o 19:40, Jeff Dagenais pisze:
> This script uses objcopy in order to dump a section. Objcopy is meant
> for copying and expects a second argument. Failing that, it uses the
> input file as output. Even though there's no intented change to the
> file, this operation still re-writes the file completely.
> 
> In most cases, this re-writes the file as it was before. But in
> cross-compilation cases, the "objcopy" program in the PATH used here
> might be different than the toolchain which generated the ELF file.
> 
> In all cases, this causes a racy re-build of the .a, and in the worst
> case, the objcopy re-written .o and .a files are actually incompatible
> with the cross-linker used downstream in the ninja build causing failure
> to find all symbols from the libs passed to this script.
> 
> ```
> ../lib/intel_batchbuffer.c:763: undefined reference to
> `gen8_gpgpu_fillfunc'
> ../lib/intel_batchbuffer.c:762: undefined reference to
> `xehp_gpgpu_fillfunc'
> [...]
> ```
> 
> The intent of the command was just to extract info from the LIBS, not
> modify them. Using /dev/null as output file ensures the input files will
> not be modified.
> 
> Signed-off-by: Jeff Dagenais <jeff.dagenais@gmail.com>

Thx for the fix.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   scripts/generate_iga64_codes | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index d1e40b600..bbf1f7008 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -37,7 +37,7 @@ ASMS=()
>   while  read -d $'\0' asm; do
>       test -z "$asm" && continue
>       ASMS+=( "$asm" )
> -done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o; done)
> +done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o /dev/null; done)
>   
>   # check if we need to recompile - checksum difference and compiler present
>   MD5_ASMS="$(md5sum <<< "${ASMS[@]}" | cut -b1-32)"

