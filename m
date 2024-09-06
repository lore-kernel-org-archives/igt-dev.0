Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8BBE6FE2F
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 16:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1711D10EAB1;
	Fri,  6 Sep 2024 16:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPAvmWEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C2110EAB1
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 16:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725641640; x=1757177640;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=vJrvunfv91xjH3eKRMTn+/K5fHTLYtFPGqgPrAM9k8w=;
 b=kPAvmWEWxILt0Y/vf2MgySsSoU5n+N7XsCCjx9kzNL5uZJifZabup87P
 gGBxRUzkCkaXQ2npIBeNlsQj99qztWBu9QP1FzLnL50on14NDH5YXmShM
 FPOvF6EZQnHb+YqHrmgaJLt0Ul9407S3Oma/D9FS2yuaouypPjjpnGrX+
 Flk5fwtS5wfTnTeMgfcJtZiNfXCgaoDI+zTI6NI0HXAqnMNt+iYCusZBp
 B62ZzA71b1+aeU5waqwXSe760yVcb4fbLAfZW/B9Y0P973QHx0oDqPRmW
 VwGs63+NkvVlue2LEI3N/g4lK4qU8eUFRJkOOiwnA9LQfLefRdUVZfQa2 Q==;
X-CSE-ConnectionGUID: qL6pNem1Q36M4BYBijARtA==
X-CSE-MsgGUID: fHD/Lfr2QAayRwaKbMxBDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="46933891"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="46933891"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 09:54:00 -0700
X-CSE-ConnectionGUID: 1eKnZJzyQX6GXN2GDouOUg==
X-CSE-MsgGUID: e8YYjeYISMW3QmEIBvvkTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="70585297"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 09:54:00 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 09:53:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 09:53:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 09:53:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEFY7qM6vwAbra8/dYxnTTTaY1X9uMm+ji8zQexQLBs3HoIaqBGollf5qeERs0PQwC0XQ/tNHfNwzQivxiar8VtIeR/LyiFJTKKRu4vAdZqUC55jG3DYHIO0+SVu3mq4fSs4VOI6QyUTr9ryS51xcEf3J7ZElu0ld3iCm8gYmSyeaPu5aKAsy6bbfwM/3r4oWFxUgM4dtMYJWpmqacne2T6jC8eK7/mpIZfLiCDE9DUEbZFpXGxA7tay1MHDm7WhAKfC0fUQXhXSI39xxCXEGFlKCPELxC6FqFdJt3Iz0qEY/SS0YOIrNi/9g5iBX7B++8hzhbJonE6K0uwFg0ESYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJrvunfv91xjH3eKRMTn+/K5fHTLYtFPGqgPrAM9k8w=;
 b=AFbqqZDvKMcdpg+9dYM3ej2Cly/vbKAQOdm/s8neOp5kV+s0ZQrOjgwXhKia/Ia8WHl3uImCUXweZcXKPGpmmLvEBoa/cclJOckBaIsCT8Mabit9oQf9V0LCrTMuohwpZrAnk9A34I5DrzgWscfUpmbq/SI1AfzIgz11rY7gSiU+uy3q0xCvneRx/aruJK2G1otDWshFt8CuEsFkU3/y6abAPpV3K3JUK4G+QjGV/qWa+GhSYmJKXRfabKxf1s0RxwBkGErX7jEXBSoq7AW4n6D6OJ4KYRnVL0JV+HglKfm4qm404KnwK7BXBCZYaMiv2vlfZlSBEymd2Ik5zDKgtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA1PR11MB7368.namprd11.prod.outlook.com (2603:10b6:208:420::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 16:53:57 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%4]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 16:53:56 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/4] tests/xe_oa: Drop TestOa from metric_set()
Thread-Topic: [PATCH i-g-t 1/4] tests/xe_oa: Drop TestOa from metric_set()
Thread-Index: AQHa/7MJkSJMuP5ji0ibZc+CEHymlbJK+QuAgAACRQA=
Date: Fri, 6 Sep 2024 16:53:56 +0000
Message-ID: <989cc3a017da30ce25a3acf636e2e69f48cada15.camel@intel.com>
References: <20240905164458.2406145-1-ashutosh.dixit@intel.com>
 <8734mcpw78.wl-ashutosh.dixit@intel.com>
In-Reply-To: <8734mcpw78.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA1PR11MB7368:EE_
x-ms-office365-filtering-correlation-id: 8509f5ac-2bc4-4e69-59f5-08dcce947f6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?blgyeVQ1U3VBYWxRbFdxd3o1WGRRTW41b3FnOVErYVJpdVNkdXJKRERGNlRz?=
 =?utf-8?B?ZnFRUEd6RDVwenJyNk1uWDM2WWl2OEcwWDJDVmRaL0dobkg2bTluK0hYSkt4?=
 =?utf-8?B?SmFGMWd2cW1JYnFZZm1SSlI0b2Y4b1pqQlROVytlYytHZXJzOWRYU0MxUXRY?=
 =?utf-8?B?cW5NNU5SOE92dnFiWko0b3FDLzVMeHJXNmFUL04rMXRSYUtKb3VXa0NjQWdt?=
 =?utf-8?B?c3kya0tNenlOdmtQenV4QmpWKzR4KzArM002MFJlNk40NUp6b1Y4QmFNeVFQ?=
 =?utf-8?B?Ukg0d3EvYkc1Q3JvWnc1bmMvRGFHRzQ0QjUyK25vZDg0NGhzb0kwWnVTOW1s?=
 =?utf-8?B?Y3cvOWt3MXorVHIwSnNPcDUrQ2w5UlZLaFZxeEZ1MU8rWFpCWitvYWxrUkZl?=
 =?utf-8?B?am1KdlZQRzlxaVBrWlVEQjRrMTBvL0dqTlBmWjdaMFByeldEay93WWlRNHF5?=
 =?utf-8?B?K1BoSURnSHpTUzgyWC9RYk5DUjdzSE5sWWxUZGM0L04rdlZDVW5hc0pvVXZU?=
 =?utf-8?B?dEFyVC9FeEpUTWEzYnpHWUJydnRZTDFMczJ0RW5QRXVTNi9KcDR4V3FhVDZh?=
 =?utf-8?B?aWZNRDNSdnp2RitRdVNCTFRMTmJLN1FsUUovQitKZHNoRGUzazh0dmRmL1BC?=
 =?utf-8?B?S0tqSFovd3Z3WkRWeTgwOUFacWs1LzlSSXBPZGxoVlBvcmcvbEF3Y2RTVkYy?=
 =?utf-8?B?M01rOTdxSzlDa2Q0cXpNN1NPcGF1bExkaTB4OTF0NFN0NDVMWjMwNFJUMHBl?=
 =?utf-8?B?QmFGd3dKS1o4Ykk5N1lNWUoxOWVrQjFaQ1gwRnBXT3dWM0Rsc1QybHNuV0JC?=
 =?utf-8?B?YVcvVGxSS0lBY2tZcTBMQjZwVWNnN2x5eURCcWExd1Fjait3ZkNxZFZmMm5R?=
 =?utf-8?B?UG9lQ1FUU0lGOCtTY0pSSjFQS055czhWQThSUm9ibXg3VmJCK3dlNUgxYUtM?=
 =?utf-8?B?WmIzNm1ZV0xRcWdBUFpNaXBmakZDdkVVSkdTV0thMXN1Nm5UbVk4bU9qaDhw?=
 =?utf-8?B?djAvakE2ZmlDMTdYaGdNeElPRHlNRytRN2pralRybS8wNzZnUk5xRUF2aHNX?=
 =?utf-8?B?cmVHcTlxQmlWMVY3NVJ6cDF1Ny9mRDNZei90WGRxWGxqejNIeDN2cFdjaHpG?=
 =?utf-8?B?V21XaGRMY3NvUElNcFA1emNHUWpqRFlNaDdMNmp4U3lkU1MxZlpuU2NQU1pY?=
 =?utf-8?B?SWs0RUc5UUExRC9Yalpid3BEMzZuYVE1cjd3b1l6NEkySG1uNW45dXNsbDBR?=
 =?utf-8?B?ay9Sb21MSDBsbzN1anJndnFCb2MybVZKMi9lWWpVSXJESWx2Q25ob0svVzVO?=
 =?utf-8?B?ZGpxMUdmbFE2V1NmdkpEc0E3K2Nta2F2U0N6S0hYeURuK3RoYzVrSUVWTGRF?=
 =?utf-8?B?R3NGckhRTHUvek9XVlZ6MU0vNkEvak81TUVDWWZ6ajRGZUVxdnVYbkdHZERW?=
 =?utf-8?B?ekc5ZVZSVEpobTFVTWNVWWx5dzF5bnJuaEdhd2MxY1lXamtBK3FpTm9YSjQ5?=
 =?utf-8?B?cDhFNkhiQ2hzLzZNbEIydkF1NHFOaTdkaG9NdU4rYnhsa0dWMmU4aElzeHoz?=
 =?utf-8?B?UEl5YkJkN1Y0dHBjK0o4UmtkMDZmMTR1QkIyeEN1MEV2Z21maVBaTUs1ejRX?=
 =?utf-8?B?U2l2aUIzTFA3NWJHdTFESWdSUk1WcFkrT2ZLdTJML1R2M3g4SzNKVk04eENT?=
 =?utf-8?B?RzhkL2tOdFpnNUNjRjF4bHNJdXoycWRSeDBTaXZrWi91dTArNlh6YWhJTE1v?=
 =?utf-8?B?RXdIb1o5UGhtMjBIb0VDbXZFd3BxMzMxVEZYNXdycXIyQzNIdGN6dzg0cDQz?=
 =?utf-8?B?MWtWUDhiTjFjak1OZUNaRW1xOGoxTDdnaHFiWlIzUm5uNStFeG5kdUhHWHZG?=
 =?utf-8?B?S1ZTeG9jVGF1N0dNTkhvby8xdzBWYXJWbVIvaVBQYVV5L0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkZ4Qk5UR1JYQ3Z3VWc3YkU2TU9iWFgvVFlJcmFkN1ppczl1UytaYWFSNUkv?=
 =?utf-8?B?UUpQb1NsWkNaWUZ6dCt1bnZtMW10WHdsbTN3VDZNYzl0NEhsUFhTVU9USndh?=
 =?utf-8?B?eDdvQjhUYy9lcEdWNzUxSE5vUFRPVU42bTVJanZqcS82d09sbVZTS2tYQm5Y?=
 =?utf-8?B?SDVoVUtGaTBwcXJBNTJ4RU1Dd0psRmRObXRwZmdvNUF1UXEzQ3ZGSVVsNXFX?=
 =?utf-8?B?N3Nnczc4S0I3ZzNjV3hpRUdQWUQ2dzYwUWxWMWd0cHUrc1h2dU1ueW5sdTl2?=
 =?utf-8?B?MFp4bFVUaW9NUWVwaGtUckJ2dTY5YUl1cWRyVS9hYkswZmFBNWEyZ1VtRE8z?=
 =?utf-8?B?WWU2RlFZclc1Z08veGkvSHlkcGJsSDBoc2pTOTZCQ0lUOGZnSW9sTEEyaDNI?=
 =?utf-8?B?YmpOaXI0QzZxZXFVaFVsTWQ2Y2Y3MnhyY2pLUUE2d0piT2h4Q1I3bnd4bDB0?=
 =?utf-8?B?bE10MmFwTVRjSm1nUnlhSHQ5L1ExaWwvcHhhZUQwRUtEZEluRm1EZTBGTTd1?=
 =?utf-8?B?VWk5ZWZxNHBNOVlpWUtlSzBmQm1ncmZZWjUvTHViZzN0d2Y5QUtCVmlsUHR2?=
 =?utf-8?B?QzlvSnh2enA4c0o3SFpMVnBIUmdFa0lWb1VCbGN3Z2k3QlAyZTBRTFZudFF2?=
 =?utf-8?B?ckcwWTh3anZuQVpaNWVmaTBYVVRLc3BpeXdZbldhc20rZjdUUWloTlN0cXhT?=
 =?utf-8?B?bmlpdlRveXZwcUJWZ0Q0bHlJYW4wNFByRUJRb0JMQjdkRzVuWCtNRGN3NFdM?=
 =?utf-8?B?MXlSUmVwMStrTG92YnpyRlRUN0k5d20yeFdpN1JqN05JRGY1WkVvNHBSdUV5?=
 =?utf-8?B?S3BkZlEvenljVzZ5SjZTOVA0Q1lMYUdER1ovTUxFRnpGV0V1VGx5dCtUcEZu?=
 =?utf-8?B?WVN5QkxBSVR2YlNhRnBRc0d2eElZNXczRW9BMDY2QWdUd0RrOEFldDZoaVh4?=
 =?utf-8?B?cnpSU1FmcmNGVFFoZUkyRFpxUDllQ0ZIdTJ5SVdBTE1TVWorS05OTTAzT2RD?=
 =?utf-8?B?T3FHMEJvZkNFZ05zNEU3bmkyb2xWTk5nVS9uTFU0bDlHaCtCYlliRFNLa3E1?=
 =?utf-8?B?TUErTzZ3N3h4Z1N1d3gvWkVIbTMwekVoMXBGdUdNL3lRcWhpSUhYM0pjR3Np?=
 =?utf-8?B?UjFhSnlpRnduSFpuV25raWNlRERVb0ptMHJlZng4ZTk0Rk1nWmI2dzNSZGFI?=
 =?utf-8?B?eGtIUDFFMzJsbGRmYVdkc2RZdEVlbUNGV01ZUHRuUElCMW9sQVJsYnBGclJP?=
 =?utf-8?B?VmtBVnJBa3l4WnVKRUpkY1RMZ0lnNlBPd3pGeDlJZHNSL2ZjenpJaUloMGEr?=
 =?utf-8?B?NEhzSFc4YmpDYnNKZko4by9xdU9sbU9IZmorQWNwTm1nb2FoemJGYXcxMXlS?=
 =?utf-8?B?MDdPNVNWSVJpY1BjSDJGUDlWbWZPcjNDQSttV2lacGhtR25TQ2MwT2YwUGFp?=
 =?utf-8?B?WGZuMnFTalczbHdGOHFBbjZxNmxwZkRvTW02Z2w3ZFpveHBuM2M4cUtNVWNZ?=
 =?utf-8?B?U0E4UkorMFkzd3IvUEJBL0VVYkQ5VlB0NmJSYmJiajdMRHBuTmVVK1NCcW1I?=
 =?utf-8?B?azFxVmFzQU9WeTNVMWFBNG9KTWhrdmhUTUlVUjArOVRsQXlXOVYzYkpCMDR2?=
 =?utf-8?B?Ym5oK2g3K0dHeTdUWUZHQ2FFWHlQMEdURlRpam9JeCtxOEZzT1pvb0xzZXEv?=
 =?utf-8?B?Sm96UFZ4T1lqbW1iS0tqRjltVXpvZ2hHQk1GKy9xQzByWW5hYlpUa295Wjkz?=
 =?utf-8?B?YmkvbzZkMnF2cUR4RzVKU2IzUHgxNnFzUytVUEZOYzQ1MEFyNkFpWnlqajlS?=
 =?utf-8?B?amlPa0RDMURXVE5mSk5PNDVldDBMbnNqNFZBM0k0L3JtSUNyOG1pMHg1WXN5?=
 =?utf-8?B?a3FVeHhydytHQU1aeDR0L2cwQ1k2RXV4bUczQXZLUysrSThka3BoSnlLZG4y?=
 =?utf-8?B?enBuR3lQb0F6TU55MVJBZVd6YXRaU0ZKb3I4K3pacmFYaWdjSUp2VzNkbzhQ?=
 =?utf-8?B?c0hFUlUyUHYydjV0RHdLVGFLMEZ3a043ZXdRdE5HY3lLSjd6S05vdnpIclRk?=
 =?utf-8?B?SmtnRmtQcmFnaytpaG1RM2I0TzlzRVUxL2ZqK1JpMURNVXFGcFh4Q1A2UGRs?=
 =?utf-8?B?RlNIQjhGcnFrbDBKRzUvazhqczZBZGhBMWdQQTF0YVdINUlaV3NHYVVadi9u?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09007B32DD49CB4DA134068557A720F1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8509f5ac-2bc4-4e69-59f5-08dcce947f6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 16:53:56.7961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TpNBLSWYEBp5UzYYK0Jr8c+Hes1174mniBjtqqUmjoheflwiXEZ4OTWkigFZmeGmPE3hMnNI+SI7dYhTKBDWMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7368
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

T24gRnJpLCAyMDI0LTA5LTA2IGF0IDA5OjQ1IC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFRodSwgMDUgU2VwIDIwMjQgMDk6NDQ6NTUgLTA3MDAsIEFzaHV0b3NoIERpeGl0IHdy
b3RlOg0KPiA+IA0KPiA+IEZyb206IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFA
aW50ZWwuY29tPg0KPiA+IA0KPiA+IFNvbWUgcGxhdGZvcm1zIGRvbid0IHByb3ZpZGUgVGVzdE9h
IGFuZCBSZW5kZXJiYXNpYyBhbmQgQ29tcHV0ZUJhc2ljDQo+ID4gYXJlIGJldHRlciB0ZXN0cyBm
b3IgcmVuZGVyIGFuZCBjb21wdXRlIGVuZ2luZSBhbmQgYXZhaWxhYmxlIGluIGFsbA0KPiA+IHBs
YXRmb3Jtcy4NCj4gDQo+IEkgd2VudCBhaGVhZCBhbmQgbWVyZ2VkIHRoaXMgc2VyaWVzLiBUaGFu
a3MgZm9yIHRoZSBwYXRjaGVzIEpvc2UuDQoNCk9rYXksIHRoYW5rIHlvdS4NCg0KPiANCj4gQXNo
dXRvc2gNCj4gDQo+ID4gUmV2aWV3ZWQtYnk6IEFzaHV0b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhp
dEBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8
am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCg==
