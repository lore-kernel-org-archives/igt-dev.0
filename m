Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E3EEA7959
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 03:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946D610E1C4;
	Thu,  5 Feb 2026 03:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YWHZRGa4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CCF10E1C4
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 03:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770262141; x=1801798141;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hIFOnRb/yBRY5gvWEOZU1e0pyr2/ywR4iNnmAsjrioM=;
 b=YWHZRGa42WfMTejRpjrrCnk10eeN08fTVkuKC92Xv29w86psWv4w6mOq
 vGct+MlROxmkUFZEGkV9/Cqp9UiB4+XUeP0r+iQ5vD1Ix3w2p/H6qQ6oH
 6a17JxWP+WbQjEQ1DYL0kIw+YNik86nKHYBd16UD0R0+vArswdJyzb7Nf
 kJ0HMZjfDi9G1q0tdCCHMfmWkOLD6qT9/ic/0u6rwhWDSfwdvxXadNDUI
 /p1k4zX/LoccXa/e/sGnevyXEXE5OQzkvj9FhuFajb4No8MWM5o3F88+a
 YwK2C7TilwMJ0n1AZ7XY6/+txYeDH8ThgnV9dKSCKa9rG6SyGclaF2ReS w==;
X-CSE-ConnectionGUID: PwmY1JqaSFedZJqzY05Qzw==
X-CSE-MsgGUID: dquSY2hdSluKxzyH/ji6jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="89036198"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="89036198"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:29:01 -0800
X-CSE-ConnectionGUID: uscbbXlEQXC6tnMmuXP5tg==
X-CSE-MsgGUID: ILxNU0OBQPWu+p4YuVx70w==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:29:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 19:29:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 19:29:00 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 19:29:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkgSuxeiXdIr/AcR7FzZ/qQpFymokgnI85glgrnBafzwLMTZm1SiPo0ZLI5iuLv25gKsrrN+qk7X4c+mdXwbVW7k2ccX70H3+4McF9R3Ng06N+tzMeJXwtakgZ0m+wE7B+KIKOA30VE3zcfh4G3boAzkkYW/a3KoHTmQ/YOiPK92QnV+nSVrnpMd71Hk1H5KDMWS0qFqb4E0T7LVHflQmHgfiDTtL9lW6dLM7tlE8h8y3rklm4ht/bSYWdl5hLDcH8tuqtHB+TjSY+pOdUsQPLvA/otmkswTTGg3elwaSAu9bIhYFCTHhqZ64zX6H4olrhz1b7ueB90unhCuBXy1xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFe8ElkCLrGf+4f/0BPeOk1TZSpVQu029pDSvBjd3EU=;
 b=pnsWMXGRbqxe88tlTGqYEV4wt1hH7Knf+z9BhpbhSKvOMfedYj6H9q6wi+8AQ5Yh74ln1+M8ygW20mA0fDdchNSD0jxb7fkj3z2hFUqJKRsBM9lascv0cZOJAoYcpKq2kgShX1B3nXhV6EqYpBjYN2G8wL4HmBbX032zwPMeT/+7ws6ZxggB/LhRvbH64BLieH0gPpHIaOoOfbX5NPh4zRW7GrYNN76BHWHOeopalsYFzR7QXJLEuJEV4Q+nKj+/2KvNQTCXOqDBtHWBg4uyWQslxbzcQiq7wce6DmKKkD3grDNdRH0iR6Um/7TfatR3mNJSQztPNAbZOYtLWQvk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by CO1PR11MB5010.namprd11.prod.outlook.com (2603:10b6:303:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 03:28:58 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 03:28:58 +0000
Message-ID: <e33bc25e-0b9b-4404-bac5-9185df5fe740@intel.com>
Date: Thu, 5 Feb 2026 08:58:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] intel-ci: Add valid skips on kms_plane to
 display blocklist
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260202083300.647462-1-karthik.b.s@intel.com>
 <9e01c2ae-2628-4f2b-8f11-3394cffb3176@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <9e01c2ae-2628-4f2b-8f11-3394cffb3176@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|CO1PR11MB5010:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad0a0bc-35ed-4564-8cec-08de6466b28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0FXZnBicC8vcnZ3RmFYQXZVSUJySllLbkQzdi9VSXJsbGpuOFIvbkF5NU5t?=
 =?utf-8?B?aTJiK1FETDNmK0V4MHFDSEcyclFUb0xWSDdQVGI2SlhMVlBPRS9xNTNzb0t0?=
 =?utf-8?B?OWt3dVhmRmhVcURDY2hYNFpFT0lueGh5Zk5ybEE3eEQwSGYwQUN5U2pyVXJq?=
 =?utf-8?B?Z0lkVytSZ0ZGY2dHenFjYUR1TzY1Q2lMcWxzREw5SjRaTFk5cDZyZnFxUkJ3?=
 =?utf-8?B?SVMzblp2NjBKd3ZxK1JFMk1ZaElJKzFkL2pXNUlkTHd5bDhQd2pOTmdqc0sz?=
 =?utf-8?B?RDJqU2hGOUQ4N0trcjhSNVMreUx3cFpoL2dkMk9mWXExRmJlVjl1ZUpIRXFs?=
 =?utf-8?B?S2FYWlFibm44YkhXVTdoVXNHdmw3dUZ1bkpDcUVITEFzbzBwMlAyNEt3b2k0?=
 =?utf-8?B?ZkRybWNJMCtNYnZ5WnVxeHkzOEcwQm83d1J0UGk4YTMrN1JGSVRmN01qNVI1?=
 =?utf-8?B?a1Y2TDJkSEFuZFJUOEQ0YTVwZXJickVkMDdkaVZ4eThOQk9zNk1IMHRyU1Nz?=
 =?utf-8?B?bnkvTnM0MHE4WEtQV0EwUVlUdnp6THozeUV3dFV1S2RUWDJiRTRiQ1kzZ0VE?=
 =?utf-8?B?THZCMVFzcmdqeVZRWFZET2Y1S29BTGoycDN1OWRlRElpOStVakx0K3F5Y2Fm?=
 =?utf-8?B?eGx4U0pzcnNQMzVJQlR1TVVKTGhxZzNaeFVRb2cyUU93VHJVdUNGTXhlMk04?=
 =?utf-8?B?eXJWdEFtVzZrZ1k0d1JBM3VTaWlMWWZDYnRqUDFYSy9idUp3YW5qZlplVCsv?=
 =?utf-8?B?K1cwUDVVc05WeE1WVW5oSHhVSHBHQlJScTFDZHdFMTFtdElkVFd2dEppMC9B?=
 =?utf-8?B?NTRpcERPT1JndXhiMHBzckROWTI1Y3h1ejNtNEp6TmZsV0oySDdoRGRZcXdR?=
 =?utf-8?B?ZlV2UWxRMVFFZXBtUVhvak1tc0kxQzBraDZzU1VnNUU3YzVsK05Xb0VTQkNX?=
 =?utf-8?B?YXBQMDJKa0xkRW5VSU1OQnlDenY5ckpTWWhUMG85RGRvWUZaMlo3Z1RWazd1?=
 =?utf-8?B?ejFHaGN2dHErZlVyQnBKT2E1NjRndE5qRjlFb0tGUllmSlRjTFVERzFIaGZ6?=
 =?utf-8?B?dVE3RWFrSHptMWtSNlFEVU1VMFNqMjM4cSs3TVIyQUZ5VkdpL1YvREF5UzJH?=
 =?utf-8?B?TkVUQTB0ZlN4SjVtaHQ5Sk9NbG85YXdJR2pJRlRwbkJIUUhtSUpLR2dnb0x3?=
 =?utf-8?B?Q2ZVOVg1ZnJBOTJiNTMxVjByUjZzckE2b0xQTzJ5OHRESUFmdHBkcTU5dkJo?=
 =?utf-8?B?cWZkTUQwaFQwbmdYVlZIR294c1dVVDQrclYrQVVldCtVekRDZEtnZUZDTVZF?=
 =?utf-8?B?aUlyeldTazNNSVNyUngyMnV2QUg5RlBpdnFQV0cyNEdOeXJyN2JzamFwWUty?=
 =?utf-8?B?eFNJSVlZUkdlZ3hRTmpYaUxVMkxJM2VHbW5RRll3cUd5KzNJY082QlpReTFK?=
 =?utf-8?B?NmhvZCtiSGh2aGFKT01KZ2V6ZHA1Z3AwbGM4cXBhSjdYcmd2ZG1DYk5kQmYv?=
 =?utf-8?B?cTUxVXB5T3dmZWFkT3dqVFkvWXY1dnp3cHptQjd3WG44K2hZdVFSWGYxS1hK?=
 =?utf-8?B?b0RJNjZNMUpQcy9xZm1FRGZzOHc3RTJGNlhFVm85QWs2eWlKYTRHR0Zvbjhs?=
 =?utf-8?B?MW5OWUJwdy92UldMTHhEWlB5WGMxVmRKZlFYWVJ1WEhrM2M2N2c4aGVrd25N?=
 =?utf-8?B?cDRDVHIyVWpyejVPY2l5YWRRTjk0ZFFGVXllUFp1d3NSRXZ3c0JlSHRrZThm?=
 =?utf-8?B?WlZJUG5BTGIxWHdMNFFTNWwyUVIvcHBhUGMvazVVVVpoblVkTlJvMHV0UFhw?=
 =?utf-8?B?aTV4MmloazJFWnFCaFc3bjFyQ0wxdUYxWVFMNnlaUEhQOCtTWGpmU0pkaGZZ?=
 =?utf-8?B?RnEwU3ZwbTRUSEkzTDF6K1QvN2RiVGZkRlJhRk5YSk9zYWhCbHdPWUdzVjRw?=
 =?utf-8?B?VDZCQ0RrYnhGczJidVpqU25lRjVBMFdGalRweHZYSndrUFJHRTAva3k5UnNx?=
 =?utf-8?B?Ui84eGc2Zi9HeTdkM1hzU2pZMitOaitpd3FmVlBMOWc5Umg2ZncyMHRZVGJW?=
 =?utf-8?B?SFRDbWNHWldlV0JTVkVMMHhJSUlTcERKdHdLc3Z6ZEpaNFExZDZDN2xaTWM2?=
 =?utf-8?Q?ughM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk16dzcza3k2WDdyRElHWFNUZnc5blUrS3NjN2lPdWczU0EwOG85TXlmQ2pp?=
 =?utf-8?B?eUlvelZwLy91d01VbUE5SDVXZ3RpMFFrSlBSYUR3ZXBYeTJjbitMMnNRZnpv?=
 =?utf-8?B?ckJHNEF2bEl1L0ptc05WZ3Y1akViRGtvdGMzTm8rVEdCKzJra09GY0taeVRL?=
 =?utf-8?B?K0dicHAyRlkrV0c0OG41N2plVXQxSHgrczZueERLaUdmd2FVRTJwR1BlVTh5?=
 =?utf-8?B?NVQvMkM2OGNZa2ZHdFhWUUV3eks5MWVFcTFIN0htY2V2TUVnSGE2UnZzSmRQ?=
 =?utf-8?B?VUk1dUhCODRySUMveWVtR0JZWEpYbUxxckZ0VTI5bVRVK0MwSFh3TE16Yktk?=
 =?utf-8?B?R3crc1ZpTHViUXVNYUJkSk1CanJPamRUWkpqTnh4UjJWdjl1bzdKVmVoRmsz?=
 =?utf-8?B?d3gxSjBDUlpubm1BWUtiRmMvVkdwQXpvM2tpdnpQK3JZT2hiOXB5OEEvWk1I?=
 =?utf-8?B?ZFdXakZiRDRvckxocjhpZ3U5WVJSZVBlZ3FGK0JaWGdJV2puT0xKakVwNzlu?=
 =?utf-8?B?aVRkUmxrY1l1UWtqWFoyM3c2TDViOVArYnRUdkFNbFNkcGR4NG91WEI3VnBL?=
 =?utf-8?B?bTY0OFNycW03ZUVFbG0xZ20xMm03eWtVUW5BTkxJTTkrblJtbzhDY2pIU2sv?=
 =?utf-8?B?WUVsNlJuQndPSXFsTDMxaUs5V1hLb0x4Mk1jeGVzNHVBR0tXb1ZLeDA1cGFx?=
 =?utf-8?B?eERLMGpBa0ZkZVc0cmxmdzMycTJJaFp5WUhMR1RzZHdpamlUTUd0ZFhtUEp2?=
 =?utf-8?B?NGN3Y2VCZERkVXlENG1EdXFpL1YrVmxUTHRIZDBYTjVDRWd0cWlra0RPVUU1?=
 =?utf-8?B?bkljbkhMVDNpSUFQZFRFU1hQOGhOR2tuU3VtQjVBa1JFd3pra1NNUUFzQUxT?=
 =?utf-8?B?UUxZdWxXakJLaElORmp5K3JTQ2MzUWw2aFNHQ3NIVVRvdkRUNlEzQ3Z0K3ZX?=
 =?utf-8?B?ZStkcjdNRzc2elczdW1iVytXR09RSjhuL2llV0ozaDZQa3liemh4clB1ZGlI?=
 =?utf-8?B?bTRuRTNNbkt5bE1VZWs4QjJHSzRwUktMeDAyQXFaUjFmbEpBbUVLaFJZcjdJ?=
 =?utf-8?B?MnRXZ3N0dEF4c2haTzluNFE3RWczMndjNHBNY3FRR1BUdzNwaCtwNVVieVZN?=
 =?utf-8?B?czhKMWxDc0JVQUVyYzBsQ0Rya2dmNGJTRzM5c2VJbmFMTlkyaWZmMGkyTEpP?=
 =?utf-8?B?R1VCeU51VGNXYlVqYysxdjhEaTdqY0x1YzFQYXV2cWJ2UjlPek0zNVNGclBq?=
 =?utf-8?B?RHhjT0h0elpSRmcwcUdUQlZEZk1vMFlOcjFmN3lxM2htVnJrZ1AzMWtSWlFQ?=
 =?utf-8?B?N1k2b2diN2Y1U3JuNG9aY2lvbUhPNXo5cXVtODduVHVTSDhWUkpGT2oxWDcv?=
 =?utf-8?B?ZHJ6RjB1dnppcDF5OG1jT1EwRE1pbEZmRmdYclR6WUczSEs0c28vbjJMdUp5?=
 =?utf-8?B?bndOcmFTOG9ENVhtN3FCbzdHOVVFam5kM1lhZkthV3NBcjRlcTdQblRBbHhG?=
 =?utf-8?B?OCtEZTdpUGpiREdEeS9uU1FmU25ycURNeCtPT2NuZlJoZE91OXlrVHQ3bWQv?=
 =?utf-8?B?N1NiWG1iZDZpYU0yNVlLaVlQN05Fd1NacnMxUVJkbDFZSG9ZZ2o1VzBDTUFD?=
 =?utf-8?B?dVRMUjgyWDFFUDVodlRWazRTaHp0WHYzUVpiZngycnRoZW04VDB3R1dMMThk?=
 =?utf-8?B?ZTNabmw5bjc5QURUdE4yZWFydTRwd21IcEJRVzRoZGtkdTZGY3pSai9xaHBz?=
 =?utf-8?B?c1o1WlYzNmg5ZitpZGhOa0FUYmJoQ3RXQnZmdk5sbVlYcVVOSFBBejVRSFRX?=
 =?utf-8?B?WnhoTENkcnlSNFk2QnpDQXNrZTVGYVNHQmJrUnlUS29TTU1BMWZEc3V2UHZz?=
 =?utf-8?B?akNkZ20zUmJmSG9qRDBPaUpBYWNXaDN0Q0NJb3hIcklBeGZSL0t5ZzZwcnc4?=
 =?utf-8?B?dElrMHdLVUZuSFF6RWp5cktkb1g5aE52dVRYZWpEZXNIM3lmUVQ3ZWlPdHdX?=
 =?utf-8?B?djRTR1Irdm40UWEzMlU1MXZjVmN1TTZvMSs2cTZOLzQ0ZTM4Q2ptWlErTW5U?=
 =?utf-8?B?Z2lwR1ZGZktkTERXSk1ZMHBscnlwUCsraTEzQ1R2TkJqTE5qQ2tCaDR1TVE4?=
 =?utf-8?B?NjNvdVVGTFJIOHhtSFNuaWt1dk9aeFpubkhLd0x3Q0VaRUN1NDRTaUwrTnZN?=
 =?utf-8?B?dktIYnNad21aQmgxMHBHbTk2aUpjNmpORkVXdnBUbFZSNFFGUEJEWjJHamp5?=
 =?utf-8?B?dmtMOTU5aUJrYnlnNlZFV08zbCt2d3M1MWNUZXhlQTI2MFNmS3ZDTEZhNTVu?=
 =?utf-8?B?RjVtcXRvQlVtYVdIRGswVktvM0dsWVBzOENSeWJpU3JUZXZBMkhvdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad0a0bc-35ed-4564-8cec-08de6466b28e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 03:28:58.2010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b29EEPjYylAf5jAKM8sxcenpJ1ztF2Fj6E/GedEC9R6DYt8eP1vXvQL4Ol2eJrlS4VXeboWcgTvVAjWRgOVrcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5010
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

Hi Swati,

On 2/4/2026 5:59 PM, Sharma, Swati2 wrote:
> Hi Karthik,
>
> If possible can we add similar change for xe.nvl.display.blocklist.txt 
> ? These skips are valid for NVL too.

Sure, will add these changes for NVL.

Thanks and Regards,
Karthik.B.S
>
> On 02-02-2026 02:02 pm, Karthik B S wrote:
>> Multiple kms_plane@pixel-format-* are skipping as those modifiers are
>> not on bmg,lnl and ptl. Add these subtests into relavent blocklists.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel-ci/xe.bmg.display.blocklist.txt | 2 ++
>>   tests/intel-ci/xe.lnl.display.blocklist.txt | 3 ++-
>>   tests/intel-ci/xe.ptl.display.blocklist.txt | 3 +++
>>   3 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt 
>> b/tests/intel-ci/xe.bmg.display.blocklist.txt
>> index 2c0c4a0e8..86c1bbd72 100644
>> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
>> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
>> @@ -11,6 +11,7 @@ igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>>   igt@kms_async_flips@invalid-async-flip
>>   igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
>>   igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
>> +igt@kms_plane@pixel-format-(y|yf)-tiled.*
>>   #########################################
>>   # Valid skip :- 90/270 rotation is not supported
>>   ##########################################
>> @@ -116,6 +117,7 @@ igt@kms_ccs@.*-dg2-.*
>>   igt@kms_ccs@.*-lnl-.*
>>   igt@kms_ccs@.*-mtl-.*
>>   igt@kms_flip_scaled_crc@.*dg2rcccs.*
>> +igt@kms_plane@pixel-format.*(mtl|dg2).*
>>   ##########################################
>>   # Valid skip :- Simulation specific
>>   ##########################################
>> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt 
>> b/tests/intel-ci/xe.lnl.display.blocklist.txt
>> index d92e12d64..d280fb16a 100644
>> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
>> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
>> @@ -11,6 +11,7 @@ igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>>   igt@kms_async_flips@invalid-async-flip
>>   igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
>>   igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
>> +igt@kms_plane@pixel-format-(y|yf)-tiled.*
>>   #########################################
>>   # Valid skip :- 90/270 rotations are not supported
>>   ##########################################
>> @@ -85,7 +86,7 @@ igt@kms_ccs@.*-dg2-.*
>>   igt@kms_ccs@.*-mtl-.*
>>   igt@kms_flip_scaled_crc@.*dg2rcccs.*
>>   igt@kms_ccs@.*4-tiled-bmg-ccs
>> -
>> +igt@kms_plane@pixel-format.*(mtl|dg2).*
>>   ##########################################
>>   # Valid skip :- Simulation specific
>>   ##########################################
>> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt 
>> b/tests/intel-ci/xe.ptl.display.blocklist.txt
>> index e9d0775e7..bb5c83f15 100644
>> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
>> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
>> @@ -19,6 +19,7 @@ 
>> igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
>>   igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>>   igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
>>   igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
>> +igt@kms_plane@pixel-format-(y|yf)-tiled.*
>> ##############################################################################
>>   # Valid skip: Test skip due to hybrid config requirement
>> ##############################################################################
>> @@ -71,6 +72,7 @@ igt@kms_scaling_modes@scaling-mode-none
>>   igt@kms_ccs@.*-dg2-.*
>>   igt@kms_ccs@.*-mtl-.*
>>   igt@kms_flip_scaled_crc@.*dg2rcccs.*
>> +igt@kms_plane@pixel-format.*(mtl|dg2).*
>> ##############################################################################
>>   # Valid skip: Valid for display ver < 13
>> ##############################################################################
>> @@ -148,6 +150,7 @@ igt@kms_rotation_crc@primary-4-tiled-reflect-x.*
>> ##############################################################################
>> igt@kms_(plane_lowres|plane_multiple|rotation_crc|big_fb|flip_scaled_crc)@.*(x-tile|xtile|tiling-x).*
>>   igt@kms_pipe_stress@stress-xrgb8888-xtiled
>> +igt@kms_plane@pixel-format-x-tiled.*
>> ##############################################################################
>>   # Not supported by current CI configs
>> ##############################################################################
