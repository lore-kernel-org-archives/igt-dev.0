Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08784C83F25
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 10:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CFC10E4CC;
	Mon, 21 Jul 2025 10:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MPIx2V7t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2181B10E4CC
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753092348; x=1784628348;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bkOuw3RfsLyGtmfKVNg1MGpistUVdStboWMSdddIyLk=;
 b=MPIx2V7tjCaUVWZW1dOjk14TzYS5VJNjLhLsqdeWO3Td2KiLHzw00bHj
 3wntKWZBwbhWznWTxqaG2L8l8FwR61byMCEZXH1ggOGd8xBjIRL17eDzL
 x/hy1LO97p8sTEgFwabt5fqqvWQuMUFubU2KeUrdMIdPqxj5h+6BA8sQe
 Z00MAmwQUmytkbj4s0QOOVrIl6bIy36eDQRTPFvv8dMpP1/Yv3FEq6/tF
 EDP+tTPk4ePnMmJofvfdxkCrzfrpBF5w/g6X2nRuC/IFO/yQ98zIirKLO
 cnjP1MrvfDO0z3cu4QqbGg3AF1sdNtT5IguWFvS9Bp9bKzBjAAvzwXIVp A==;
X-CSE-ConnectionGUID: hJ+r1apiRbaHwxl8l53izQ==
X-CSE-MsgGUID: VjRPFkOFSJSth8rRo2Qw2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55183554"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="55183554"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 03:05:47 -0700
X-CSE-ConnectionGUID: xMiMIP/1SwuV5D4KoiRKPQ==
X-CSE-MsgGUID: F8yxqShATOy7XcQwpwOWWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="158568614"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 03:05:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 03:05:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 03:05:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 03:05:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfoDGs0m2ohwenqy5ZxmUHpdHdOJtx2nmd9zRMimQPDmI+VFry3q6kJ8haItxPzFzgDHRgS9GwWe4QHdK7xevJWxD7WcqrMf3MI7mDXmejk9T82ns/LG8jJFCK9VMv4Fg8dy2QxNZTDmN87kRljrVFz3BmjnuHMlXPTlhGX9pTaJV3lfDmd9CY5c7FDhFsGdpLc3Dp7yNrkbyBzCnOomy/lSRebdY7x9h5TMB7L+wO2qSYRu7iWKWcLp2ZL2HDJNPV9/KR+GPB5n0oLCxjDGWFzdIEbkcrwO2JHOR0fiWeaMtFbYWUo6txqnigrVay8eCDfh0VVDx/aDNxtgssQWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbQS4k07bI2h53L5OK40CsoIX5jSlY/elz6txAFWEaw=;
 b=NWRMw8TSre7wOtgzLb3fPp/0Qf+VCfAVYLIiwdLKp7t+bYyWZSmBdzWOOq14VNQwzPJXJLWnCwS5gpbcmC53wq6DW0MaIerPEW+gN2FqLXtKFlz8Xu0KS0ab9o7ctZEFTfDfeBOg+k7kdOvwmWizzKyEw7ia7PJaXroWjqcIERGoENAjGVpGRfQGaqqovYq68WIO8Epfk4V7sdk/hNdruzyo2s+1kwCFtfCzjzXY8W+8Z3r8Uj9uz/q0ZVr6A6Qu94VPIirRW1Vv/cX8sbCIn2vPC12/6XsLdDEaxc79yRc3lClvq3GlBIcYOaHLDaIz/NP5EhGw902KwPGzBkDMXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 10:05:30 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8943.028; Mon, 21 Jul 2025
 10:05:30 +0000
Date: Mon, 21 Jul 2025 12:05:27 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <marcin.bernatowicz@linux.intel.com>,
 <michal.wajdeczko@intel.com>, <michal.winiarski@intel.com>,
 <satyanarayana.k.v.p@intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>
Subject: Re: [PATCH i-g-t 1/4] lib/igt_sriov_device: Add helper to iterate
 over enabled VFs
Message-ID: <20250721100527.b4c75dlytgcqiv3s@intel.com>
References: <20250717090812.28628-1-lukasz.laguna@intel.com>
 <20250717090812.28628-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717090812.28628-2-lukasz.laguna@intel.com>
X-ClientProxiedBy: DUZPR01CA0236.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::15) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: a52b42ec-c6d5-4360-5a81-08ddc83e1f89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHdZN01SZkp4b243Q0JscG0wUnNrWjF5QmZUamlVUUJVSXl4eTU5eHl2UGFz?=
 =?utf-8?B?WEZ4SmowUDg2SzgvQUhXbW8yZDlPaWNXWDlXU25iWEs3OW9JMWRkc1lXRGhi?=
 =?utf-8?B?Q1gwbmJ5Nmp5NitvakxkMk5XNjdta2lQaEs4YmN3clIwa0svSVJGV1c0eGFW?=
 =?utf-8?B?aW5ZbDRyUUZSZkl1V2lRTyt2TWNXVFlLWDJhQldLMXdPblkyY2QrdWpvazJD?=
 =?utf-8?B?aXlORkVQbHRtd2xnc1FrdGRsdnpCV1M5dnJTOUoveUk5ZWNqT28yYkF3RHBq?=
 =?utf-8?B?S2lPZkJWeUI0bmJrZnJnMW1aWFdMNzRTRFBhWjJ0ZDF5aVJCOGY4NjE4REFr?=
 =?utf-8?B?QTV2YXFLWlRRVkhabTdKM3dKSm5oT2VSUkY1VGdxZnh1cVU2bktrNTZRUktH?=
 =?utf-8?B?Q3ZPMFp6Wk8vdXdMSitHRzluRkE5UTlIY3FJYkNhZWVmam1HaG90SjhGV2RL?=
 =?utf-8?B?MW5KWHhTa0c5eEkvSXJRTmlPT2craUlCRUZoZlRRU3dudlBPcmdlclBackNZ?=
 =?utf-8?B?MnBrbGtwN241MEZrM3dweENXcHQ0OWNnYlZIVkl1azl1V1l3aE42NzZZOUhy?=
 =?utf-8?B?L2NHZTFDRmlteFE5eXlKTHEzeGpkM1VqbXUzL1JUMFR6YlRvTXJiSmlYdlIy?=
 =?utf-8?B?MHhqTXZrZHhvU2ljMHlBRlRVb2d0Sk04TVRTUWZLTGRQR0lldEYwS2c0LzNE?=
 =?utf-8?B?dS95N09LemsxVmZLQkJBSG85VXlpc2dRZUJGUHJWYUE1TGNMVGJBVkFwM3VE?=
 =?utf-8?B?WVFjRTMxaVdVekdheWJiVHZ5WTg1NHY4OU04R09ZdGt3eXZOaXA1OWl4aFRH?=
 =?utf-8?B?OXA0bjByc213SG8rbHNnM3MwZjRSbmVWRHlWYzY1eUpVNVdZdDhRbEh2VHhI?=
 =?utf-8?B?YzA5L3hVRlNRbTVSd2ZHcE9VSWxNd2UzUVZ1K1Q4UG9hZnl5Wlhxb2s4cHdp?=
 =?utf-8?B?ZWxMQUJvdzhhc0J5RXkrUnBqNm9XNGw4K3ZzQ2JSTVlxRVQ5YnJTcC8rcWpZ?=
 =?utf-8?B?cmpFeFRadTl0VVd6dVNCaU1LdXlRTHBiOWZtcmtRVHdzMys1M0oyQ1BieFlV?=
 =?utf-8?B?QzRYeHU0UDdaaGg4WnRrV2RIZytJdTlVK0JpTFdoWUxtSDBLVVFCRDY4L1lV?=
 =?utf-8?B?WGtJVmRud1grU2phdWFiOEJRS25SYXhPaGNNdlZqMGdqSjNNZ3hWcVZyeXhI?=
 =?utf-8?B?SjROSDFwNmJxQXZUS0p4a2syL1FpbFhINUJUTDZPUUpMYkFOZm9nOG9PdWFx?=
 =?utf-8?B?SXdBcEdLREZCbkt4Nyt1WUFOK0doYUFmQlNPbnV5VzNVTlZ1Q1JNaUcxNEw3?=
 =?utf-8?B?QmhFVjRweHpzK01xV3RMT2lnbHBmZ0JUU1JpY3l4UithcGZTSzEvcFh1SXBi?=
 =?utf-8?B?RzgrL2R1VnhCakZtM1RCSGlqVlJRbVBWVGFHT2ViV3prUS9DdjZ2NTcxc203?=
 =?utf-8?B?ckNXT1RGNFNBMWo0VXEvTm82RzBGendxN2djZkl4Tk5JWmJ6K3hnVExDd011?=
 =?utf-8?B?dm1sSHZwYXhZaDl5N0hvdjJoYk9JRHh3MCttOHZuZWM2R2RUeVVJN3JPNGw1?=
 =?utf-8?B?N1VHVzZDU3pzK0JTNTN5QnUrUWZTSVRucUJJdmR3ZEN0VkM5dEI2bWFxcUVq?=
 =?utf-8?B?bE9SRTFtb1A3dXFGUGZRYlQzUU9TbDk0UlVjTy9vM3V5UFIwZUgvR2lwZVF3?=
 =?utf-8?B?VTlqanRCbUswblg2aGxqN1hTTVNzaW02cWFDY1BGVjdwUTBUdGJMYVo5eHNF?=
 =?utf-8?B?NjR5bTFUY2tIT083WEN4UXJvNnlGLy9FdzBldTlTc3RtZDVLWjFIZUpNeVo0?=
 =?utf-8?B?dVJoUER6elkyU2M0WFNPTDNQUDErSTJKYmthU3Z5N3JFNSt1NXBFTk1id0p0?=
 =?utf-8?B?SlhZaDBQWStNajJDUDNDS1pDR2QzdzdDeXhQam1mLzZYcGdiOTVON09HbXg2?=
 =?utf-8?Q?4CCCgjxJ9VE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzNLbGJ3b0hhOWJtZ0FVcDZwYmRub0VDU29lRElxa09VTmpxVnpIaDFJNUZu?=
 =?utf-8?B?aVFvcXhwdkE2UHdabWdyNThJZW96Mmp5ay9temVmcndRaGEzRC9HVGtUSWVZ?=
 =?utf-8?B?YW05Yi9qKzAxVzAxWkp2VVd4UFRnWUx5RFBHbmtYSkh0VnVZSnZNazRqa2oy?=
 =?utf-8?B?bXN3SWNNNUYySzIrMjExTDQzWmU1bVNoaUpqZUxNTjRVYTJPaFFQWFRDei9Y?=
 =?utf-8?B?YW1YTmppWEgzU2NCMWpoZHVldUJ1cGtHcjZ4cEVyMXQ3ZXN2Smc4aVp1bTQz?=
 =?utf-8?B?ZTd5N3FtRXhHc0NWWVZmZk8rMXpIY29YK1VHZTlRSHNwVkU0SG5obGhtRTlG?=
 =?utf-8?B?RlFaejdPMjZOME5NUzIwRjREUkVDWVprR2dLZGV1WVRLOEhYVDMrUVU2eVBC?=
 =?utf-8?B?QVFHNEpBb05Mak1nQ3N6NXJtZ011SEdQL29TTVJ1RlRkU0NXa20vdmRzYk16?=
 =?utf-8?B?V1dqbFpLQlZNVG5sYm55cUljd3ZqbVora3E2bTh2R3lkZ080TXA0ODZIN2Zx?=
 =?utf-8?B?aGVhTWw4UkI0b2JqUnFsakFTcDJwbElMeHlkeUp0T2lmbGEvQkQzUWgzYWxt?=
 =?utf-8?B?dWNGUkRLaC91NjVUb1Z4QWF5MCtOeFQ1dXpHOVNNMU0zVzdaWnAwWm1pZWI5?=
 =?utf-8?B?VGVwT29HTWptdDBqekJDSjROU2JjeXF5a3RlMStpa1dtRXZRUGVQSjdmdWc4?=
 =?utf-8?B?bmRERzZjWmxicmZ0MVNaUytHMVhHenc1bHlLamFsaDJVeVNmNEFBR0JkQ1hu?=
 =?utf-8?B?TlJqdk9oK0hKdzV6UEpYU1N0R2hrK2pJRW9aajU1eDhWU3k0MlBXTE9QL1lh?=
 =?utf-8?B?bFhnMEhhdWxBclJRRW9qdzJ2VkMvNmYySDI4RjhIOWU2WFdVc0hhTHlNcko1?=
 =?utf-8?B?TUVhaGh3LzFzTkxrV2tETmc1T3lyUmhhdlRPcUg3dFNaOGZRUkQ1c1QzdnR2?=
 =?utf-8?B?M2luQXJUdEYvMitlTUQwSFBrVTJodnhVSkw5bmhHRjhzRG5qUU5UZ0dGLyti?=
 =?utf-8?B?OC9rZ2RlQVdPcE5VakhHblVEVzV4QXV6T0xaRm5JM0NPV3Rsc2ZLUEdVRk1m?=
 =?utf-8?B?R2RFL3IzVjZDTlZXWVMwYlJnZHd1Ykk1cG81c29sNis5ZkRyVFFmc0w0VUJU?=
 =?utf-8?B?L3hhdEdQWkFsUXcrNmQ0bkIrdElRMCs1cEhMTXRHNlRvODBrMzdRQzh4bkpM?=
 =?utf-8?B?Z3JwckRlSGc5YW1RcGxNNXZkQ242bFdhSG1RaDNIZVRFNU8yVUJTdXp3QzVF?=
 =?utf-8?B?cDh5WWtqZ00zZkxmc29WeW9acVRDNVhaN3BTY3IwUE94NWZ4ajZjR2lTMHZo?=
 =?utf-8?B?WUwxNURCMU13Q01ubkQ2MG9xZjd2UTFaMVhUWFd5YzRGeGcwQVlKclJVZ3hH?=
 =?utf-8?B?S0dPS3lYdkszREVabXh5UzJTTmNEc1lrcTMwbnlubUhyNjZuL3R4Qm16eGFD?=
 =?utf-8?B?SGs5ZzBZdFFUSXFLSEoxdExHd0pUcnRVY0RPc3dUV0JWODhxdVE0Q2tZajFM?=
 =?utf-8?B?UGE0QlFxbEtHUlR0ZVZybWJGazR6cFIwMnlQeUh6SlUwb3dNVjZlSEwvTC8z?=
 =?utf-8?B?NHFkVjFjUmNRblpocHBjTjRrY0ZMelpsWXRUSGJOdlp5Q2FzU0F5MHpWM2du?=
 =?utf-8?B?c0hyRTVyWkczQ3Bzdk0rc2xzSnQ5cGgzNE1NVUx2TVZpUWxZc1ZNeEZjWmFa?=
 =?utf-8?B?b3JDNVkrYS9oYzVQdWJLOHJFQ0daWXNwVlR3TzV5UGYzcThISHB4QnMya2Fm?=
 =?utf-8?B?VVQ2S1JraTVCV3dWMWtNZldkWmtYZDh1VTJ1ellaT2ZiZ1ZuSzJMdithR3Vs?=
 =?utf-8?B?WmhZS1VWWXZWV0dWMjMwSFNOL0RGWnFVc0hZT2VNNWJyT3pxWnc2d3AxLzRw?=
 =?utf-8?B?b0k1UEdHdkRhZTRLZFZwUmQxMmtEUlozYjByWlpNZnZIbUVNZGZRQ242aDA3?=
 =?utf-8?B?V3JrZ0VuaENmYXNna2pwaG13d082UThlVExMTEJrVFZzYnhNRkJtdWdHUW9W?=
 =?utf-8?B?TzdtYUIyUm40cXMyZlNTbG9JMjNpcDZGS01vZmVlaDRBSzZCa2VaUk56eEpZ?=
 =?utf-8?B?TlEwbkVNWk0wOE45Yzd2UE93UjRWL09mLzcvZ29kMjFBTmQrSDJrdytGNWJl?=
 =?utf-8?B?OHRqL1B0UU1hSUpsdVlwZHJYVWF5S1ZOUFRPUS9MUHJoeDhzcndOYk94MmJn?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a52b42ec-c6d5-4360-5a81-08ddc83e1f89
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 10:05:30.1478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4MpwR+sCvS29EbUBqFGKnwnKmpu114xfwOoQ+uIR6z4mzEgg3OPVm9/wjAX6PjqIckznLCH5Il/uMbw8Ew8i8l7gWK7RsDH+/8YWxxR8AI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8831
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

Lukasz Laguna <lukasz.laguna@intel.com> wrote on czw [2025-lip-17 11:08:09 +0200]:
> Helper allows to iterate over enabled VFs.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  lib/igt_sriov_device.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index 912449086..930e97982 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -87,6 +87,18 @@ igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
>  	     ++__vf_num)
>  #define for_each_sriov_num_vfs for_each_sriov_vf
>  
> +/**
> + * for_each_sriov_enabled_vf - Helper for running code on each enabled VF
> + * @__pf_fd: PF device file descriptor
> + * @__vf_num: VFs iterator
> + *
> + * For loop that iterates over all enabled VFs associated with given PF @__pf_fd.
> + */
> +#define for_each_sriov_enabled_vf(__pf_fd, __vf_num) \
> +	for (unsigned int __vf_num = 1, __enabled_vfs = igt_sriov_get_enabled_vfs(__pf_fd); \
> +	     __vf_num <= __enabled_vfs; \
> +	     ++__vf_num)
> +
>  /**
>   * for_each_sriov_vf_in_range - Iterate over VFs in a specified range
>   * @__pf_fd: PF device file descriptor


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.40.0
> 

-- 
