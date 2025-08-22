Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972D1CA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 06:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3666810EA54;
	Fri, 22 Aug 2025 06:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cttl9dvh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C4910E319
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 06:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755842514; x=1787378514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cIN5pQs//+RrKGeaMDUx8pSP2z0kC7XeH3zUp9iqf08=;
 b=Cttl9dvhZym6nq2+BGpjveDvAXM4X3KsE4mXzTNoxtZAJPYYGAVheF/H
 KIH/lfsZTTKNtQ8sjl/6gDWGcPNoGjCkZ8Ntau3Iy0PcD18uMY77HMClx
 vEUXYCUAFGECVbTWjjsro7xelvvwW8Cg9eHgtg5gFt9UHyaAaO3poI6f8
 6nGePuyRRsCBysX+HdCRAFBxWRhIqfZ+TR8XzAzV6Z/EVGk0ODea+s/3l
 C90XCBsvI9gaXhQeZ78MFQZL4A0APGSrU4S9bhqTOeRzw6Nt3AkJsRdKR
 Qqc4dPUdCyFjNfc/kuiupaVTm9/Tki6OjPEJIbRTepytZGxsvbFM4bWeP g==;
X-CSE-ConnectionGUID: kE3CiQ8hR7uxGFe/PLRyPA==
X-CSE-MsgGUID: /5Go+rmQTvaBLFGkddwudA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="60773903"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="60773903"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 23:01:49 -0700
X-CSE-ConnectionGUID: GN7GwL9NSquiNO+KI2elEg==
X-CSE-MsgGUID: skRDC5TgSOWYkvicB3kNIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="199583796"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 23:01:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 23:01:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 23:01:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.65)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 23:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNCcpRF0GN6f+PsObJNgVD50dPw3712MOMvVd2C4e23MELWOsJWRYxuTHUup1g+IjNIoBxf+we5SPWfPP1AJD0wInSTy7fB4imrHUcjJ45mgetf9pQel3ieA+wdMGifiRJvsamig/y45iOr6ELGTXC/QbIKher+Qharn9Xramzzw2Z6nwOpiLd38A4p8NF96hq8ytSQk0BAC7T/lexxnCn0GAVmwSEssqjIQM3gUpySGU+TYk9nLBg1TPNP22ul/XXjf2TJiYDDm//e8lgJo4e68zdB4DOnQaCt6MPAzOA6vyKtZheOCYhSFxRWe8VgIkg1Eh5vBIpjFAX8uGEcznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEw3Koe5vkdoMN24D5MhpM+IgeiqR888iqRlzM4OInw=;
 b=dO3xdZY7ktNl9y7YQBMS/V9S4k1CGa5y+lVQBrntm5s4sMG2WgFd0bv4CuX7FvHyWDzcHBCbZryl74xaI05A+mn3YCsDXCl+uXrIMvjb/pGtCIdsIhR/aCqBSF65ZfSewOHMHMs36CvrefGRgNRFXPnvxP+rGCxL7ERqhCEdGJ8zSGRExP0Bs+TN08A2lq61U2P2wFj9ugBcsrFYu/OuFrBZWe6RIlNPDF4wvbNDJw4u5K1e7Uky8Fy7HE0gZsmM97QfwB9As1qfWEigK05lmSHceh+wyx8NqFZE/yAeQUIcoRbvCQ5gqU6kMYHXvKx1ocP9UGNjaoKG0mzX+7i3Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 22 Aug
 2025 06:01:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9052.017; Fri, 22 Aug 2025
 06:01:44 +0000
Message-ID: <47b3ae61-a710-4322-b6d0-772f5165af7f@intel.com>
Date: Fri, 22 Aug 2025 11:31:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/intel/xe_configfs: Install exit handler
 once
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
 <20250819-configfs-unbind-v1-3-8359e66e3241@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250819-configfs-unbind-v1-3-8359e66e3241@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 085d3ccd-8358-4188-2631-08dde1415ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEE5QUJYbnkyRzZZOWZReXRFeFZpYVJFVUdxNHR5bG1pclhxT0ZMY1o3VzhN?=
 =?utf-8?B?WWo1enp0MC9peE0yMC91bVpmbnBPUUhzbElkVnIxL3kxdWkxVzZzREprV2wz?=
 =?utf-8?B?Sm9UL2NzTjREQkRBV3VFUnBOaTQybktnSWFMQXc5YnByZG1qQlphaWZlOUI1?=
 =?utf-8?B?TW1Gc0NXZGNORlNTWUNmR2Q2TWFKQlhDYXJxdCsxV1NlTSsyUUFWTTBiU1Fw?=
 =?utf-8?B?MlErQ2hld3laR25ndzVyTUVVZ1g1WDFGNmE5Z2ozUDNmc2doWFNOT1lUU1hL?=
 =?utf-8?B?cGIxMHhvNTQvSWVVUHJKMGJ1Mm1XYS9SWUE2Y29IUXpId2dDVUZhakdsRXBu?=
 =?utf-8?B?VXVvK3V6cTFYWEFOYTdOaHNpSGVtWElxZk9SeklRaVVrMFcxc0x0Y25kbXVI?=
 =?utf-8?B?dHpKV01wRXdmdVhHTE9rdU1zcUx2c2xOMjNZQXI4MVA4a2pYa1QwQW1hYVQx?=
 =?utf-8?B?QUlTS3FUMkoxOVdWTmI4anBNR3VGRHBjVUhpR2s4WnB3NWRFcExVdGI1N0lY?=
 =?utf-8?B?RWUrdmhic0dyVkdtTzhBdjUzci9aeStOR2xodEkrcE5iVjNzNzEzaU1KL3FM?=
 =?utf-8?B?TnFoVWFhOVZKMGpMNXFZWU56eWtEV0RPVDJ4MzBnRmp1MmtweHJxUXV5dk9s?=
 =?utf-8?B?dk9QbjVRVnAzMkRoTHlxc1NaTSsrWlVKSUtYckYwRzV1RE9vM0hmRGpodkRU?=
 =?utf-8?B?cVlBZUxCZTNaRUsvZitlSmx4YjVseHd2ajJVM3MyQ0IxT2MrQXIzcktCcHcw?=
 =?utf-8?B?aUdtcWRTbFFNSHI2YzFzY3pQMWdrNVA4eWdsZ0NIR01jRVZLRFdkSTgvYlkx?=
 =?utf-8?B?azV1QlU3ZTN6R3VzSGNJTVloQUdUSjBmaVJuUlB6SGlSYTNXRHlCR0MwOFgr?=
 =?utf-8?B?YWNUQnhMUWNCd2toR25Ha3IwWUk5UWNaSVV4TDIxd2ZnamJ4NUtOWUw1SG1R?=
 =?utf-8?B?clpDQUVVYmI5MFJWQi83ZVNoVlY5OUl5NVJZUEw4SldaeE1iMFRpMkJKNkVQ?=
 =?utf-8?B?dktuOUdtV1FVU1BGSUd5KzgybzBheTdMOWZ1VEtsUHl0YTk0RGhCbFhEaGs4?=
 =?utf-8?B?T3hOSkhIRnRCNzgzNGRpK3BsNUhadG1uWk0yRS9pYUMwdTE1WnRPSnU4ZWZX?=
 =?utf-8?B?S2U1c2xSNmlqeng1T1VqNVZYNDdIMWp0T21rU0lZam9ubWd1S1ZkaHM4S01F?=
 =?utf-8?B?dDNSZWkwckVZalYvSWRPdnVkZ3M2V2h0N2pkMzRuOTBKQ1hSZ3lsV2FyczBj?=
 =?utf-8?B?QmdIaDZNNEdTbVhRU2xULzFQRTFkalc0emJnRHRBNUNTTGVxV21HeDFYbnhi?=
 =?utf-8?B?bFp0VEJ2bGJHWXVsWE5jaDJHdE9OMmFIQ1NKaHF4djljUDBmZkxjTHZDM29N?=
 =?utf-8?B?K1dRVkc0N08wc2FmZEtGOWx5aERFd3BpK3pEa3ZKWTJOR1hrVEJyQlBhVXBp?=
 =?utf-8?B?cTFjT0R6Ylo0YXp3TEdtSUo5Q0JkV3JHREdCU3pDcWZTZjB2NzhPem9hSHZi?=
 =?utf-8?B?d0VIMjA1ckxHV091ay9TU0ZXVytaUUlzQXl3QkdMU1VrWUZBM3B6RU9uVy9K?=
 =?utf-8?B?aWhhNFVLVm1TNW5IQUR2eEtCMXFlWi94OCsvajErQ3B6U0ZrY3BZdlVjN21T?=
 =?utf-8?B?S1lWSHE4VXAyU1hPOTE5dG5EYm1lRll5OG5KQ1JKOTdScXJFak1WblAvUTB4?=
 =?utf-8?B?QXZaMFJRQXFuTW5tUGd3a3J4UDlGSkhBdngwZ0hRczNiOFZwMjN5ejg2YXZF?=
 =?utf-8?B?NDNWT0MvNGxBOUtsM0tYTHgrVDBlbTBlTVFFb0d1cDdTWG9lYTVnZkRKTm5q?=
 =?utf-8?B?cElBbEpURTYxTVhxVXFpRzVQbDVmVllIRml2OUhrU2FkcWpsT01kQ3hSYjk4?=
 =?utf-8?B?TXVNZEsrb2Z3anVWcWdsQnZnNHJ5M0gwSThxdmRlZk14SGpTbnJ5dEIwMUsx?=
 =?utf-8?Q?n295V0Myswk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTNvK0VNR1AyZzJMTFFjYlBKc2FlcG9MZ0Vhc3plcVZseGVlMjVEdDgzRWJu?=
 =?utf-8?B?UERvVG81YkkyeE8yYVNVSytaR1ZySVphMHYxQndYSmpyb01SbTBoa2duTGhn?=
 =?utf-8?B?R1d1L0g0TFk3TXNXbzBER2tYZjB5TGRzallFUWRsNG1hQVNnWGtTMFM0ZnVn?=
 =?utf-8?B?ekU5WWYrM29HVnhXaHp1eWIya0cxQWQwdFdRNmVwa3V1bjZLQjJQT04ybklG?=
 =?utf-8?B?eFFWK2FKZXMyV2ZMQmRmWnk1ZnRhVjNJZ0Q4VTBQNDNPTkNMRHpwZjI1MEpn?=
 =?utf-8?B?RTlKYWp4KzBQYXJ3MENqc2JWT292ZUppbW9TNk5Ca0ZOLy9aYnNrbE9WeHJk?=
 =?utf-8?B?b1Z6Z1ppMVZIYTIvTWZnM1pDaks1ZWdDeDJ1OHZPejE2ZFpPQVRoUEIyanZ4?=
 =?utf-8?B?OUphUnZCMFBrQ0MrZHY0TUhqYklxdDVXS1cwdzJUN3ovaTdNQ1dNUzh4Rmpi?=
 =?utf-8?B?M1VFeUl5RzFZUS9sTUl3dWt5UGlnMUZPV0VyaS9pWElJdE9KTGlGSGp3SkxH?=
 =?utf-8?B?ZFJteVdSVVpPVGJEY2VkU29OYnJQYjRrN2NGOGdIRmlxcUZTRDBVYkFBNEQ5?=
 =?utf-8?B?RG4zZnhEWjZtNnFlZWpzRGVIeWR0aEhwTUFoTkR3UHBXR2IxRExkellDQ3VH?=
 =?utf-8?B?aFZRZkcxcWFsN0J4RmQ4VFZWaDFZem5ndmxTS2VxRk1aTWkyS2FVcHNSbTF3?=
 =?utf-8?B?cUs2TDVKWDhhSWwrOWl2dDBZYk1LWkFxMFVtNXE1SkxYUjdDMTJ4NGhBejhJ?=
 =?utf-8?B?dk1RSkl0UUJRTEd4TXVCTm4rbW9ldUQxdVIxZFcxM3JLeEtsaTVKRmpsVm5G?=
 =?utf-8?B?ZEorYTdSVTJjd2FnV0MvQTdWaGZGblRmL25sMHNNeTBrQlVINUViOVVHVkRR?=
 =?utf-8?B?TGVrMWlsQXc2RnJkeW1pVUl2ZHAzbStaUE5Kb3FrT3dDR1BPSmVhNzV1a0pL?=
 =?utf-8?B?VzRQQVQ4SlkwM1o2eVFpUGRSMmxhSG9DMGJOTXZiWWVoTDdyamF5MDRQUm5h?=
 =?utf-8?B?bk0xL1FoSERLR2dZcUk2emxQTjVmVWlqdzFYZjNiam4wQmprc1R6MVM4VXZ3?=
 =?utf-8?B?cVkzdTdwNSthYlVCVW1jVW1HeWpZMTJ0SWpnQVNjUDJXNHJxSWxpa0FTUkIv?=
 =?utf-8?B?amhjcjRJYTlmd1BidC9URWtNNzhpNTZLT1VRQ3hueWFJL095UzRKdlNWdytZ?=
 =?utf-8?B?YkR1R2tEZURnVUJydk14bVB6TnUrYzVYOUVtNmtDUFk1T2RQVWF0elZTUi9p?=
 =?utf-8?B?T0R3ZVA1Q3lWYUx0Uk0yUjU3VWxJeDRYcnV3Q1g5VWtTb3NzTWtyVlF1Y01M?=
 =?utf-8?B?dlNaK1J6N3FhRmJHS0tkOVpPbHgwdVJFVG5ZUU1PM3JWRDFwQ3p6MjlhNU9E?=
 =?utf-8?B?bnB5YXdmdzJxcUpwUms0RDM1MHlBdEQ2ZWdCZWZVSlVudXJaYUdwUUVtVWJi?=
 =?utf-8?B?N1BST3ExMEd4RGNBZnMyZW1BSmZ5OXkzbENJK2hCMFBKOWd4ZWw2Z1hBYVFL?=
 =?utf-8?B?VzVjWWJuWG83SzVLOWp5cXVOaXBjR2lkUXFCbzF1VmN5NktPenRST0pRcUpu?=
 =?utf-8?B?ZHhtZkFxeVZCUmVOdm5hK0p6Q1VaMjd0amlpVG4rV1VRWlpwcXRpUjR1Y2Ji?=
 =?utf-8?B?bnNRYjZOeWNwZTJlOHJPOThOS204eXBBU1hUSWU0VGlwcWZoQ3JCQjlXS2tM?=
 =?utf-8?B?MkorWWFCa1NZYUlBajUrLzdLdHRrUE9nWnZtNWhFM1c2Ly9ENkRJUW9XM1ht?=
 =?utf-8?B?b2ZKeXY4dDJFWHA0UTMrVm9CbFBtUFZEYzBtU0hqSEVOTXhiQk0wOHZCOHVr?=
 =?utf-8?B?L3hsSDI4eXpTMUp4Uy9hMUxTTWpqbDl3em53cGVubWd4eFBidlpIZTg0Njg4?=
 =?utf-8?B?WSsxMlFLRVkrUENQczZxc2FBOTh3TjBnelZtVTU3U1RONjg0eG80NDZEKzdT?=
 =?utf-8?B?clFNSXNiT2RCV2tpYkhKTVNrajNlY3JSNDhRWUdhbS92ZlIyY0kwTmFZTllH?=
 =?utf-8?B?SWpUdUtXTlB6Z0xVbUw1REdYTDhZU3VDS3hFQnhpREZrc2RyYmtELzJrdFZ2?=
 =?utf-8?B?cmdUOGs0SE9uUUsvRFdpSENYa1B5WXBnZCt3L2prdTEzYklaVkVjeE1UK0JI?=
 =?utf-8?Q?+IEW5mGyq3oUUWX497bSltmI5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 085d3ccd-8358-4188-2631-08dde1415ef8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 06:01:44.3601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0mp0aYceYSBuZ/J6C0O7Pj6CmEJsIoRMGr2bZs9VZGs5VE+q30/g23M4xxeNRuBW8Hnw5xRLh/8OqaAvqogPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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



On 8/20/2025 2:10 AM, Lucas De Marchi wrote:
> All the subtests need to restore the device to a working condition.
> Call igt_install_exit_handler() only once, after creating the custom
> settings.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   tests/intel/xe_configfs.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 1510f25f0..8b2b8e3c4 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -26,7 +26,6 @@ static char bus_addr[NAME_MAX];
>   
>   static void restore(int sig)
>   {
> -	/* Restore after survivability mode */
>   	igt_kmod_unbind("xe", bus_addr);
>   	igt_kmod_bind("xe", bus_addr);
>   }
> @@ -147,26 +146,22 @@ igt_main
>   		configfs_fd = igt_configfs_open("xe");
>   		igt_require(configfs_fd != -1);
>   		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		igt_install_exit_handler(restore);
>   	}
>   
>   	igt_describe("Validate survivability mode");
>   	igt_subtest("survivability-mode") {
>   		igt_require(IS_BATTLEMAGE(devid));
> -		igt_install_exit_handler(restore);
>   		test_survivability_mode(configfs_device_fd);
>   	}
>   
>   	igt_describe("Validate engines_allowed with invalid options");
> -	igt_subtest("engines-allowed-invalid") {
> -		igt_install_exit_handler(restore);
> +	igt_subtest("engines-allowed-invalid")
>   		test_engines_allowed_invalid(configfs_device_fd);
> -	}
>   
>   	igt_describe("Validate engines_allowed");
> -	igt_subtest("engines-allowed") {
> -		igt_install_exit_handler(restore);
> +	igt_subtest("engines-allowed")
>   		test_engines_allowed(configfs_device_fd);
> -	}
>   
>   	igt_fixture {
>   		igt_fs_remove_dir(configfs_fd, bus_addr);
> 

