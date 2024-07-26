Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70792C3DA49
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 12:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF1910E0E8;
	Fri, 26 Jul 2024 12:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvF0HImI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FF310E0E8
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721996274; x=1753532274;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=97zSr2vW+hUcT70MYJokA+XcT+h7oNHmYb6BRfZtpJ0=;
 b=BvF0HImIFS8KfXJ+X3SoAKxEnTKCHXhRN6NCKszQMSXSkQPdvcw2ag55
 rZnflnvGQU4UIrnFWiTHvorTCQ2IJi9VfnMCXCHQgg+EJ3eWRM8rXba1a
 XUqv68fAOLWQ0TBduDNkqQ07Yro7WKy6PrETCxA+5mJOTsT7o72ynKgvR
 sNosJgoslxwVQYKeaTzoN/hE+HR993x66GW8jP56GaiJL+w33F70HTl8r
 +rsQRLbk29LqOgFoYTHf5jtqPwR0dw1DvT3998U7+C+1iipNktcDUda3I
 TH+uQOhgvm+SJ9tRmrU/CuOaRbOrJOq5+qNUu4MNjLjPaMlhfjvZOJ0rC g==;
X-CSE-ConnectionGUID: OCEmwp1UQ8ur5mBsb9wSjg==
X-CSE-MsgGUID: mx6QvpWBTZaWCm0tXr9ASA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19915785"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19915785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 05:17:54 -0700
X-CSE-ConnectionGUID: /73UtKELTBSng5w0L4q7uQ==
X-CSE-MsgGUID: zTvrQk6pQCGxKOTZfvDZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57400959"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 05:17:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 05:17:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 05:17:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 05:17:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3BUgMkFhju/z4JGwzvFGZ15j0i0FpEiRlJ0rQgZ5RAniKmSA1QxBEK/wnSzcF5OmrYt7SMUOdpoR8baI1O8QgEYz9/pnr9GftTKH3YYq0hqgQaoDpf2bAJuOTkeJGlDmH2oesynFDjD63e5m9rBk1bLBs2QUrMZLVt2mz1QbfCTx2JIJ2Gy96x87YhwM9/78m1ZFM3cp/ouzrlckvqmA6rRI/Mm6Tt/L3r+0iUdrbZzqEkt1WUKXP+WZxc8a/nJHjZWDRwI1sRx+GEvHHP8RFaOZ3hmAtyUeQ0R0vACVeqPEzKNWaMgpcKwYLujzqpfLGBptKqfLvMdsR1kyl1Uhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJWkvuRSCq6VA5M2Pi2+Zr4soPLhQK8/zIAhCeewyW8=;
 b=McYfmqmjdsRmDZddTK5hsegSKvMAfynU+/BwOdrcO0hHe2dCGk90Ua9uceO5BSP42AQcSB/02VawvxVPAfU8jR4KRro82AZ8GZF0xe65FA7/ugpqDvwPqwFdywzldhduKVrjooVpvyfNPoWYj9JawhcamLIiS7CRANrdfGFWKkYhxQphOCsnqVVar7ffgNx8NnPIRd9o/M0evQqzgS2kaHGesOfJnnBQURmM4mB3ifJ+CfbsSOJF5b/e7hKDVQQ+dKtPAxJ2tDANms3jlrrkSx42CrZpzMDOLkVvd0IG7mpjtZlKl2sxaTd9oVx4lATfko93EcMxzqN1tBGC/WLsSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 26 Jul
 2024 12:17:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 12:17:50 +0000
Date: Fri, 26 Jul 2024 12:16:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v3] tests/intel/xe_vm: Add test for 64k page corners
Message-ID: <ZqOTu8pgoy6in4ou@DUT025-TGLU.fm.intel.com>
References: <20240725184538.1938050-1-matthew.brost@intel.com>
 <20240726090248.ot2eujrklooz2uhx@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240726090248.ot2eujrklooz2uhx@zkempczy-mobl2>
X-ClientProxiedBy: SJ0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4811:EE_
X-MS-Office365-Filtering-Correlation-Id: ace5918d-f7a3-4e0e-e1e1-08dcad6cf78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cS9sS3Z3VHZ4MktpWWI5VE5VYk1uRzNDd3hsbFQ5Ukc0Wjk4Y0dxUTVMYkRo?=
 =?utf-8?B?UDlkQVRCWlJHeW8vU1ZacjRQNis1RjBMUWRtQWdHZ0ppaTRaNkhCOVRQUW9F?=
 =?utf-8?B?L1RYcmduRGttRDlLNjZmNXVuQzhWTCtpQmFJdDRsL0gvR0RUNUN0OW53aVU0?=
 =?utf-8?B?TFFINkxkbDk3cUZKYSt0L2VDT2NqNFRocWJCZXNUY0pTV2cxd3RLcnYyL3FD?=
 =?utf-8?B?YitFSkhTMG5DZ2VyQ3ZsQ25VT2gzKy8ycEhvK3REMFlLd1MyZFh4MVFmK05K?=
 =?utf-8?B?S3BHTk1GKzVza2tpYzREdFdyY2tyeS9TNUZ2ajhwZldtczVKUC9NQ25kQ1U1?=
 =?utf-8?B?aGx4WGZwMW15MnA3NTVXVXhwalBSOHorWXRYTFJWMGpLSHZ3aFFoeEhTRGZR?=
 =?utf-8?B?cmZ3cDhTNzlib2FmcjZkaXY4MlNtclYvRC9EMTNBaVo5TjJUcEJrZUJHOVBB?=
 =?utf-8?B?Zk1zVGF5Z01yQ2RFaEJpTnNKT0xTME1GK2RhZW5kKzlCT2dJSnIzUVBHM1lq?=
 =?utf-8?B?WnZ4b0JoUVhOYkU5cUd1N1FUY00weGwzQVJsaHBLUmhsejNzVkxmeHIzK0VP?=
 =?utf-8?B?dDBLcnBhM1RuSWVjNjhNWXVmcXRoK0MvVjF4cG9YVXRUMG83Zk1TT2xMZGN0?=
 =?utf-8?B?REJ0a0lEdXdWY3VkVnkrblpmSkl2RWkwcnJLOVU2T0p6alBpUDllZlNWbWJ1?=
 =?utf-8?B?OVhGWlliRGRvdFFHQUxadVJEa0sxQ2NlTEJWV2QvaVk0V0YyaGxMbmxESXE3?=
 =?utf-8?B?NGorVnpueWNKbUlkM3RpelRKVWJpYXc0QlMydXIwbE9vMFRKejFybTlZTWVN?=
 =?utf-8?B?emIxdGZTbkRuZ3RxRENMeXV0QmFzQTlpQ1Z2R2JkdDJDekcrTGY5Y3R6eHRD?=
 =?utf-8?B?OCs2Nnh2YTFLeFU2M3VxWWU0dXZtVkVJV1VpN0lVUmFLYTFyeUh2ZkJwYmVx?=
 =?utf-8?B?THdhaVI1NFNnWXV5dlp1Zkw3QWxuaGZTaVN3aVdOeU9IRVdvOExWNSs3b3FB?=
 =?utf-8?B?NmRSbWxlRVNoaWphQ3Y1U1BGdUVXUEoxWndvTUFwUGRPZDZKZGlCQVNrYy9Z?=
 =?utf-8?B?OXRNQkVsQnZpd3RzQmRYb0pUWFRSYzlPUlBlL2tjckY2ZTlIQkhOV09JUXRs?=
 =?utf-8?B?MzI2ajcxWE1PcnorSFRhZFpsMHYzUmN2aCtvT2k3RjBoZVArbG84MXBqaDQx?=
 =?utf-8?B?amVtbUZpVlpsQ2dPK2UvM1l0SXlVLzlUcDNQaUFWT2JhM2ZielhBSllqRWxn?=
 =?utf-8?B?T1ZqMW1vYVhDS082RjFESksvVkNJS3FwL0kyd212SFlOZ2k1MDVJdk8waVo4?=
 =?utf-8?B?L2R2SGNZYUgwNFpUbkxaUFd4NGtJM3c0Rm5XTEE0T2p0QWpYM2FQMXRPMFQ0?=
 =?utf-8?B?cnRWZ0ZBR2d2QUdUSEYweVZMNWZyQXREWU5QYnZGNklxZGptb3l4Zkt3c3Vw?=
 =?utf-8?B?TS8zLzNETDNSd1ZUcjFhbUxQb1JKVk5XV1hVeG02eDZrRmNIZEN6UnJEa25X?=
 =?utf-8?B?RTh6ZkdFWStqYVVmSGk0ZW9hTXFlS0I3OENCYkIxRncwRElkNVpFbUwyQWd1?=
 =?utf-8?B?SWtLV2haUldFRm1JR1A4WVcwcDFRVXZVS0IxcUtIOC81TGNjYlJpeGFPMjNM?=
 =?utf-8?B?YlZLQk9mNSt1bTRjWjdQYjFoZzFZY2JQYUxVTlBLeEdiNyt2WXEwU1hUelNm?=
 =?utf-8?B?L3RQS1V4VkJkcGRxVFVsSkowR1h2TDNpTnRIQ2lFRElFS011cmR3NDgyWC93?=
 =?utf-8?B?bWw5UU5hdVNROXNvdmlIN0V5YkdGZmtPVmxVa0FGSDBidWVEUFduTWJVb0dQ?=
 =?utf-8?B?WVdVKy9QMzQ0R2JlVytQQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjEzT3NYdVZNRDhqcVUvNHp4bjFiQ2gxZEhPSVo4a3VPRm0rYXZEQW9JaE9x?=
 =?utf-8?B?MTJVYURDY0lacWRKSExKcDhER3p3YTNISUR3ZXdZZ2ova3BIWngyaWwyWkFW?=
 =?utf-8?B?dElYS0lSZm92d3BBY2xYeGlYZmM2eVFOS3NFM29FQndwSWxIZW91TnpoUkh5?=
 =?utf-8?B?ZWc5OEdETzJ4QVlsOEdxRjlEM2JSSjJFK2t6NWsxWGJIRis1VXBheS9CUTVK?=
 =?utf-8?B?SG9vU3kzQ3J4M0pvTHZ1UGRBRmo1YjFoeU50ZlFJTnBTbXVWa0RtNEpxVWFI?=
 =?utf-8?B?dWZ6MWhVTGcrU0ovVWZ5d0ZxZDNjU3FnUklQRVR3Z1FTUnhQQzRpSStIWFhn?=
 =?utf-8?B?WTExdW9BL0pxTGVuMmU5em5LKzhZVVpZK04zeC9XMUlaVXRMdlZLRkZXY2Vw?=
 =?utf-8?B?ZGRaYzMwOGZQWkY5cVd0Q2Z2UkJiMjdraVVUZjRFL0tNK09pMFQrNjFZa3k0?=
 =?utf-8?B?WEZ4VE9lV1BKRmxBMW51RnZYdTZjYkUydkV6NGR3bkFNc0JwWFpRWHB6ZGVs?=
 =?utf-8?B?aDlJbWdnZHdUdU5EZVVzZmZkdWkzcWVvbElYRWtvY3NWTkEvam13NWF3WUhh?=
 =?utf-8?B?N0ZKTXFTSjBSZzQ4eVJFUXcraEpjMEowYzdHNXJoVllhL0oyOHVyUEdrQnJY?=
 =?utf-8?B?dXNDT3ZHSDd4ZmozWXpoNjRzK3l1UlNIeEppNFRMWUVVdzg0QmEvbURhQVVK?=
 =?utf-8?B?a1pOOHNMTm9ERnZtUnFnbmppZUp1NFlKRm9Eejg2TVEvOTR5UmlZZDZkaTJl?=
 =?utf-8?B?cGNVZUY3bE02a25iZ0cyR09HbVJzV3RWbm1NNFFlQTgyakNQNExnOWFXNEYv?=
 =?utf-8?B?dUE3Y0NaTmlGOGRoeUVJZklJRjI0MzZhY0dwcGNMQ0NNZkltVWVPVDM0ZXFx?=
 =?utf-8?B?NFB0UzFiSm9LSWl6NUJsWlcxQUdEdFdXUlFLTkFCbjJOOUlHdzlTNXZjaDNF?=
 =?utf-8?B?V0wweGtneGFmank1a0I5Wk1FVVNzNldlTDdpMEJqT3NRNVNCTW9mdTlaMXZs?=
 =?utf-8?B?R0F4NmNXdGZSbUp3RWJUOWNWeXh3TFlaODlHdVUvaWlibjZ5dk1IeE1Lcy9S?=
 =?utf-8?B?UUFoNmVQZG9VaitwVDBWM0ZvclNqZU16WUFjSmZqVTdtRkEyZmlEWEFkNFlH?=
 =?utf-8?B?QnFMbE9GcUVMdkdEV1lPRG5WR1lBQUN2UFdsL0FQZDlDdndMV0JVTDBaNXZP?=
 =?utf-8?B?RXdWSmRaM0dmdmJFQ1Q5Yk9odmFrUGJtWXlTN0xLMFlyNUE3L0VISkszYUQz?=
 =?utf-8?B?eGU0bmFHZCs0Y3ZtYkw1OUlKQWEyb1d3NkU5QVRjbWQ3QUE1VFhlNndSZkRm?=
 =?utf-8?B?UUVrV2EzcVU4eTNFUzNIRGhIeFhCRDMzd01FcG5JUWpQWDVvVUNCdXFDZXFW?=
 =?utf-8?B?K1hONWlhRGJoWDQrTWN0K0czZUh1U3JIU0RuUnhxQU5veWw4SWVvR29McnQ0?=
 =?utf-8?B?Ni8xZG84akZJNkdlTVBjY3Y4a0syenNqZGVtZ1pENnVlTFROWHI4WTR3TGpT?=
 =?utf-8?B?VVBJNUtVR1RycENHNDNLS2NreDNiUlQvNzZ5OWw4MDMxdTgwY1VtSGo1eUg5?=
 =?utf-8?B?RVhqdVJuU3p0VE1kMlRsdHNlcnk0MGJiaDJHS0pyRUttUUJPbkQzelVFOWdl?=
 =?utf-8?B?N09hYlNWcVpSc25iVkYxZFZvY1VNNmEzN01sMUFEQ2dsSktMbisvem9OZTVv?=
 =?utf-8?B?VHpLcGVrVWxWbithd2ZneHowemhSQjNHa3RtQU1SaktwZ3VSb3BSYlcyZ1Nh?=
 =?utf-8?B?RG5LVnZqMHFJRTVPVGJEWmNDOGVja0dJSDBEcDJGK2JTeTVXNERmYWwxWmgv?=
 =?utf-8?B?TXBoaENubTJkTjN0VkpMajBGZXBRY0JOTmwveW5OZFpYZWd0bDRnN0t6bC9M?=
 =?utf-8?B?T3BUYXhNOW5NaFFqRlRVenhld0dwZ3NzSC9LalJ1cUpXdVZRaURrUVBHbVBS?=
 =?utf-8?B?a1FMVG5PRjUySm5MVDc4WS9na05kbWZBRjFycFFkdGlpejVXdTNpSk55eTJw?=
 =?utf-8?B?d3o0WHdseExLd3RYM3orM29Obmo5Mm8zRWRMYTUrcjBEaHVJRHNYa0Q1SGRt?=
 =?utf-8?B?WDdtc3pSTUY2WTMxK29zWVFRNG9hODZ5VWZ4Rm1ZdmlLT2VWTHRzWXMwUmVv?=
 =?utf-8?B?eUNpUkV6UnU5TGlrVUZJcXUxbEVXZHptZnh0RTJ0aUxENERZd28vUUEwS0U5?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ace5918d-f7a3-4e0e-e1e1-08dcad6cf78a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 12:17:50.1768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmUAfL4PS4phhwf0sXSLnuWATK72M7rAZyEFScNoFgke5kPX/p0/+Xi5yghBNugwGf4HsUyGrk4eoJPAzxDOlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4811
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

On Fri, Jul 26, 2024 at 11:04:25AM +0200, Zbigniew Kempczyński wrote:
> On Thu, Jul 25, 2024 at 11:45:38AM -0700, Matthew Brost wrote:
> > Add sections which splits 64k pages in 4k pages or splits compact 64k in
> > 64k pages.
> > 
> > v2:
> >  - Use SZ_* (Zbigniew)
> >  - Remove clock block (Zbigniew)
> >  - Update commit message / comments
> > v3:
> >  - Send correct version
> > 
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  tests/intel/xe_vm.c | 125 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 125 insertions(+)
> > 
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index a4f6c7a0b4..f41c6aca53 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -366,6 +366,125 @@ static void userptr_invalid(int fd)
> >  	xe_vm_destroy(fd, vm);
> >  }
> >  
> > +/**
> > + * SUBTEST: compact-64k-pages
> > + * Description:
> > + *	Take corner cases related to compact and 64k pages
> > + * Functionality: bind
> > + * Test category: functionality test
> > + */
> > +static void compact_64k_pages(int fd, struct drm_xe_engine_class_instance *eci)
> > +{
> > +	size_t page_size = xe_get_default_alignment(fd);
> > +	uint64_t addr0 = 0x10000000ull, addr1;
> > +	uint32_t vm;
> > +	uint32_t bo0, bo1;
> > +	uint32_t exec_queue;
> > +	void *ptr0, *ptr1;
> > +	struct drm_xe_sync sync[2] = {
> > +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > +	};
> > +	struct {
> > +		uint32_t batch[16];
> > +		uint64_t pad;
> > +		uint32_t data;
> > +	} *data = NULL;
> > +	struct drm_xe_exec exec = {
> > +		.num_batch_buffer = 1,
> > +		.num_syncs = 2,
> > +		.syncs = to_user_pointer(sync),
> > +	};
> > +	uint64_t batch_offset;
> > +	uint64_t batch_addr;
> > +	uint64_t sdi_offset;
> > +	uint64_t sdi_addr;
> > +	int b = 0;
> > +
> > +	vm = xe_vm_create(fd, 0, 0);
> > +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> > +
> > +	bo0 = xe_bo_create(fd, vm, SZ_8M,
> > +			   vram_if_possible(fd, eci->gt_id),
> > +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	ptr0 = xe_bo_map(fd, bo0, SZ_8M);
> > +
> > +	bo1 = xe_bo_create(fd, vm, SZ_8M / 2,
> > +			   vram_if_possible(fd, eci->gt_id),
> > +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	ptr1 = xe_bo_map(fd, bo1, SZ_8M / 2);
> > +
> > +	sync[0].handle = syncobj_create(fd, 0);
> > +	if (page_size == SZ_4K) {
> > +		/* Setup mapping to split a 64k PTE in cache */
> > +		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, SZ_64K, 0, 0);
> > +
> > +		addr1 = addr0 + (SZ_64K / 2);
> > +		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, SZ_64K / 2,
> > +				 sync, 1);
> > +	} else if (page_size == SZ_64K) {
> > +		addr0 += page_size;
> > +
> > +		/* Setup mapping to split compact 64k pages */
> > +		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, SZ_8M, 0, 0);
> > +
> > +		addr1 = addr0 + (SZ_8M / 4);
> > +		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, SZ_8M / 2,
> > +				 sync, 1);
> > +	}
> > +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > +
> > +	/* Verify 1st and 2nd mappings working */
> > +	batch_offset = (char *)&data[0].batch - (char *)data;
> > +	batch_addr = addr0 + batch_offset;
> > +	sdi_offset = (char *)&data[0].data - (char *)data;
> > +	sdi_addr = addr0 + sdi_offset;
> > +	data = ptr0;
> > +
> > +	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > +	data[0].batch[b++] = sdi_addr;
> > +	data[0].batch[b++] = sdi_addr >> 32;
> > +	data[0].batch[b++] = 0xc0ffee;
> > +
> > +	sdi_addr = addr1 + sdi_offset;
> > +	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > +	data[0].batch[b++] = sdi_addr;
> > +	data[0].batch[b++] = sdi_addr >> 32;
> > +	data[0].batch[b++] = 0xc0ffee;
> > +
> > +	data[0].batch[b++] = MI_BATCH_BUFFER_END;
> > +	igt_assert(b <= ARRAY_SIZE(data[0].batch));
> > +
> > +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > +	sync[1].handle = syncobj_create(fd, 0);
> > +	exec.exec_queue_id = exec_queue;
> > +	exec.address = batch_addr;
> > +	xe_exec(fd, &exec);
> > +
> > +	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0,
> > +				NULL));
> 
> This will fit in same line ase syncobj_wait() below.
> 

No, you need to wait here the exec to signal before checking the data
and unbinding.

> > +	igt_assert_eq(data[0].data, 0xc0ffee);
> > +	data = ptr1;
> > +	igt_assert_eq(data[0].data, 0xc0ffee);
> > +
> > +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > +	syncobj_reset(fd, &sync[0].handle, 1);
> > +	xe_vm_unbind_all_async(fd, vm, 0, bo0, 0, 0);
> > +	xe_vm_unbind_all_async(fd, vm, 0, bo1, sync, 1);
> > +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));

This waits on the unbinds.

> > +
> > +	xe_exec_queue_destroy(fd, exec_queue);
> > +	syncobj_destroy(fd, sync[0].handle);
> > +	syncobj_destroy(fd, sync[1].handle);
> > +	munmap(ptr0, SZ_8M);
> > +	munmap(ptr1, SZ_8M / 2);
> > +	gem_close(fd, bo0);
> > +	gem_close(fd, bo1);
> > +	xe_vm_destroy(fd, vm);
> > +}
> > +
> >  /**
> >   * SUBTEST: shared-%s-page
> >   * Description: Test shared arg[1] page
> > @@ -1973,6 +2092,12 @@ igt_main
> >  	igt_subtest("bind-flag-invalid")
> >  		bind_flag_invalid(fd);
> >  
> > +	igt_subtest("compact-64k-pages")
> > +		xe_for_each_engine(fd, hwe) {
> > +			compact_64k_pages(fd, hwe);
> > +			break;
> > +		}
> > +
> >  	igt_subtest("shared-pte-page")
> >  		xe_for_each_engine(fd, hwe)
> >  			shared_pte_page(fd, hwe, 4,
> > -- 
> > 2.34.1
> > 
> 
> Regardless addressing nit above:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 

Thanks.

Matt

> --
> Zbigniew
