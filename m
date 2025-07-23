Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F54C83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 06:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6822B10E00C;
	Wed, 23 Jul 2025 06:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpA572c6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B49510E00C
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 06:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753253230; x=1784789230;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AxbvzrfB44nYz20srWH4vwLpF/Z6j6Z+Vk1fuvshzYk=;
 b=JpA572c6f3OAX/Yq95QcD270z+LolFL8haQgXe5+ZE1J7y/0JpMWplay
 jXSXYw1ZWS7L2SzuOEOYN+u0i8iyRoz5DQPes40iE+tjCqAUSOlkcMM25
 qRAoDfqKb10utDIn8z3oAB1tKhcacSIQ4KbzVYv2rXvPcPQp6mXg9IH5u
 16spGGU1EtX4lGk2/t207xJql54n3KvQHwEcRC2iq9VS/64csDq84dLIo
 DvMIuATZUmeqMcL+Hrs/96bAjzibiaTOPVeznM/0GB3xT4OC9s/DaFhnn
 80z6B1Ac3oHfb0QUf2t27e/aRrb2okoakp1rp5DWuJj5RrACkctDIcVKd A==;
X-CSE-ConnectionGUID: YfzPtUovRC+Y9KF4scka5g==
X-CSE-MsgGUID: x70o98f1SLWiOVpCFGpA9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="59341147"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="59341147"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 23:47:09 -0700
X-CSE-ConnectionGUID: DgtpgPo+Q0C8BeMvRX+8UA==
X-CSE-MsgGUID: iNd2cd4NSM2is+6dAusjWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159400877"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 23:47:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 23:47:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 23:47:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 23:47:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8N+9akqzXCZv+VGYXnNtXVsadnrTHd3gE/OYjbYBCsejXSsnkrZxII1mGaxQh5RwytskAUSaVdsa0CmWEQeDexskuXY44YAeG+H0mIQZa7+NWRE9kikeMimv+Z+ux+yGPn41UISXWlwJW8DNTDE5kuHgJK5JgcP2W2JquuUtWPLCzdEHFx5gfKsE3LdjXP7FHta07z8qd95tyD4ZtU8qfjnpw4Bg7GoTPXtIr9cv6Ary6CKREBC0bSfIngqKDV773z5YRK9wywZ5V66XsPiaFAawyh1P0VCGAqNCCk5OoWj8cDNq8JvnaHb5pYZfA9DHfwNfJ824BvWPmBIDJ2ooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STZGeJGaPQkPo2KUglUPr+l7UT0c/xXAyPpNefz72rQ=;
 b=IVB7WarocCB/qkUo4NW2iWFwcdaYON8ze7UxblTd8OQx1UsBHVQvGe0FETJ5U3mZdQG+QDiz69VY0pTj2myDK6t/HR5LRVlBWf1JdAi65rc1Aqgn4KKZV0zF+7m8cVo1UaWgWIvRhzf3FBoz99Z1eDC/o3mizshOPxOR8KyfueoJi/YTmwPcEAOBIGzqoqggTgm4wFr91G6ajw1H0bb3Ewwg8/WQ/MtaJi6EfA76SLGm2S6lthy4T0nqh/JQEBpv3LKlAm62IcbtG7DfDgIvCwCQGXHo4VUCDnw6gb2sri5HTZWN/9+NPWeWTRGWmFPiXxwo2bvabOkjGXnJmETdVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH0PR11MB5030.namprd11.prod.outlook.com (2603:10b6:510:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 06:46:33 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8922.028; Wed, 23 Jul 2025
 06:46:33 +0000
Message-ID: <82ef0c0d-493a-48bf-b823-3eaf1709037f@intel.com>
Date: Wed, 23 Jul 2025 12:16:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_joiner: Update ultra joiner
 supported platforms
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20250703062655.894129-1-karthik.b.s@intel.com>
 <6b0b8107-d99b-4208-b184-8e215d5177d8@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <6b0b8107-d99b-4208-b184-8e215d5177d8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH0PR11MB5030:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a257b2-ddda-46cd-cc3b-08ddc9b4a992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm5LYzZKTW8rSW00QmhZNS9wblZYMWhMaTF6azlzRXVMRnZrSWpqU3A3a0J3?=
 =?utf-8?B?R2E4RUFBLy9CK0hjVjF2QjlaTE5zWDl6bk4xQzZGTmRVYmlQUEcxKzFxTlhq?=
 =?utf-8?B?U0NJc3NYUHhXUldKaXNFZTBSQmZmTGkzMC95VDVBdXZGKzVMTnhBOGFIQTFU?=
 =?utf-8?B?KzlnMDVMY0VtZlRFdWRScGNFbTRPbWdBeGFXZHVYeG5WdDdvTG96RTYrandy?=
 =?utf-8?B?TnRBNE41cDk2ZWJiaitMVll4UmY5K1NrL3NWdE9sTkRiOUd2K3ZHYUFUM0d6?=
 =?utf-8?B?SENxY0pFRXZyeENva2oxL215cE45QnM3RTJjS1g5UFc5QmZpVzBUZHJDMDht?=
 =?utf-8?B?YXVITzBHemViYTdENzVheVd3VytFN1MzRVVqb0R4RGNBRVhaV3Z3dXJpamkx?=
 =?utf-8?B?VnFQakNBNHgrWnFQbjhFYVBHNWZsN3BWWHdGcXA3cXMvSVlDazVidTVlNXlu?=
 =?utf-8?B?M1dKWVZIVGhGd0c5Z0IxQU1qNUJQZGFudU5WOWJHbXd4OGkyN0lCM2xVL3lI?=
 =?utf-8?B?NjZ1Rmd0VkVZQ1UyWW1ZRndWL01BMVlWUXV4QXVYbldDbFk4ekdJNjNWbzlH?=
 =?utf-8?B?YS9iUURaVmdjZXMyL0phZGJpanBpYWdWNzJyV0lFczk2R2UycWkyRUNzZXhv?=
 =?utf-8?B?QVJ1TnRFWFVtY0NHekZtZDRhTjVHeUxFdEw3clhBTUZuYVNDWGcrdUYwUUdi?=
 =?utf-8?B?eTQxS0JQT0xzOHRSTXc4Ym1vak1ZNlQ5dCtCampaMUNOZ0xMQWhkOU1Pb0pw?=
 =?utf-8?B?TE9NMUNFbUhJNW9HNkJvaWdYQ1JxaGMwOGRyeVdWUEM4c1lwRDVrNnU2Tnds?=
 =?utf-8?B?OXRDS1FqQ1BxbDU2YW9ma2pGa3lYb28zVmpaR3JsY3VTNXdZcmNrVzU1N3E0?=
 =?utf-8?B?YTJMZTFIb044V3RnN0hLa3hyOGhhZ25UdGloQXUwa2x0VGpuc0ROTzI0WlAx?=
 =?utf-8?B?THR2UDhrRFNHRm1DYy9SbHBnc2tiT3NYLzA0TzhUUENWRjVWZG1KN3d1d1cz?=
 =?utf-8?B?WGx3YVNJK295U3Z1ZXY0ZHNlQWdYdytTRjZXQWxmY2NXQUJjTGhVR2ppODF4?=
 =?utf-8?B?SnRENXU2a0tlcmN5QjVHakxiM25hd2NRU2srU2I1c2NwMGREazk1YlJmNVNy?=
 =?utf-8?B?SnJBNnI1WDIwSE1tcis3eklqTERVcW9hbXBEK25Wc3dDazhCUlFNa0JiaDB1?=
 =?utf-8?B?ZDVsVHZJcnJhSDkrL1M2QjdQRjJjRVljZ0ZCSXFBU0ZQVzRDakJHNC82dGI5?=
 =?utf-8?B?emZwNE1JYjhqcTlsRW1QU0ZCRVMyWkFHNUpJWVhPSEZvUHdCU0lqK1JXUlBV?=
 =?utf-8?B?cWd2YW15V296L1ZvVlJjbHdKM2RPaUNiU21MWENxNXRxTEFRZHpOaWdwSFVI?=
 =?utf-8?B?YWtScytxWjh3WGxhcEMrV3BRN3BiekdpcU5Zb0hZYnhLVlZEY2d3MVhQN3dP?=
 =?utf-8?B?RkF4dXllMTJiR1RiUGNKMUYwRVM0QWlxVnRUZWNoQ3VURys1c3F6ODBsc0Iw?=
 =?utf-8?B?NWVXUlNsSnNDdDJ4QlZqMzFGaDFPSzNrQ0EwbE43OXQzNlZPTVhXb1Y0MmdM?=
 =?utf-8?B?UnFMdHFXcVVsQjFHN3hJcVJQUVdKV2xMQ2VrSUFjMXhIREU4Ylkycm5lTnBU?=
 =?utf-8?B?MFNXVmNUcDZ0N2c5TkpwZHdyS0xHcHZNRXp0RzgrK2RHVjZRbEovMWszemkx?=
 =?utf-8?B?K0hJeldwcjJiejNxQ0dvRzhSTjZNcmhvWGJDb1dUYnNRSGRaeHh3cnAvSC9O?=
 =?utf-8?B?S1c4WWI2VlJER3hTUjBLZngrN1RjNVdFR3FEV01PeTVFSHgyTWhwU3duUXF6?=
 =?utf-8?B?VGlkS0EvVEtJRk9XcEtZK0JDOW80MlJJQmtETFBXQ2l0Q3JtTTF0ekNwdFRB?=
 =?utf-8?B?Nno3Rlg2OVpOM1NaNk96YzRSMExDSUVPVnNlMXZyeTI4ck5LcldmeE5VeVlo?=
 =?utf-8?Q?gop7BByvoBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFdQTVdZbUhQdlF4K3pOTC9POEUweE5OdnpjeGdHdzNXM0dJUzU5aGpPaUJv?=
 =?utf-8?B?OHA0WWxxVWtzREQ5S2tWSmhPbmlrOVZNV3Q3a2Q5alZrZ1BrOVAzYi9WeW5W?=
 =?utf-8?B?R3lCOXpReEhMNHhmNXpGSVdlYjBDN0VLSlV4TVVvUzU3V3NWcUtxMkdUR0RB?=
 =?utf-8?B?ZGlERzdxRG94QVNUdHBSSWx0TU9lam83WGxiUVppOW1RNVBRQkhpdm9FRUtW?=
 =?utf-8?B?SHJMeko2djluWlJlTVNlOGNjSTFWeG1uQ1ZXNFlCMmpINHMvcjZSVHlYMDVM?=
 =?utf-8?B?MTdJdXZSL1hsd0Z3R3JDa0VvNEoxOHc1UU9PUUNmT0RBK2dWRC9MTm1vMGVP?=
 =?utf-8?B?QldwaWx5TTA2WmdubWIza0l0NWZCLzE0cVdkaWY0dFowS1dodTZySDZXd2tN?=
 =?utf-8?B?QWJ5QW0xNUFaOCt6Qm5BamVCejZ6cFc5VndjWmYwQk02UmMra01hcXlrMUxU?=
 =?utf-8?B?elIxczdia1MwZ3JIYWdMTTJlMVdWWllDNmpFL3c4Tm9rR1Q0WW5TNGhmcHdj?=
 =?utf-8?B?K3ZvS2FUQUJ1VTR3RWtvOXpQR3FYNEVranJTQ2EwYnc0WVc1V2x5czdkNjFa?=
 =?utf-8?B?dXdpQ2ZldmFXR1JzejBFTlU3SFZXZnVSdDhDRkxHYmpseENsc3IyREdyQ2Jw?=
 =?utf-8?B?YWdOYmY1NGNUbk5hc2pFTllEbnRqbkg2WlVibXRqMTBOcHhITFpoNm8xNm5t?=
 =?utf-8?B?ZzkrNStTT2taZjA3S0hORU1BK3hxY1BMbTRtbGMyT0dNYWc1TU9jWUNUMnJS?=
 =?utf-8?B?WU4xdS9LdGtYR2F3cVZSRGZMWnIrc3Q0dGVRbVBxT3pUQXVlekEzME43dkdk?=
 =?utf-8?B?TWl4Qks4ZHlSWXQydktCZ0ZQQzFadlJRQ2NFbWRYaUN1M0t2dEJxcW9BbkF3?=
 =?utf-8?B?Ri9OMG82bU9OSWVUMlJNVmhEc0VmMjNRSEJNWjFHZ2xYR2ZpNXduZEVMYjlx?=
 =?utf-8?B?UE5tbTRmRHEzT2g3N091ZlpCaXdMUHBiNXJ2UmpnWE5CMk54OHNqVGJ3N0Nw?=
 =?utf-8?B?U1pXMTJFQmJ2aHdTM0h6b2FLaWVJMmJPdU43MXRoR1hpR2ltWlRBd2VjbXpa?=
 =?utf-8?B?MDhKemJvbEdnaExPRm93RXBPd1FDeU1UdEMzWitVWXJiRi9EVjliQzMxNkFG?=
 =?utf-8?B?ZkNLYWoxVWFTYitzSWp4QTkxTjVUeTI0UFQyYmk5WHpKK3FOb1FEYWI5TEJ2?=
 =?utf-8?B?eXhod1RLOW16ZHc0b0dJWk5oYUcvbjA3aTQ5eEp4dnVoVlBtV0t2Z1pXcGZT?=
 =?utf-8?B?NnRVQWNaVVQ2MnRLVkxoYXdENEF5N3F6UzRnTXRoTWR3YlI2UzJaUzJXVU1q?=
 =?utf-8?B?cjlwQ3BibGRHbENSR2F2VnVLT0M1elorMVY0MzFodFcwWFNDRXVQNk1KLzEy?=
 =?utf-8?B?L1RLTGtYclN5aWFSY2pGVEtqYys2ejBsM1JjSXg2MFBGcGhSZktYa1NqZ3Jq?=
 =?utf-8?B?UlF2ZFdENE5TeVk2TGNvTWw4R2Z4VHdQMlNVUkkxNmI3NlQ0clZlczcvUDBW?=
 =?utf-8?B?cEFaWHF1SlZuQkRLeDBuVGJUb0RmM2pSZmkxSEZkT0NoTXF3S0RFRDJtNk5V?=
 =?utf-8?B?cHZCa1hTVVN1enRPYURwaWFXczBkQ0VYS3hkVEd1QWJPS1E2ajdTNDdITGds?=
 =?utf-8?B?akVEc3Ywd1ZSMWs5bmJQNFkvbERnMVZXajlkZTMzOTRlQS9wcXZWcEFDeTJY?=
 =?utf-8?B?eldUcDE2bSt0dy8wSTFyMW5nOU5mT2lFMmlwL201NFBKUVhJeStvaWg1TXJa?=
 =?utf-8?B?MDBRdHFWdFJOWmhHRk5aM2ZMdEFVOUJmUGxOc1ZTdE5pRXdyZWRERWw0elFo?=
 =?utf-8?B?TnVZcmM1MUtiRjdJYjJKOWJYNFdHNzhRSXdSQjB3LzNIa29GNWxDZ3hVZUVv?=
 =?utf-8?B?U0hlcXNjL1VvNU9xVVNUNGoya05wM1JtWDdGTzBGbHhFWmFHNlNLUjZYOWE3?=
 =?utf-8?B?dTl0amhlQUtjb052ZkU4YVRzaXNlVnV5endTQkhlL2h0VlJQSHlrVEMyWWJM?=
 =?utf-8?B?VmF6Ym55cWdZTUNqSW9VNHJhcHZJVmRKMDJiRmNaTUVQb0pPZm1acUxNUjdl?=
 =?utf-8?B?Smo5VjVFTTd4R1ZlVjA0V0lZaVB1RHcvTXVrc2RyaUNPbFFNcUNoNDdtZXV0?=
 =?utf-8?Q?eFxmORl9+R5vL6Lhc7XI72A5/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a257b2-ddda-46cd-cc3b-08ddc9b4a992
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:46:33.6263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //FShRDYinxp/6+etXpOR5MPGFy5hOgSXHfQ7rhge5cSni0XBT8kyO/4C/OLoXz5LjCBZQ+TNlXEoMc4mZT0BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5030
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

Hi Santhosh,

On 7/3/2025 12:22 PM, Reddy Guddati, Santhosh wrote:
> Hi Karthik,
>
> On 03-07-2025 11:56, Karthik B S wrote:
>> Currently, Ultrajoiner is supported only on Xe2_HPD.
>> Update the check to reflect the same.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel/kms_joiner.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
>> index 22c7c6d85..d1ddbeb60 100644
>> --- a/tests/intel/kms_joiner.c
>> +++ b/tests/intel/kms_joiner.c
>> @@ -572,7 +572,7 @@ igt_main
>>             is_dgfx = is_xe_device(data.drm_fd) ? 
>> xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>>           display_ver = 
>> intel_display_ver(intel_get_drm_devid(data.drm_fd));
>> -        if ((is_dgfx && display_ver == 14) || (display_ver > 14))
>> +        if (is_dgfx && display_ver == 14)
>
> nit: Would it be good to also check igt_is_dsc_supported_by_source here?

Thank you for the review.

I think from IGT/userspace end we shouldn't be concerned about if the 
mode is supported with DSC or not, as long as it meets the criterion in 
'ultrajoiner_mode_found'. Please let me know if you see this otherwise.

Thanks and Regards,
Karthik.B.S
>
>>               ultra_joiner_supported = true;
>>             for_each_connected_output(&data.display, output) {
>
