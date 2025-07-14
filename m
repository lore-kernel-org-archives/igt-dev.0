Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0DAC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 13:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E7810E49A;
	Mon, 14 Jul 2025 13:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gd9BCZ1f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B642110E49A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752501106; x=1784037106;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=0ILMURuYr9NU4DthmV2ZPPIFv9gNdwqQukLPHCVsLPQ=;
 b=gd9BCZ1fhQnZK4kVJXCduLNDpBIHvlVO+s1OZiXUdduC/IBKuL0Lzqcr
 D/K1+Jm7WeHSFo6EfSO14HvPwFOnWkbPPFkzcc+o29uo/9CKLCTVqNCfs
 mdy8dCi9kXsOzO+hkMzPnYN3tcJf0ytSGobgoHfdNVPUpwOWUidtdpNl4
 OVnKk7KYSqgzLbaewIoSUNFv0vXj/ORhhd5G0V++3YEEGKl2g3mS57pVe
 X1Nzbob65gycejdnkYdlx7TGCnWiivAXq2YGsTO4naNzbo9kXrzCLogCD
 DxnB2iLIwvLm4BoSTBcTA8Qo8TV1BhGzFlkH7VeOkH27rJlMxGdysuHZX A==;
X-CSE-ConnectionGUID: 5H/BJrNjR8SKcxwcn05V0A==
X-CSE-MsgGUID: p47Pb1fnQsKD2xagEp+n7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="57303812"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="57303812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 06:51:45 -0700
X-CSE-ConnectionGUID: Ys7DsCqTSX6x57fqnx4SvA==
X-CSE-MsgGUID: uOrHPUwgTDWsdQxaUWZSJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="157492117"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 06:51:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 06:51:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 06:51:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 06:51:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqbQ6r05aQZKXPni6bEEe9Q+c9IXYxCcTfasjpTX7jnxXab2E3Ot44vucUIJPxiTyFlrY1nJY4SlzMZD0wnnUrmV0B0v56lsdOpg2zuUsBHPM8dEI37zH0G4IO2aAwLXPxR3k55rqJ+qj42xJGRmC5LqHX2h9iPMndK0JAi68yzzel31OTtr+w+oluCehm1xK+BVTNwCHv0HG2dNvi1vSWWWcdJsr0kR9WZXa8T9swHaGj76Gk734kY/mI5SrVYqW/6915Gjnwzx/HetDOTR2jgy8j3Ll2Z1mwDdBxR+UPLm0yLDz7SGdrq1XyUEp8cYvNXkodPxYVV2RxXtPnveNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEmZPSbwQNIlxmQ/MklM5LYp0oDdSZ/5oUXHHnVTUSQ=;
 b=s5eNhLV8sjGLTeT6Nirxt8QRBeOxdXVo2yQCkT9Acqi2e7tpNiEBeie+EVvHNon63TqrrLoL1IW5VlViYxbA3e8oWa50kdNtFkO6d3hAaI+SGlliMvuyu+2SEuCGfaD5G/bY64zQg/NOKAWmtdr6OWm3xnDUbtUmdTb3gGD9/BIIlaCyKsmi/+unu2/gOVPiLGhifdJg0ywO/jSssS95NO4rIsEZ8aNY0MSEghBSjnJoSdVad4ywPD+iGNPSCUD0vcJowpcA16ZpINzFj6lPeIA0em+nsPPNd6PZbYgUe7GTBvmx6B7ViaM0uguT7V6Cdy30hp14rF/OONm30Knveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 13:51:19 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8835.026; Mon, 14 Jul 2025
 13:51:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250713112354.32032-3-peter.senna@linux.intel.com>
References: <20250713112354.32032-1-peter.senna@linux.intel.com>
 <20250713112354.32032-3-peter.senna@linux.intel.com>
Subject: Re: [PATCH v2 i-g-t 2/2] lib/igt_kmod: Add
 IGT_HOOK_POST_GPUKMOD_UNBIND
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Mon, 14 Jul 2025 10:51:15 -0300
Message-ID: <175250107521.2061.5213930877990664143@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:303:b5::13) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 10db1bb5-c83c-4233-587f-08ddc2dd82c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WENkZjN0bWV5eFBYVWJQRFd6bDFhVVVLSnRqb3N6T1Q1MFk1TXQ4VE1HZldW?=
 =?utf-8?B?N3QybWQrTFZjNjg0eVRRUzdGSTV1YmtXQ2xhK0hMSVZRamV2dW43UFZNM2FF?=
 =?utf-8?B?ZDJIM0ZkRmVtazhzZ2xEdkJQSEptYmVnYWNNUjBlR29kcXp3Qll1TnZYRHND?=
 =?utf-8?B?QnFTSDNrcW80ckRoVnpiNzFiTTJPdHgrVUtYcTJxUEw4NzBQaG95ZEd3L09l?=
 =?utf-8?B?SStTYSt3RzRQV0owcjBwM2hwWlpNS2RDcDB0TG1aMUZpSEJsaTk4ZW84TUhC?=
 =?utf-8?B?N2xBa01STEpzTHNkRE9na2JZNENSVlhvV1Y5dy96TSs0N1NMbzRzTVRObVZk?=
 =?utf-8?B?MVFKczVrY0VScUw5aVFHUTFnR25saDdOOUNrZTdjRXZ0MGxLN2FZT1huWEFP?=
 =?utf-8?B?NGVlWFNEdWZndW05MHhaOTBrUkhkVHFlcWppYXFQNWJSWWVPUDlzME9NcWJo?=
 =?utf-8?B?bklOamRvK01CMXFNcCtZRzNNQ3RjNE4wcGhNTU5TSVRRWm9IRkQrQ05ROHln?=
 =?utf-8?B?YkJLK3dad3FlU2xGT2wzbThqTFZ0em9iNmcwbVVyNkdHbUJsMnEwYit3Y2V6?=
 =?utf-8?B?YlE3MjRpV2k3cGtRMk1vK3kwU1RCdmNLNkQzY3ovM0Z5QVdNbDJ2dFc0VDhO?=
 =?utf-8?B?SFpkTnY5KzRUci9rbDBxZmMvMk1yL3Y5eUV6RlNxTWFxVVY1Q1RQU3gxeDMx?=
 =?utf-8?B?bHdXM3dNWTA5N0VRWXNoQ3pCeVlFbmQ1U25YN2d6UGY4bHdKRkZjYmJtRCtX?=
 =?utf-8?B?c2tRZUZheU9PU01yVzdTMGxlb3JnMzJpamNobGVGb0FkUFRWb09uUmhQOGM0?=
 =?utf-8?B?RkRjb2ZMRlFxUVZ3M2JvSzdXbXdHUlNWL2grR0ZYLzVsa1d6Z3FEU3I4VEdR?=
 =?utf-8?B?ZzBhelEvZXJyZ1ZudmloNVh5RERGd2dBTUZpQ3BVS0doT3RGRlBrSlVBcEZk?=
 =?utf-8?B?VGNGSDhkVzZOUzJiSUNEb2x0TFdBbWtvTmFHTlRBNHlMUHpmSGFmT085YmVy?=
 =?utf-8?B?RTVjMTlIVjYzSVVHQ1MxQ0ozTUNuWDZVSElqaE1rbjY0eU5oVEtvY1Q5alRu?=
 =?utf-8?B?WFl4N2xLaTdpbnZvQk5yNWZGeWtoNzlIOTg2eGs0TWtxRlNhNllGZGRlTUxv?=
 =?utf-8?B?V2Erb1V2ZEd2VlR6NEcwRVR0N1RFanBCYWtrYTYwdmYwejYxQi9NVTg5b0Qz?=
 =?utf-8?B?WlhSamt6YjhLcUcxMU4rdkJPVGZ1YUtMT3RBSHNaQ25qd014QUtaU09qQmNp?=
 =?utf-8?B?YVlia2hQQ1NLbGRCVjJWckJOMVV3Z3JzODVrbkhRa215K3E2OHNBOGdkNzdZ?=
 =?utf-8?B?QXRjam9pc1FPVk1mUFVSdGNJUUw2UjVMUlNmcnROOXpHbDMzK2svSjNvQ0RH?=
 =?utf-8?B?YTdFTFhWVDcxYVlOKzJHSTc1bkQ2cVZHSVd4dHFMNGJXdlhyUFEyVDg5ZFky?=
 =?utf-8?B?UE1EZmt1ekFlRHVRTTdOcHJjU1ltcUpoTzcxa0JZZVhkUWJNWStObm9FRnpS?=
 =?utf-8?B?azRsQkZMUlFVcjRjZTFPLzhBaHo3MVBXSXJEcXc2dVppSzhaMWdrMjNpdEZw?=
 =?utf-8?B?TW43S3pRYW05TTVKeHlTeU0rNS9WNzRMN29FUTl2K0hyRFgzSkhDY29RUS8v?=
 =?utf-8?B?K0txOU1Nak1MdFg2bnc2NVV6ZGJoa3V1bWpCMTBKOEVWd0FFTVo5TVF3VlhF?=
 =?utf-8?B?S2YyOHRLVU4raHUyZHdHZlViUGdlYm0rdVlMSGJIaTVBcFJIWitkMWw4VjJv?=
 =?utf-8?B?SmlQWUVHdmhEZ3haa2Y3cjRTRTdsNzUvbWJXTmsvVWNjYzBnT1RUakF0NGhN?=
 =?utf-8?B?TUpYSTRKcEhOWHVzMHJGT0NjL2pQeTgwQitJb2YxOWNDSTRpdnhVaEpoRlVj?=
 =?utf-8?B?RXRsZTk5WFpxc2lEVnVlN1orZndDSzY1STYxRk1kWm1GVHdEYVBrWU03RVAz?=
 =?utf-8?Q?zfqqFGGuUhc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWVwVUZIcnQrRkFDczlwd1g4NnRQUFBXRk9EY2ZXK2ZUT0NzcklsYXVjUE93?=
 =?utf-8?B?Z1QyeXdMY3JJSWdBWmJzOVVraFg2ZVpEMWEwT1M3ODNKcWR5RmNnZmNlVXAv?=
 =?utf-8?B?MlNBY0VJb01aZG9rb09WdGkrMjVPbk1ORmdwY0libXpKdGh3akl0dFN1SjBQ?=
 =?utf-8?B?OGJRQm1taXMzQUtrN2NUeGJIQkdkMTlhSHVrSjlIVEFSa2pzRjQ3MzFwSGR6?=
 =?utf-8?B?ODJZMG1VaGZSSjd1V0J2REc3aEsvRUFNMEgvampLVVJwSDludDBFblNKWmVw?=
 =?utf-8?B?RS9mMG1DU3RVVThGV3RqWWpKdnQrK2ZGNC92cDJoTE5TaVNZRUMvVVZVbGpQ?=
 =?utf-8?B?VWIrTWM3a1FQY0JZV3dyVnpoVzBEeUVZeVIxbldMWitVbERNZGNOZkl1dVZO?=
 =?utf-8?B?cEI2N3JKb3NUbElkY29yQVlzdWNwVUpWTWRmTlUzNnMwVFJRZlhjc0ZvcW9O?=
 =?utf-8?B?NWM3c2dnTEtSMkR2WFVoaEZ0bWVNa01CdWRyUkxCVkw4T1E5OUZsRnQ3Q0c0?=
 =?utf-8?B?ZDBZTEdkUTRadXBFYVF2c2N2NmhudjhLRlMwckdyRXNXUmFhQXlqUlYrRC9F?=
 =?utf-8?B?UWZCYnlkOGwzU1FyeGIwdTRXZXpTUDBKVkVaM3pDRGFxSHVPK1owSkRCbC8z?=
 =?utf-8?B?eGtxWjd5MVFUMUV1VnVJK2lCSENiTjNGU0ZGWUZ6YnNhUndPYktrWVluWDBu?=
 =?utf-8?B?Um4wZmdMdUZSM3Fhclgyd2tQODRleXh6czRMUW9aVTNzU01SUDEwVTgvdU1q?=
 =?utf-8?B?ZFczNjhvS2FKeHFMY3lWckV6MjF4dWdQZFlRRUVlVkRrT2Y1Y1F6dnF6ckNy?=
 =?utf-8?B?TG1rS1MyME5sSVo2YmhkVElKNnRhRVR1akZQL3hUS1BnOG1yMktzcjV1OGVU?=
 =?utf-8?B?TE1oMW5iNkVWcGw5MGFxdVNnQTAvaXptb1hYbkZmREtFS1pla0Q1ZVFkblRM?=
 =?utf-8?B?bmxPQVAxL1RXZUNtWklFRkxmOUhCVWdRazJtQS9Icmg4OGNvUEhMTDFUZzZL?=
 =?utf-8?B?UllmVGljR0U2VjN0T3pOeUFxVkFtRUJ3VWpRbDlMeTE5MzhaeVhSdFR2R2tD?=
 =?utf-8?B?NGhVbDlzV0JGMXFIWnpzUGFRZ0h2bjlyUCtxQjBpVUxDQzhNVk5EemU2dit4?=
 =?utf-8?B?T3lwWXJzMG13OUJTV3hadmJoYkU2V2t2Sm5ldkkyRzRaNzJiVWdCeHpaaTZN?=
 =?utf-8?B?d0g0VEhYcE9YOXJKbi9ud01TNS9LUUVzL0R6WXdITENGN2JMZEo2SjdMZGF4?=
 =?utf-8?B?T1pjYlM4K2RrcG8rbS9odlhXdVJ1dHNrRFlUYzJNd3ROV1pHL1pVWk9Nc21q?=
 =?utf-8?B?K05WMXNMbmdiakQ5OVpEL2NDWjBZbndVeStvcnQydVp4SVRIcy9FUVBWbGt2?=
 =?utf-8?B?dnI5Z0RPcEZQU3VnWVNaTktXR09WWk5UZG9IVWNleGVMWEgxUjU3MEpwL3N6?=
 =?utf-8?B?V1pvZ3dlMG1zcWs2eGM5MW05RHZOcUdRNjZ1em5XaHJVcXZRVVpLd2xjSURT?=
 =?utf-8?B?L2hFMVcrQzFhbEdpaFFUb3BMVmFhS2Z2UTA0QlY4TUdUUkdWNDZVVGM1bXl1?=
 =?utf-8?B?cTRoUVhqWWpXZW9ZZWQrd1haQzl1MzhGYlJQUU9Za1FrdFNUQUJtK0xyNlhU?=
 =?utf-8?B?RWd3cCtvZms4MWt5R3Q4NzZMQk9QWGgvdDV1NkFBOWQ5VldrMjc2ME9mdXE4?=
 =?utf-8?B?S3VoTk0rQ1NsTHJTN1ZuVzhDcERyOW93YklKUWk5aTVqYXlvbnJlN1pQb1lJ?=
 =?utf-8?B?Q09hSFJiYVpRa2tnMi82WGZrRFAzU2MvVmt3Yk05ZlBtYmNiMTZFam1PeE5M?=
 =?utf-8?B?VDBIVjdtWTFhYWVrY1E1eFRjWkVOSXB6WERjdlUvcmZVT240cncwRnRhMHJD?=
 =?utf-8?B?WXB4ZXl2NmNOOWNjOE94aHdJeUxQZUlSZ3k0Ukt1d3MyYVNkdjBIWlJnZ0N3?=
 =?utf-8?B?R3NPZklPODRCMDZlakZ5a3AwcmN0OC9VcFUrV3VHMStYWWplMEdhZXhKN1Bv?=
 =?utf-8?B?bzJkVzVKeHBUSDd2U0JBVnMzYjB0eGRPNEJ6VktCK0JBWll4QWVsYS9vM2t1?=
 =?utf-8?B?UU15Z2ZVbk0ya0ZIR0xZekUvM0RFL2Z6Znh6MmR4ckJ1V1k5UnFqRnJqR0FR?=
 =?utf-8?B?cDUwb1ZJei9wYU9BM1d6alhmWjFRKzMvaFluMUxsZ2hJcERubVNrdyt2Qkg4?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10db1bb5-c83c-4233-587f-08ddc2dd82c5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 13:51:19.5959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJYjZjXNRZfPgU/gCqdBJbdka0Aus2GrBmSBnE0cneYDCf1jVYr6E1r8CPc0caAtLg8eqDNQejY+UVg5eNSNcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
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

Quoting Peter Senna Tschudin (2025-07-13 08:23:54-03:00)
>Adds an igt_hook after the unbind operation of the GPU kmod intended as
>a strategice entry point for kmemleak scans.
>
>Can be used with --hook  'post-gpukmod-unbind:...'
>
>Cc: Gustavo Souza <gustavo.souza@linux.intel.com>

This email address also does not exist (I think). :-)

Also,

s/Souza/Sousa/

To be fair, we have both names in Brazil. Mine is Sousa.

>Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>---
>v2:
> - Added code ducumentation for new hook
> - Added env var IGT_HOOK_KMOD_UNBIND_MODULE_NAME and extended help text
>
> lib/igt_hook.c | 10 ++++++++++
> lib/igt_hook.h |  3 +++
> lib/igt_kmod.c |  8 ++++++++
> 3 files changed, 21 insertions(+)
>
>diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>index 8932d118d..a5a55a659 100644
>--- a/lib/igt_hook.c
>+++ b/lib/igt_hook.c
>@@ -74,6 +74,8 @@ static const char *igt_hook_evt_type_to_name(enum igt_ho=
ok_evt_type evt_type)
>                 return "post-subtest";
>         case IGT_HOOK_POST_TEST:
>                 return "post-test";
>+        case IGT_HOOK_POST_GPUKMOD_UNBIND:
>+                return "post-gpukmod-unbind";
>         case IGT_HOOK_NUM_EVENTS:
>                 break;
>         /* No "default:" case, to force a warning from -Wswitch in case w=
e miss
>@@ -335,6 +337,7 @@ static void igt_hook_update_env_vars(struct igt_hook *=
igt_hook, struct igt_hook_
>         setenv("IGT_HOOK_TEST", igt_hook->test_name, 1);
>         setenv("IGT_HOOK_SUBTEST", igt_hook->subtest_name, 1);
>         setenv("IGT_HOOK_DYN_SUBTEST", igt_hook->dyn_subtest_name, 1);
>+        setenv("IGT_HOOK_KMOD_UNBIND_MODULE_NAME", evt->target_name ?: ""=
, 1);

I think it only makes sense to set this when evt->evt_type is
IGT_HOOK_POST_GPUKMOD_UNBIND. So, we could probably do something like:

    setenv("IGT_HOOK_KMOD_UNBIND_MODULE_NAME",
           evt->evt_type =3D=3D IGT_HOOK_POST_GPUKMOD_UNBIND ? evt->target_=
name : "", 1);


>         setenv("IGT_HOOK_RESULT", evt->result ?: "", 1);
> }
>=20
>@@ -470,6 +473,9 @@ below:\n\
>                 case IGT_HOOK_POST_TEST:
>                         desc =3D "Occurs after a test case has finished."=
;
>                         break;
>+                case IGT_HOOK_POST_GPUKMOD_UNBIND:
>+                        desc =3D "Occurs after the GPU kernel module is u=
nbound from the device.";

It appears igt_kmod_unbind() is also called for "snd_hda_intel", meaning
the that hook could be potentially called for a non-gpu module. So the
hook type and description lacks a bit of precision.

I think we should either condition the call igt_hook_event_notify() for
GPU-only modules or make the hook type use a more generic name and
description (e.g. IGT_HOOK_POST_KMOD_UNBIND).

--
Gustavo Sousa

>+                        break;
>                 default:
>                         desc =3D "MISSING DESCRIPTION";
>                 }
>@@ -504,6 +510,10 @@ available to the command:\n\
>   values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post-*\=
"\n\
>   events and will be the empty string for other types of events.\n\
> \n\
>+  IGT_HOOK_KMOD_UNBIND_MODULE_NAME\n\
>+  Name of the GPU kernel module that was unbound from the device. This is=
 only\n\
>+  applicable on the `IGT_HOOK_POST_GPUKMOD_UNBIND` event and will be the =
empty\n\
>+  string for other types of events.\n\
> \n\
> Note that %s can be passed multiple times. Each descriptor is evaluated i=
n turn\n\
> when matching events and running hook commands.\n\
>diff --git a/lib/igt_hook.h b/lib/igt_hook.h
>index e9f97b79b..d80a012f4 100644
>--- a/lib/igt_hook.h
>+++ b/lib/igt_hook.h
>@@ -26,6 +26,8 @@ struct igt_hook;
>  * @IGT_HOOK_POST_SUBTEST: Occurs after the execution of a subtest..
>  * @IGT_HOOK_POST_TEST: Occurs after a test case (executable) is finished=
 with
>  * the test code.
>+ * @IGT_HOOK_POST_GPUKMOD_UNBIND: Occurs after the GPU kernel module is
>+ * unbound from the device.
>  * @IGT_HOOK_NUM_EVENTS: This is not really an event and represents the n=
umber
>  * of possible events tracked by igt_hook.
>  *
>@@ -39,6 +41,7 @@ enum igt_hook_evt_type {
>         IGT_HOOK_POST_DYN_SUBTEST,
>         IGT_HOOK_POST_SUBTEST,
>         IGT_HOOK_POST_TEST,
>+        IGT_HOOK_POST_GPUKMOD_UNBIND,
>         IGT_HOOK_NUM_EVENTS /* This must always be the last one. */
> };
>=20
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index 6d7f5705c..9b95a2288 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -41,6 +41,7 @@
> #include "igt_aux.h"
> #include "igt_core.h"
> #include "igt_debugfs.h"
>+#include "igt_hook.h"
> #include "igt_kmod.h"
> #include "igt_ktap.h"
> #include "igt_sysfs.h"
>@@ -604,6 +605,7 @@ int __igt_intel_driver_unload(char **who, const char *=
driver)
>  */
> int igt_kmod_unbind(const char *mod_name, const char *pci_device)
> {
>+        struct igt_hook *igt_hook =3D NULL;
>         char path[PATH_MAX];
>         struct dirent *de;
>         int dirlen;
>@@ -634,6 +636,12 @@ int igt_kmod_unbind(const char *mod_name, const char =
*pci_device)
>=20
>         closedir(dir);
>=20
>+        igt_hook =3D igt_core_get_igt_hook();
>+        igt_hook_event_notify(igt_hook, &(struct igt_hook_evt){
>+                .evt_type =3D IGT_HOOK_POST_GPUKMOD_UNBIND,
>+                .target_name =3D mod_name,
>+        });
>+
>         return 0;
> }
>=20
>--=20
>2.43.0
>
