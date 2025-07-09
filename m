Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78033C83F09
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 13:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C15810E7DF;
	Wed,  9 Jul 2025 13:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRaH27E9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880D910E7DF
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jul 2025 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752066101; x=1783602101;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gkxn25aFBBu07orR16X2EMIvTLWV2jQbvqZtUDtc1BM=;
 b=cRaH27E9VzCQZL6m9BmZoulQYeB6L0sQeHp2JzrciX0RslzVVU0NVr3X
 SIBl0LCc7ii82fj/CNPq9eHhwoRTw6V1P9CE6tGqOY4yqD5OOsnhsLECW
 7EHjI8u7HopzE0Q0srIrqFkJ73gv/C1tQYqIQt2tLrX7L4qFeQqaI7Cqm
 S0Y4D/ZhxEZzunIlRub68GB6sPJiP2AtG6LS+C22ZRCbPw1FVaWzdJTuI
 QcNbc2Rgfca6QX1MrW4ZeUYPzkHmGbIhdX2mHujyrZrH17VtkeUQ/ERPm
 MOj/H7FlzPF281t0kjRX10qJhJGBSgLOsPYxPVhL3WNcDLbl07eSVhDy7 A==;
X-CSE-ConnectionGUID: hsZFsrPkSBasMSCaOTHw8Q==
X-CSE-MsgGUID: 7dviMYL+Qc+f/OopByFTbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="57992110"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="57992110"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:01:41 -0700
X-CSE-ConnectionGUID: INWW/0dwQ0K4C5ovulEaiQ==
X-CSE-MsgGUID: QFbM3aNaQImFRVCovn1Kxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155856427"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:01:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:01:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 06:01:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.83) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:01:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/oghgbkQ4YcptcPc+mp4yktjXVcEOr272xrDJRdJ1V5wN4jyjVjzyEzOgthvq9wEDVZ3CtHivssqId5XmRKV9mXk8oUu3EZ8SdnO5x6XYxo9a25Ik/o5KeyvJwd3NDaCO5IwhaKY4xbHDs2fKVrYXCWX9MpZS8fLbdfz+mn/lH1uvGYPb/WoTeAzEO80VwzpZnMgb8ByQ+5ZsAlBib0hqJrjozQ3fWnnGFU66tVCD8xwApBcKGrIlrcdz53hZMZRMuC8CTYUDsIywl2oYPSHZuzPwvtGoDIhilkBgaBLi1YIV4CjUJDbmq6Z/xLJViTEjt80/TSDd2g6x5ltSjM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ml3GS1Cl+oUeqPh2LhiCW8K090T8Lm45cBTL+hW/nE=;
 b=ToaYvBYxwx76UUUGzrdku3M4X6ptrGsHmDQ8P4MQZ8VeFeTpokYeY6MSkToooexdyl2Bf2Ib6rMYO9u6JkbAmpgNq2KVvHS3KzwbH7PwNsXLCkX/tI/oisAKOkOjNzOQC81IfSWNRQgmsFXsumzioFxLcU5tjL3VGsR0EUfZHclO99nw7/6Qirsa+JCLsZMnkMCBSAyMmxn8mB/CRDUklDEnY0UOfXM8PCwl1UyYT1LKq7lpOU124GdwTDUCjdjv1logqFyNhf61gmEkhvM0mBtrOzNn8kMUGxh4M/fYdaH3ooD0HT8RI1j77YX+plElNXhoDAPw32wFcb152B45Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by CY8PR11MB6865.namprd11.prod.outlook.com
 (2603:10b6:930:5f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 13:01:19 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%7]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 13:01:19 +0000
Message-ID: <a169b687-20d1-406b-8dd9-452d7cb2c156@intel.com>
Date: Wed, 9 Jul 2025 15:01:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 5/5] intel-ci: Add symlinks for old i915 testlists
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Michal Czaplinski <michal.czaplinski@intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>
References: <20250708152808.59977-1-kamil.konieczny@linux.intel.com>
 <20250708152808.59977-6-kamil.konieczny@linux.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250708152808.59977-6-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0268.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::35) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|CY8PR11MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c4d902d-68e0-4f61-b720-08ddbee8b233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmIraTh2amUyWm91eWdDN0tvYUIvc1NMMFZpaDFFUDBrbTJ0Qi9ML0xpRnU0?=
 =?utf-8?B?LzJVU3NPaXJ6L2hmb2d4MmdHTHo3d1U4MlI4MXcxMG5FNHhqc0ptMHhtN0xw?=
 =?utf-8?B?VitrSUpPck5oOXlPRnVvT3ZzYWUvNmhvajlrMHUzVXR3MXFNeEpjTGVpejRw?=
 =?utf-8?B?ZHpjRlFoY3B3THROb1JKOFZFMURqZWR0WEJhNmZ2bE44TUViMTFRU0Ivaldq?=
 =?utf-8?B?V3orYk5pMUZHcTkwRGhQeVdVYktuUVAwcXBza2p5MGdxTTdaQVFPZHNLK2w4?=
 =?utf-8?B?T3czVHVrb0NJTXorU2FnQ0FHSkh1dEMxVjdBenUwQi9UbElNS3BVVmZjYWdW?=
 =?utf-8?B?RDJwYTN1M0VINFhYc0VyMmllTEhNVWJiWjBrbDk2Znk2TzdoZkpVL3pSWDUx?=
 =?utf-8?B?ZGVZM0FsSUt2M0Q2T3FuQlM0WGsrQlcremNOZW1iSmZYVUtqR1JCZnVaZFlq?=
 =?utf-8?B?RmFvZUxIZFR3Zm9VNk1OLzdSMmt1Sm5NQ01QUENWRzB0U2IwY2ZNM1FyQ0lX?=
 =?utf-8?B?dlF2THcyY0FVYXFPdmd4YnZISTNnR3JrSFh3QW84SXV6dUZZbFlqTzFQYnpD?=
 =?utf-8?B?MDl5QUR2VGRBL0dQci9BWnN0UzhERjYrS1NvOHhhMjhJQWJhU1Z1a1ZYeVd6?=
 =?utf-8?B?cVZobnJ4NzFUTGF1TUR2TG1TZHdBL2lBaXBURnBqUzhMR2xzNFVHYUV4N3Zw?=
 =?utf-8?B?SEZRclRCRUpUNXh0MEhySklzOEp6cFZ3ZGRqYmN2eXlRSHZuU0QzRmhsN2Vl?=
 =?utf-8?B?bVkvT0pIbVRyd2VzdDZFblZacUdwM0Q1YjVCQUxUT0dHMHkyWUZpLytBc1pi?=
 =?utf-8?B?ejEySlZrcFZmWnR6dWdYazZxcFZMN2tvY0t2TWEvcGg0Umx3Y2pnK1dITkxY?=
 =?utf-8?B?Y2hTQnJxbllRaDJMMHFhTTNXTWxaVGw3ejFZRU44cVpZRWpKVE5uZ2pibHg0?=
 =?utf-8?B?SjYyMDNtQVVrRlZUS2tWSDkzdWYvcGxJSW5QUE14MXVHcU9Ea1lndE1mT1Zh?=
 =?utf-8?B?SnJPY3cyTWU0SzZHN1RnRVBob1dPK0xKdkVQZ003YW93Nnhua0FKdXhTQ0xI?=
 =?utf-8?B?UHFQbVhHZ3poMUZHendkN0FZWXlnd2ZKUXU0SFZrR1F1RVEwS2llbXo3S0sz?=
 =?utf-8?B?U0JsandhTWdDZUprYk56L2hzQ01mdFZrQ3RGVWZKQVZnWmlicjVROG92VXI4?=
 =?utf-8?B?Q1REb1lCN01kWXgwWksrd0RGQ3k5L1dXQU9YaGFQbndBWHJOY1BVYzlUbFow?=
 =?utf-8?B?Y1piZnpvK2grQ0VuVEtVWW03K1lQeUtHRHViYnJLaE5DWDdkazVxTm1CampX?=
 =?utf-8?B?eWFwM2FXVlZUMEVxbks3dnBZNmg5K0FuVjZkS0YzM25rVFFnekp0V1E0V3R2?=
 =?utf-8?B?VGpIRHA4QlRoRGJtNHd3Y2pUM1dscGhrQ3VYMzdSYkdoU1pWMkUrRFU1OUNy?=
 =?utf-8?B?dWFveUdrWFdETHN6WWp6Wm40QitoUm9zOU1ZOUhJK3cvTHRTNWl1SWRGMkxz?=
 =?utf-8?B?bHhMaWx3RmRPVFpVUVdUREg5ZjFzTm8zSUdRMEVlWEN6K2xDQWdZVkNwR1Nn?=
 =?utf-8?B?ZEl1cHdXN0hTemRzTklIQTlLdmIzR2wrWllaYUxFdGI0RktadjJtSjNneGx6?=
 =?utf-8?B?eE1PV205cnhlTFllUDdBdmR6S21Qc1NNbWE2WS8vaUtYNG9nQjVwYU92a1p6?=
 =?utf-8?B?VTJqZzlvSENxYW9qWG8vYkNoVnRrMVcrZkNXZUgvbkJUZmlVUWNOY09qbHN3?=
 =?utf-8?B?Y3dRYlIwNHkxSlNtLzNuMDRCYzM4eFlVdlJ2a0NVSldzNS8rVzhVUVc4NDBU?=
 =?utf-8?B?NjBkbGtuWVdOUndRSExVTncyRDJOQk5IbUZaaHJSU1BZZVJNN1ZrVElDVEE4?=
 =?utf-8?B?d1B6TmNuL05OLzJuMjhOVzIxRjArUEZrczRtb0FGYjEyRkhyM05lSG93ek01?=
 =?utf-8?Q?2lbG0AP01BQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlNHSHE1ZUFjTk1iVThDTUZtZC8vR0x1T0kwWjJKUUE0dk14azVnRlpZT0Iv?=
 =?utf-8?B?VkMzOXRLbmF3SldUbEFpMWRpTUhnNER0MnpJNTI3YkZmd1dDUDdMRS9INllo?=
 =?utf-8?B?UmJSNFlUaC9vNzF4RG5DSGx5NGNjTHladkdMZW9hWlFyZ2lxM1pwVWVjRDgz?=
 =?utf-8?B?WnZ4NzNVUDVQaFVkdFl5d211SmZDRUluSUM5UVJJeVJjdXRzNmwxNE9hZ2ZU?=
 =?utf-8?B?aW9jQ0NPbDhHMWtGb2RzQ0lsSW50ZW1LaS9NNlFob3ZHb05La0l0aFdzMVl6?=
 =?utf-8?B?ejRORy9SRmZKZHFHUjJIQ25RWEgvdGUxaUt4UFpNbkdmQ1ljSlJlTUpDT1ZP?=
 =?utf-8?B?WDJKVEpLSVJLYkd1K1h3R2N0WDJLMkxxSzdia2M5YkJ5MDFDb2hSTWR4amFO?=
 =?utf-8?B?bGI3ZFlEbHBwYm5reWUrOWN6ZTR0OG5jR20rcjF3NG02dlZHT0Nzc3loaTdC?=
 =?utf-8?B?WUswOXoyczE1emVXQjQyaDJQdWY2Y1B5K1cxUVVIbHYxUE5saDZWQlVTblBS?=
 =?utf-8?B?a3VydjU1SmMxemdPaWhMRGVNY09tYlY0ejF0cmRUelltdThIYjlFSmgybDZY?=
 =?utf-8?B?YXU5U1Y3ZFhCamdpMDc5YitNKzZiTGtjbU52YjlIa085UUt6WHEvQVg4elhK?=
 =?utf-8?B?UHNJd2tuZzRzdWRJUjhFQ1VLenBqOHRaWUFGN0daWEhXSGdyVTdjblZicmtE?=
 =?utf-8?B?ZXlQZ0NsSllCN2p0Q1hpcU83T0RZbEYrc1BoWXMycjczdy9PcWdmVUdpcFhZ?=
 =?utf-8?B?bW9VVDlLaHdIekFWNGlhOHpRVXFoQ2c1K0hzazBUQXYvTmtzNlZkZUdScUgz?=
 =?utf-8?B?aVJwTG5XNVNicmw4ODJsTWZOZWd5dWt2dVJJWVUvNkM2cTdDMnNCVWp4VUFv?=
 =?utf-8?B?R0ZOcnR4eFBOdk50M251R0EwWkwxWHltQ29NTzBybEdPTFZzenhtTHBiem4y?=
 =?utf-8?B?SEhERDBPbkhXc0pQM0hNS2JXNnlCeDl6Yy8weGJjMUhJdDdiSUhEOStWWVU0?=
 =?utf-8?B?Q0wvN3hSOHFLOUJRWG9HV0paSGVHdWF1bU5qanhkVVlQc1BUTkc2UisveXox?=
 =?utf-8?B?T0ZDYUx4a3gyWFlVd0drZ211cTdqc2t0eTZmQkRwWmdXZHNOSWJVdGMrQStE?=
 =?utf-8?B?V3RIZ1NBQk1iQWFROW1CN0tiNXQ4ZVdYSGZ2ODdkVjA1ZCtoMTRLYTgzNTh0?=
 =?utf-8?B?WGY5a0xyUzJSTTlQT3hKMHlZclFrSU8ycGpkOUxIbXNIM1pxbWJqM2NrWkly?=
 =?utf-8?B?WFlvQitYWkxsSXdZdmJGakZiRzhGc0VtcnBvaVZYTjc1aU9VSlZwZ05kbm1L?=
 =?utf-8?B?d0VJMU9aU0ZsKzY5SndSQUlGbC84ejJCTmRQUGx1dVkrRHcyaGdLM1h1dk5m?=
 =?utf-8?B?bmtBMDNLVERWNjFYVzZlRzJadTBTWHpJREJNbFBncUJxWHIyN21FWkdqNGtG?=
 =?utf-8?B?a2ZGV1JoT3VLa3JSUjQzVTFTRDh5bkcwVnc0c1dsK1lpa0xvNFVnR3FqTHVM?=
 =?utf-8?B?ZWEwMjA4ZEFPSk1yUmtaa3JydnQ2aEZWTHdaaVNtZXFHWUkvd0krVDNURjVz?=
 =?utf-8?B?M0tFVzFzR29HNzFlQTIyTDlYK0I4aWZhK3B3WVIvWUtBMW1weUhubk1IVmsy?=
 =?utf-8?B?UDZPYmw4blJ0R1NuSmRHNjJsaVZOTGlTaU9GV1phZVVEcGdXMndhRTVmcWhu?=
 =?utf-8?B?Rkh6VTlSMHVtVlZjU1Z5Y1JGcmVpeHIvL25XdEUyQTVjdjFWOW4wVnVJYklY?=
 =?utf-8?B?Szl0cGhKV0ltbFJncjJZM1pUbzBLVGJ4WnlJYzV6NEtuUGVNMnVlVUtrM2lB?=
 =?utf-8?B?UGU2UFJhbHhTOWd1cGNlYzhGYXZWdzRiYVJRTEcweW02d01ldHQ3WVQrQVpj?=
 =?utf-8?B?cVZ5ZGl4NTM5eXpJaDdvWTFHZHd5L0UvcWxOYWhHQ3c1Zmc2WGZJM2luZUE0?=
 =?utf-8?B?cGVqa2pWVXRiUlRFSlBSM3V6U2ordVFUSDFOeWJidWhQQ3cwMk1oN0FOS05F?=
 =?utf-8?B?S216MXVibE9RT3BlYlVUTkFKcWxoRS9GUU1FeUdUSG5jOVZKZ0xyM0pvSWEr?=
 =?utf-8?B?ZVk2ODVaNG1iRXpkN252OElYSVE4RGJHRW9WYU0vMEcrVk9ycmJuNUgyNHdo?=
 =?utf-8?Q?w+QsOqLFT+/rY+Tz5MeXoi0Cm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4d902d-68e0-4f61-b720-08ddbee8b233
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 13:01:18.9655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlzMj49Fc+rrTIZm35R3G+kU9bTXIfqiwQOaNsQSUDKo7GogX5gAx8x0/TpvpkE55AUJNPJzaClAOn5Qb3EJMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
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


W dniu 08.07.2025 o 17:28, Kamil Konieczny pisze:
> Add symlinks for i915 testlists to make transition easier.
>
> v4: use 'i915.' prefix for fast-feedback (Swati)
>
> Cc: Michal Czaplinski <michal.czaplinski@intel.com>
> Suggested-by: Ryszard Knop <ryszard.knop@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards

Andrzej



> ---
>   tests/intel-ci/chamelium-only.testlist               | 1 +
>   tests/intel-ci/fast-feedback-chamelium-only.testlist | 1 +
>   tests/intel-ci/fast-feedback.testlist                | 1 +
>   3 files changed, 3 insertions(+)
>   create mode 120000 tests/intel-ci/chamelium-only.testlist
>   create mode 120000 tests/intel-ci/fast-feedback-chamelium-only.testlist
>   create mode 120000 tests/intel-ci/fast-feedback.testlist
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> new file mode 120000
> index 000000000..3715a9469
> --- /dev/null
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -0,0 +1 @@
> +i915.chamelium-only.testlist
> \ No newline at end of file
> diff --git a/tests/intel-ci/fast-feedback-chamelium-only.testlist b/tests/intel-ci/fast-feedback-chamelium-only.testlist
> new file mode 120000
> index 000000000..44d83f366
> --- /dev/null
> +++ b/tests/intel-ci/fast-feedback-chamelium-only.testlist
> @@ -0,0 +1 @@
> +i915.fast-feedback-chamelium-only.testlist
> \ No newline at end of file
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> new file mode 120000
> index 000000000..88e9d80e0
> --- /dev/null
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -0,0 +1 @@
> +i915.fast-feedback.testlist
> \ No newline at end of file
