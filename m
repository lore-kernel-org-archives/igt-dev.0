Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20452C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 06:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B171110E6CC;
	Wed,  2 Apr 2025 06:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLj2nMHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8C210E6C5
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 06:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743575300; x=1775111300;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iLhDUHVoczctRLV41/q5xQ9QjaBbyKVA+JpQCSkazPw=;
 b=CLj2nMHGopBIy94gDYraF3H9U+8DTLnKnVgWXhJrxiQRoJew4WpFFgJB
 yenoxAgewluFCdIpwVPx1O7z88jUvJBNUPd5kqirUDbR03Fh7+hTvW+Kb
 FRZ8ZYWbQVgoElgP+qjuPQqHqZMGJuRqs79vzi8sITKF4vihsdcV+xWiZ
 7SPIb95ymekdCkyInmjNMi+SF4es0h5b5KxHKkbzflfsnxJ1EAbchiezi
 opsomvcnT0vYsKFMNlMYmqCg6mPxjrwS+0b6oTXIFJgSjOozyuizLE8Qi
 UQh06ui3dnrh9mtuRTy2bH64bNqeheF5wIqWe84XuKUBfTFHqwAu1a0r1 A==;
X-CSE-ConnectionGUID: jRYlQcnmQZmk9WKvvFemGQ==
X-CSE-MsgGUID: 3cgZGrF8QKKQj5FSv1sClQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44173849"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="44173849"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 23:28:19 -0700
X-CSE-ConnectionGUID: 08cTP16FTAWarLOcO8HM3Q==
X-CSE-MsgGUID: vS/DLRaGQd6oezFu7Kyrlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="131327587"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 23:28:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 23:28:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 23:28:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 23:28:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5tK1YIODG3jCyUka7D10rdFobXI+9GGyfeUtBYW/FhD03Hb3YEYuH6CyISRdFdpO6AUH/5fAw1YnAvnaGSHURG5wuOXoCM/6QiUMNA/mmOvURNdLfH0opz2R4YHxzFAlLey36o3czd0pVHeJw2RxfEM5LurVam/cdIpGAcskshKd2VzS0ANpjIHbqWJoVrCEMbgurjPkKO4uiGJk2IZgFCNXrholnFz6+WkE6QGAtEgoFAz57SGd0HZljGO1oQQxEIgDcE+9MBJebNoA2wii4BMKZATpOmo2RnwH9szISjmgf4HPaxWbpQ26Z8CiDtm2g/ZFAOU72psNfEeBTPCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLhDUHVoczctRLV41/q5xQ9QjaBbyKVA+JpQCSkazPw=;
 b=mwsX2CO/e8bEjSGJGhKDpmmi7VoasHh+8xvMgxkUQtVzkQGDpTKW7jfqg+IJWN2W3Ie7eVMA6SbyTqD//5D8Vts1/DNGe+oJYitN4/7MZZBUoUhm0ayCksvxmFMWRNJAvTI0ELbY3ICxKq42rDZi/1gV2EMRxJRh74UTFvQkLMCCglLtDhvV/AzLLSOOkBq9ErrF8pDC4G2BjbAaQpnxvfsfLPddXNnt9CALMPiHwjY/zry6hK0TYTVoMw39HCDdQSPc38RwdDSE6OPEFNYUEiRd9NHA0db94edkWxBgys6/ZHCunNnuZ33mYVmGwugYrmn7Z1U7+8oLe5qck+ybOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW4PR11MB6764.namprd11.prod.outlook.com (2603:10b6:303:209::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 06:28:15 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 06:28:15 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Subject: RE: [PATCH 2/4] benchmark: Measure allocation time for objects
Thread-Topic: [PATCH 2/4] benchmark: Measure allocation time for objects
Thread-Index: AQHbo5U59hdxoQW3Y0COXHtqy7Cj/bOP6TTA
Date: Wed, 2 Apr 2025 06:28:14 +0000
Message-ID: <CH3PR11MB8434B8457817DB060FD25D5A8DAF2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250402061033.659931-1-pravalika.gurram@intel.com>
 <20250402061033.659931-2-pravalika.gurram@intel.com>
In-Reply-To: <20250402061033.659931-2-pravalika.gurram@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW4PR11MB6764:EE_
x-ms-office365-filtering-correlation-id: 116e098f-761b-483b-da73-08dd71af8c8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?OE9rTWIwYjkvZzZGbkdGLzJuYTNxangybGN2N1plZ1JuUEZPMlZJTmxzcWJp?=
 =?utf-8?B?M2JJcVBlbEFOUzJnTFlWSEJ6NVQvcTlGaVNIeUFocGxVWmxhcVJEbEFndkFO?=
 =?utf-8?B?eUsyc29zVjB4bUtneUVlcmRnTHFPWFpwYkZVV213dXpuV2xqNHRDdUg0UzFV?=
 =?utf-8?B?dHlQNEJLQWJVZlAvRGY3K1I2Ry9UaFk3YlBvUGJLVVQyVXdMT2tjcG9SRHpm?=
 =?utf-8?B?eWYxRFdZc2x0dUNlZzJsSVh2TTFzNWE0b01WTFg2OUVqMkxtMVBoUThybTlY?=
 =?utf-8?B?QjNERUd5bkVaZUtQNjRqMVNBZmN1bVIwaCtnWEo5cDFJb09URmxVZmIwM1ls?=
 =?utf-8?B?MzhaZVFDNi95OFQzT3pxaXFmNk56MFJJU085L2pOWkRhODdPaDlxbUtuQ05H?=
 =?utf-8?B?TW5wTk9vODd0RGRjVWVnMlVhUHR5V2pGUWYxUnlYRXNxQ0RkUVFpNVM1QWtY?=
 =?utf-8?B?S3dZTWdDN24xdjVid0tFOUhLN3h2N042aDNzUzkvdTdtbUJ4N2JlSnozMU5n?=
 =?utf-8?B?MVMvalR1QUkrVWwwdVhpZ3YrVFUyT2xPaEV4NUZnSjBrMDZoZnVxbXJDS0Nr?=
 =?utf-8?B?bmdEaC8xZTgvMldmMjRVaUZGdldnN0hxWGlSNFh5bS9JeHFXcDVBeSs5b0Fq?=
 =?utf-8?B?SVQxaHV0SDZqcjh1dkhLamxHcTdObFJPK2hWVXRhTFB5OTZRczBjUytudXNF?=
 =?utf-8?B?d3NIazhJWTZNRDRaR1dmdkN0d3NERlNCRDZiVzM0SnlZd3dHcmkySGNVOUdO?=
 =?utf-8?B?bEJLSEhTT3VZcEY0emNpSm01cTY1VStxQ2RPRW1OalZWZytHZk5SM0E1aEpB?=
 =?utf-8?B?VGtwNUdXVndQSHNBWWF0Um9JUnI5TTNoSktDRlFvQTdZbDQ0VEcvcWV2UFFi?=
 =?utf-8?B?NkFrS0s4cmt5TGVmbC9TUEx6eFV5d2FPQkNadzRDdTVzN1ZSanM3U2JtSGp4?=
 =?utf-8?B?cUh1ei9Jejh3SElONWk3RXBtUGQ5bTE1cmJKMVdIQ2MrL3ZnMmx2ZEQ5N250?=
 =?utf-8?B?SldxZVVUS2FIbG93bkNaY1ZveEwvVDgxclF5VWUraXhaMWpESTVPYXNPT25C?=
 =?utf-8?B?MUNWWUNNaTJkY1IxN2hVQ1RJVk9yWTkrM2pCbS9WUmJEVy9WbTFPcktIUnMz?=
 =?utf-8?B?eEF0UGhqS3JGQ2hhckJEUndlOVpSYkpCUGVIU0Jlbk45dFpRVHgrWFlOZzJ4?=
 =?utf-8?B?cmU2VDV0d3Z4LzN4clE1S3ZvU1Z1NXViRE4rY0xHVThCM0VGdEZDUG5wL0hj?=
 =?utf-8?B?bUFrWUF1ZWRZYmcyUm1nOXd4YW5BTW9MRjV5QjE1Nll3N1plazJtS3pQd2NN?=
 =?utf-8?B?N0lwZmkwdld3RHdqblZVYzhvN00xNzY2Wk1BOWNUVldZT21GbHlNY0g5bVdu?=
 =?utf-8?B?c0kxd2d5ZzM5MTBvY1ZHZE9YMHFhM3pLNWw0SEpUWEpKNWFUbkFVenpiNUpD?=
 =?utf-8?B?aTVZMktIcU5ZbVJnRXg1S0VSY08vTnVUZkhqa1diUUdxOWRtK29TTzZwS3Mx?=
 =?utf-8?B?SEFLRjEvOEdhQ1ZzWGI0VFZMY21EczJrL2lIOFBMMC9OSmZhN0tYaHllbFVH?=
 =?utf-8?B?T240ekZGU1o4MGkyL1k0am1RRFBrMFRyVHYvNHFKNVlKSzR5SjJ3S2JBWE03?=
 =?utf-8?B?R2labW5IZVEvd1VqSkNha3MzSGl1ZkRvRWdnaUdGUk9nVExFM0Rqd1NPQlNy?=
 =?utf-8?B?L0E5QnlRdmQyZm5LNExqcFlqQldyVUJGVThzSFBPMEZCSkFWTWNDcW8va1RL?=
 =?utf-8?B?RjF2a0Y0T1h4Y3VqMG5COXo5UnBicUthV2FvenU5NHFSVG41RjhZUnEvWkhB?=
 =?utf-8?B?T0c4YUlsZGgwcVY0VldWMjBOUUhWZmVEbG9DTm52TERRWHdGY1RLU0VuTUNY?=
 =?utf-8?B?NFZpa3piTWlKT1kxU0JPQ2xuS29zM3VRa0FjeXc3RzA4VTJEaUlFbjNONld5?=
 =?utf-8?Q?DG5hTGJpfQujiqlfMKXfkkZ0AsELTePp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1BXQnp3TkJXMUczeEVwTGFZNVNwaldhOUo2dUNsbHNNdGVyeDJiOXZLZGtq?=
 =?utf-8?B?MHVzaXlmaTkwSWR1T0Urc0Q5YnZ6N2p3NjRvSXIvSm1kVzRSbVpSMkYzYjBW?=
 =?utf-8?B?VkxJcFNiUktYd3lJOVpMcGd5SE5jSFB4T1FHNzJra25Hek8xTE1jYng5dmxR?=
 =?utf-8?B?bXd1ait5QUw0VEdoVm45YlJGQjR0SXp4VklCQnZDUnFJWHJka3g3YWFOa0Fj?=
 =?utf-8?B?MU9pOExZYkYzK0poZlZQYXBJbi9Da3IwTm40MVR5ZUFrbldZdTdpSUNsU0tM?=
 =?utf-8?B?VDlkb0hwNHYybXIvRzVtTmYrb3NYd0tpMzB4eTBIUDg4b1M4aEJlU3g2UFU3?=
 =?utf-8?B?L0RZV3crMXJhVC9tRitWd0x3NVN3aWpsMlBVWkFuR2Jnalg5SlAyeHdyR0NR?=
 =?utf-8?B?eGpZZzBRRS9Gd0NlVU5GUGJETzF3bVMwcFJwZWRJaTZlV25tZHBnSS9xT3Y5?=
 =?utf-8?B?dVJ6Y29BUXYzMG5TY0dDbzh2M2MxWldzQmhOODRuREFWSDJkSkxPdnFPaTB2?=
 =?utf-8?B?YzhONHU5bGsrbzdRbDluSzVxbGdBU3czT2pueEkxTDNjNDVPNzFPSzRzbk4w?=
 =?utf-8?B?dmhJazRnZXAydFloMlAxKzRjUUdCdHFKaG9FQkNhNHlIcDZaSytkeHdXb2Fh?=
 =?utf-8?B?eVRoemxxblJBMXd1WTUwZkx4NWwwcG9CSG9hckhpaFQ3ZGxqeFZYR3BsMXU1?=
 =?utf-8?B?ZjNBQWVoc2lyWjE5OE84MGdOdGFtdjhxL3NMc0hMTythdUp4K0NMc1ZBdC9U?=
 =?utf-8?B?d25rVHZjaUdnY3hPWjRnWHVMN3QrWjJvVVdLdnlUc2hReWx2aDUyNlZNQWlE?=
 =?utf-8?B?QXc5QUlzK1NkVVIzNHdyVXFPV3dXcFNXNkdVaDhnem1pdjZXT0ZseW5lMDVO?=
 =?utf-8?B?MStmdmFFTzdWcEwwWHA3MHhYL3hSamdZVERnVHZ3UEhkdUVmdWVBMGVDUS83?=
 =?utf-8?B?aWdyMFJ2UVh5eEhIS0F1akRZT3VZaGI3cncrRGllRmZqTTJPYkt5R3o0WElX?=
 =?utf-8?B?QnNXVHFpcEdtZGhXRnZ3akRtMzU0M3BDckVuZWtWdFdTYnRxS3d6S1AyVEFl?=
 =?utf-8?B?THJnd3k0YnZDenVVcmNWM1FlZlRCNHlqT1FSdldEajIzbUxSK1JPZ2dXeU9j?=
 =?utf-8?B?THJTZXp6Uit6YytqVXIrRVdCSUdyV3J0Y2x4ZElwQ25wNVlZampvU3Y3Mm9K?=
 =?utf-8?B?ZGp1YWlqUGxKdlNGOWZPaEdaclhrMGpNdi9zM1Arc1BqVkFjWXNidURoNXhh?=
 =?utf-8?B?UFdZQ3FveTNjVjJuOSt0S0VWaGhEaDQySVNha3hvYTEzVURORUFEdXlBMFhq?=
 =?utf-8?B?ZkRNekZOdXNKL2lKV0l6aCtlVndKU0NjamVmbnZvWW1KaVdWVUxwT0VRbDZa?=
 =?utf-8?B?UHM4OCtrWnZYcjFZdnRHUVlYWHcxdjJDd2tvMjU2Z081RUJEeFJ6dE42MlFW?=
 =?utf-8?B?Wk5jMGxtbkxqbngvVkJmbjQ3NXQxd1RhaVRZTnJ3MUVlNmR4R1R6UkVBZU9I?=
 =?utf-8?B?SnBqRFlxUUxVMitoNDFqcHJZbW8yM0ZhY2dsbmphRzJMb0tyeG0xMFdacTJq?=
 =?utf-8?B?KzRvaWQrUHpGdTZQdG1qTHFmOUU3cGQvUUl3YnEyeW1ScGxpQ00rd2J3aXhj?=
 =?utf-8?B?RUJjcEM5WXB4bHArOC9Dbm9ESmxNRXlUS3NOSWxvL2ltR1UwMmpzbGQrbjdG?=
 =?utf-8?B?SzNjSXhKYVVBT1RwZWNXVUMySVEvaE43Y0Rna0F6VTdqQWsvcEJtYjJ3L1BF?=
 =?utf-8?B?WGxxajhPMkdwanE5RGgzTTJ2MVlDenc2U2RkWnd0MFlnVTBwRWNMSzdQeDlJ?=
 =?utf-8?B?a0o1amNtSTNML3l0cnIxYWZ4aDFCZzlUWWc4bndkTTZPUFdSVE5vWnMwS3Uv?=
 =?utf-8?B?Z0JSbklSS0tmZVNhR3JrdXUxdFdNNU5QZXorMGZsN1ZCaDNDS0NNQzJ2Ymwv?=
 =?utf-8?B?SXBmM0FzQmpNWWlINksvT052OFYrRGR2bk9nTm1DVkVuRG9RSTAxcHFheW9Q?=
 =?utf-8?B?WW9jZDMvZkFqdHVNUXhzM0NkTWRxd1hDVit2ZHl0Z3dwNkFleVJoa202NWxv?=
 =?utf-8?B?bThiNE1JbDV2dUxpVHhVZU03LzFZN2JicURBWjFWZXZ1ZlpZZUJ3TlBYT2xO?=
 =?utf-8?B?R0tEM0ZISUx3K2VoeHVXbWx6ZVdWN3Uyb1R6R1R5aHBDMzFLZkpvelBFM0dT?=
 =?utf-8?B?UFgxdEl3bmswd0x2UDBQZHJwbW9abHh6aWVHWVlhMlhhakYwSnFnTXJYZEV4?=
 =?utf-8?B?ZTV4ZXFDejRkRGlIcGNRa1VWeFNRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116e098f-761b-483b-da73-08dd71af8c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 06:28:14.7456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h7kVViKwRNq3ula4LX4l3XkSbaxMve8LcaX6EaSVs1/hrwqM1gIVNH1ncwulrcP/JDvv3LAW/WHR8gWSeFztspvdHgPUYNjkO3vo8NQWYBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6764
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFByYXZhbGlrYQ0K
PiBHdXJyYW0NCj4gU2VudDogMDIgQXByaWwgMjAyNSAxMTo0MSBBTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEd1cnJhbSwgUHJhdmFsaWthIDxwcmF2YWxpa2Eu
Z3VycmFtQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDIvNF0gYmVuY2htYXJrOiBNZWFz
dXJlIGFsbG9jYXRpb24gdGltZSBmb3Igb2JqZWN0cw0KPiANCj4gQSBiYXNpYyBtZWFzdXJlbWVu
dCwgaG93IGZhc3QgY2FuIHdlIGNyZWF0ZSBhbmQgcG9wdWxhdGUgYW4gb2JqZWN0IHdpdGgNCj4g
YmFja2luZyBzdG9yYWdlDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQcmF2YWxpa2EgR3VycmFtIDxw
cmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gLS0tDQo+ICBiZW5jaG1hcmtzL21lc29uLmJ1
aWxkIHwgICAxICsNCj4gIGJlbmNobWFya3MveGVfY3JlYXRlLmMgfCAyMzMNCj4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjM0
IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBiZW5jaG1hcmtzL3hlX2NyZWF0
ZS5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYmVuY2htYXJrcy9tZXNvbi5idWlsZCBiL2JlbmNobWFy
a3MvbWVzb24uYnVpbGQgaW5kZXgNCj4gNDQyMWVkZTg2Li4wMDIwM2M2MmUgMTAwNjQ0DQo+IC0t
LSBhL2JlbmNobWFya3MvbWVzb24uYnVpbGQNCj4gKysrIGIvYmVuY2htYXJrcy9tZXNvbi5idWls
ZA0KPiBAQCAtMjIsNiArMjIsNyBAQCBiZW5jaG1hcmtfcHJvZ3MgPSBbDQo+ICAJJ3ByaW1lX2xv
b2t1cCcsDQo+ICAJJ3ZnZW1fbW1hcCcsDQo+ICAgICAgICAgICd4ZV9ibHQnLA0KPiArICAgICAg
ICAneGVfY3JlYXRlJywNCj4gIF0NCj4gDQo+ICBiZW5jaG1hcmtzZGlyID0gam9pbl9wYXRocyhs
aWJleGVjZGlyLCAnYmVuY2htYXJrcycpIGRpZmYgLS1naXQNCj4gYS9iZW5jaG1hcmtzL3hlX2Ny
ZWF0ZS5jIGIvYmVuY2htYXJrcy94ZV9jcmVhdGUuYyBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBp
bmRleCAwMDAwMDAwMDAuLmNkOTdkNjkyMA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2JlbmNo
bWFya3MveGVfY3JlYXRlLmMNCj4gQEAgLTAsMCArMSwyMzMgQEANCj4gKy8qDQo+ICsgKiBDb3B5
cmlnaHQgwqkgMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICoNCj4gKyAqIFBlcm1pc3Npb24g
aXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uDQo+ICtvYnRh
aW5pbmcgYQ0KPiArICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3Vt
ZW50YXRpb24gZmlsZXMgKHRoZQ0KPiArIlNvZnR3YXJlIiksDQo+ICsgKiB0byBkZWFsIGluIHRo
ZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dA0KPiArbGlt
aXRhdGlvbg0KPiArICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1
Ymxpc2gsIGRpc3RyaWJ1dGUsDQo+ICtzdWJsaWNlbnNlLA0KPiArICogYW5kL29yIHNlbGwgY29w
aWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20NCj4gK3Ro
ZQ0KPiArICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBm
b2xsb3dpbmcgY29uZGl0aW9uczoNCj4gKyAqDQo+ICsgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5v
dGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSAoaW5jbHVkaW5nIHRoZQ0KPiArbmV4dA0K
PiArICogcGFyYWdyYXBoKSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBhbGwgY29waWVzIG9yIHN1YnN0
YW50aWFsIHBvcnRpb25zDQo+ICtvZiB0aGUNCj4gKyAqIFNvZnR3YXJlLg0KPiArICoNCj4gKyAq
IFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFO
WSBLSU5ELA0KPiArRVhQUkVTUyBPUg0KPiArICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1Qg
TElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRg0KPiArTUVSQ0hBTlRBQklMSVRZLA0KPiArICog
RklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElO
IE5PDQo+IEVWRU5UDQo+ICtTSEFMTA0KPiArICogVEhFIEFVVEhPUlMgT1IgQ09QWVJJR0hUIEhP
TERFUlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sDQo+IERBTUFHRVMgT1INCj4gK09USEVSDQo+
ICsgKiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9S
IE9USEVSV0lTRSwNCj4gK0FSSVNJTkcNCj4gKyAqIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNU
SU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1INCj4gT1RIRVINCj4gK0RFQUxJTkdT
DQo+ICsgKiBJTiBUSEUgU09GVFdBUkUuDQo+ICsgKg0KPiArICogQXV0aG9yczoNCj4gKyAqICAg
IFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiArICoNCj4g
KyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8dW5pc3RkLmg+DQo+ICsjaW5jbHVkZSA8c3RkbGliLmg+
DQo+ICsjaW5jbHVkZSA8c3RkaW50Lmg+DQo+ICsjaW5jbHVkZSA8c3RkaW8uaD4NCj4gKyNpbmNs
dWRlIDxzdHJpbmcuaD4NCj4gKyNpbmNsdWRlIDxmY250bC5oPg0KPiArI2luY2x1ZGUgPGludHR5
cGVzLmg+DQo+ICsjaW5jbHVkZSA8ZXJybm8uaD4NCj4gKyNpbmNsdWRlIDxzeXMvc3RhdC5oPg0K
PiArI2luY2x1ZGUgPHN5cy9pb2N0bC5oPg0KPiArI2luY2x1ZGUgPHN5cy90aW1lLmg+DQo+ICsj
aW5jbHVkZSA8dGltZS5oPg0KPiArDQo+ICsjaW5jbHVkZSAiZHJtLmgiDQo+ICsjaW5jbHVkZSAi
ZHJtdGVzdC5oIg0KPiArI2luY2x1ZGUgImk5MTUvZ2VtX2NyZWF0ZS5oIg0KPiArI2luY2x1ZGUg
ImlndF9hdXguaCINCj4gKyNpbmNsdWRlICJpZ3Rfc3RhdHMuaCINCj4gKyNpbmNsdWRlICJpbnRl
bF9yZWcuaCINCj4gKyNpbmNsdWRlICJpb2N0bF93cmFwcGVycy5oIg0KPiArDQo+ICsjaW5jbHVk
ZSAiaWd0LmgiDQo+ICsjaW5jbHVkZSAiaWd0X2NvcmUuaCINCj4gKyNpbmNsdWRlICJpZ3Rfc3lu
Y29iai5oIg0KPiArI2luY2x1ZGUgImludGVsX3JlZy5oIg0KPiArI2luY2x1ZGUgInhlL3hlX2lv
Y3RsLmgiDQo+ICsjaW5jbHVkZSAieGUveGVfcXVlcnkuaCINCj4gKw0KPiArDQo+ICsjZGVmaW5l
IE9CSkVDVF9TSVpFICgxPDwyMykNCj4gKw0KPiArc3RydWN0IGRhdGEgew0KPiArCXVpbnQzMl90
IGJhdGNoWzE2XTsNCj4gKwl1aW50NjRfdCBwYWQ7DQo+ICsJdWludDMyX3QgZGF0YTsNCj4gKwl1
aW50NjRfdCBhZGRyOw0KPiArfTsNCj4gKw0KPiArc3RhdGljIGRvdWJsZSBlbGFwc2VkKGNvbnN0
IHN0cnVjdCB0aW1lc3BlYyAqc3RhcnQsDQo+ICsJCQkJY29uc3Qgc3RydWN0IHRpbWVzcGVjICpl
bmQpDQo+ICt7DQo+ICsJcmV0dXJuIChlbmQtPnR2X3NlYyAtIHN0YXJ0LT50dl9zZWMpICsgMWUt
OSooZW5kLT50dl9uc2VjIC0NCj4gK3N0YXJ0LT50dl9uc2VjKTsgfQ0KPiArDQo+ICtzdGF0aWMg
dm9pZCBzdG9yZV9kd29yZF9iYXRjaChzdHJ1Y3QgZGF0YSAqZGF0YSwgdWludDY0X3QgYWRkciwg
aW50DQo+ICt2YWx1ZSkgew0KPiArCWludCBiOw0KPiArCXVpbnQ2NF90IGJhdGNoX29mZnNldCA9
IChjaGFyICopJihkYXRhLT5iYXRjaCkgLSAoY2hhciAqKWRhdGE7DQo+ICsJdWludDY0X3QgYmF0
Y2hfYWRkciA9IGFkZHIgKyBiYXRjaF9vZmZzZXQ7DQo+ICsJdWludDY0X3Qgc2RpX29mZnNldCA9
IChjaGFyICopJihkYXRhLT5kYXRhKSAtIChjaGFyICopZGF0YTsNCj4gKwl1aW50NjRfdCBzZGlf
YWRkciA9IGFkZHIgKyBzZGlfb2Zmc2V0Ow0KPiArDQo+ICsJYiA9IDA7DQo+ICsNCj4gKwlkYXRh
LT5iYXRjaFtiKytdID0gTUlfQkFUQ0hfQlVGRkVSX0VORDsNCj4gKwlpZ3RfYXNzZXJ0KGIgPD0g
QVJSQVlfU0laRShkYXRhLT5iYXRjaCkpOw0KPiArDQo+ICsJZGF0YS0+YWRkciA9IGJhdGNoX2Fk
ZHI7DQo+ICt9DQo+ICtzdGF0aWMgdm9pZCB0ZXN0X2V4ZWMoaW50IGZkLCBpbnQgYnVzeSkgew0K
PiArCXVpbnQzMl90IHZtOw0KPiArCXNpemVfdCBib19zaXplOw0KPiArCXVpbnQzMl90IGJvID0g
MDsNCj4gKwlzdHJ1Y3QgZGF0YSAqZGF0YTsNCj4gKwl1aW50MzJfdCBleGVjX3F1ZXVlOw0KPiAr
CXVpbnQzMl90IHN5bmNvYmo7DQo+ICsJaW50IHZhbHVlID0gMHgxMjM0NTY7DQo+ICsJdWludDY0
X3QgYWRkciA9IDB4MTAwMDAwOw0KPiArDQo+ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmMgPSB7
DQo+ICsJCS5mbGFncyA9IERSTV9YRV9TWU5DX1RZUEVfU1lOQ09CSiB8DQo+IERSTV9YRV9TWU5D
X0ZMQUdfU0lHTkFMDQo+ICsJfTsNCj4gKwlzdHJ1Y3QgZHJtX3hlX2V4ZWMgZXhlYyA9IHsNCj4g
KwkJLm51bV9iYXRjaF9idWZmZXIgPSAxLA0KPiArCQkubnVtX3N5bmNzID0gMSwNCj4gKwkJLnN5
bmNzID0gdG9fdXNlcl9wb2ludGVyKCZzeW5jKSwNCj4gKwl9Ow0KPiArDQo+ICsJc3RydWN0IGRy
bV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgaW5zdCA9IHsNCj4gKwkJLmVuZ2luZV9jbGFzcyA9
IERSTV9YRV9FTkdJTkVfQ0xBU1NfQ09QWSwNCj4gKwl9Ow0KPiArDQo+ICsJdm0gPSB4ZV92bV9j
cmVhdGUoZmQsIDAsIDApOw0KPiArCWJvX3NpemUgPSBzaXplb2YoKmRhdGEpOw0KPiArCWJvX3Np
emUgPSB4ZV9iYl9zaXplKGZkLCBib19zaXplKTsNCj4gKw0KPiArCWJvID0geGVfYm9fY3JlYXRl
KGZkLCB2bSwgYm9fc2l6ZSwNCj4gKwkJCXZyYW1faWZfcG9zc2libGUoZmQsIDApLA0KPiArDQo+
IAlEUk1fWEVfR0VNX0NSRUFURV9GTEFHX05FRURTX1ZJU0lCTEVfVlJBTSk7DQo+ICsJaWYgKGJ1
c3kpIHsNCldoeSBjYW50IGl0IGJlIGFsbCBiZWxvdyBtYWRlIGludG8gYSBmdW5jdGlvbiBhbmQg
anVzdCBjYWxsZWQuIEFsc28sIGNhbiB5b3UgbWFrZSBhbGwgdGhlIGNoYW5nZXMgd2hpY2ggSSBh
bHJlYWR5IG1lbnRpb25lZCB0byB0aGUgcHIgeW91IHNlbnQuDQo+ICsJCXN5bmNvYmogPSBzeW5j
b2JqX2NyZWF0ZShmZCwgMCk7DQo+ICsJCXN5bmMuaGFuZGxlID0gc3luY29iajsNCj4gKw0KPiAr
CQl4ZV92bV9iaW5kX2FzeW5jKGZkLCB2bSwgMCwgYm8sIDAsIGFkZHIsIGJvX3NpemUsICZzeW5j
LCAxKTsNCj4gKwkJZGF0YSA9IHhlX2JvX21hcChmZCwgYm8sIGJvX3NpemUpOw0KPiArCQlzdG9y
ZV9kd29yZF9iYXRjaChkYXRhLCBhZGRyLCB2YWx1ZSk7DQo+ICsNCj4gKwkJaWd0X2Fzc2VydChz
eW5jb2JqX3dhaXQoZmQsICZzeW5jb2JqLCAxLCBJTlQ2NF9NQVgsIDAsDQo+IE5VTEwpKTsNCj4g
KwkJc3luY29ial9yZXNldChmZCwgJnN5bmNvYmosIDEpOw0KPiArDQo+ICsJCWV4ZWNfcXVldWUg
PSB4ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0sICZpbnN0LCAwKTsNCj4gKwkJZXhlYy5leGVj
X3F1ZXVlX2lkID0gZXhlY19xdWV1ZTsNCj4gKwkJZXhlYy5hZGRyZXNzID0gZGF0YS0+YWRkcjsN
Cj4gKwkJc3luYy5mbGFncyAmPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTDsNCj4gKwkJeGVfZXhl
YyhmZCwgJmV4ZWMpOw0KPiArDQo+ICsJCWlndF9hc3NlcnQoc3luY29ial93YWl0KGZkLCAmc3lu
Y29iaiwgMSwgSU5UNjRfTUFYLCAwLA0KPiBOVUxMKSk7DQo+ICsNCj4gKwkJc3luY29ial9kZXN0
cm95KGZkLCBzeW5jb2JqKTsNCj4gKw0KPiArCQl4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGV4
ZWNfcXVldWUpOw0KPiArCX0NCj4gKwltdW5tYXAoZGF0YSwgYm9fc2l6ZSk7DQo+ICsJZ2VtX2Ns
b3NlKGZkLCBibyk7DQo+ICsNCj4gKwl4ZV92bV9kZXN0cm95KGZkLCB2bSk7DQo+ICt9DQo+ICtp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+ICt7DQo+ICsJaW50IGZkID0gZHJtX29w
ZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ICsJaW50IHNpemUgPSAwOw0KPiArCWludCBidXN5ID0g
MDsNCj4gKwlpbnQgcmVwcyA9IDEzOw0KPiArCWludCBuY3B1cyA9IDE7DQo+ICsJaW50IGMsIG4s
IHM7DQo+ICsNCj4gKwl3aGlsZSAoKGMgPSBnZXRvcHQgKGFyZ2MsIGFyZ3YsICJiczpyOmYiKSkg
IT0gLTEpIHsNCj4gKwkJc3dpdGNoIChjKSB7DQo+ICsJCWNhc2UgJ3MnOg0KPiArCQkJc2l6ZSA9
IGF0b2kob3B0YXJnKTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2UgJ3InOg0KPiArCQkJ
cmVwcyA9IGF0b2kob3B0YXJnKTsNCj4gKwkJCWlmIChyZXBzIDwgMSkNCj4gKwkJCQlyZXBzID0g
MTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2UgJ2YnOg0KPiArCQkJbmNwdXMgPSBzeXNj
b25mKF9TQ19OUFJPQ0VTU09SU19PTkxOKTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2Ug
J2InOg0KPiArCQkJYnVzeSA9IHRydWU7DQo+ICsJCQlicmVhazsNCj4gKw0KPiArCQlkZWZhdWx0
Og0KPiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4gKwlpZiAoc2l6ZSA9PSAwKSB7
DQo+ICsJCWZvciAocyA9IDQwOTY7IHMgPD0gIE9CSkVDVF9TSVpFOyBzIDw8PSAxKSB7DQo+ICsJ
CQlpZ3Rfc3RhdHNfdCBzdGF0czsNCj4gKw0KPiArCQkJaWd0X3N0YXRzX2luaXRfd2l0aF9zaXpl
KCZzdGF0cywgcmVwcyk7DQo+ICsJCQlmb3IgKG4gPSAwOyBuIDwgcmVwczsgbisrKSB7DQo+ICsJ
CQkJc3RydWN0IHRpbWVzcGVjIHN0YXJ0LCBlbmQ7DQo+ICsJCQkJdWludDY0X3QgY291bnQgPSAw
Ow0KPiArDQo+ICsJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsICZzdGFydCk7DQo+
ICsJCQkJZG8gew0KPiArCQkJCQlmb3IgKGMgPSAwOyBjIDwgMTAwMDsgYysrKQ0KPiArCQkJCQkJ
dGVzdF9leGVjKGZkLCBidXN5KTsNCj4gKwkJCQkJY291bnQgKz0gYzsNCj4gKwkJCQkJY2xvY2tf
Z2V0dGltZShDTE9DS19NT05PVE9OSUMsDQo+ICZlbmQpOw0KPiArCQkJCX0gd2hpbGUgKGVuZC50
dl9zZWMgLSBzdGFydC50dl9zZWMgPCAyKTsNCj4gKw0KPiArCQkJCWlndF9zdGF0c19wdXNoX2Zs
b2F0KCZzdGF0cywgY291bnQgLw0KPiBlbGFwc2VkKCZzdGFydCwgJmVuZCkpOw0KPiArCQkJfQ0K
PiArCQkJcHJpbnRmKCIlZlxuIiwgaWd0X3N0YXRzX2dldF90cmltZWFuKCZzdGF0cykpOw0KPiAr
CQkJaWd0X3N0YXRzX2ZpbmkoJnN0YXRzKTsNCj4gKwkJfQ0KPiArCX0gZWxzZSB7DQo+ICsJCWRv
dWJsZSAqc2hhcmVkOw0KPiArDQo+ICsJCXNoYXJlZCA9IG1tYXAoMCwgNDA5NiwgUFJPVF9XUklU
RSwgTUFQX1NIQVJFRCB8DQo+IE1BUF9BTk9OLCAtMSwgMCk7DQo+ICsJCWZvciAobiA9IDA7IG4g
PCByZXBzOyBuKyspIHsNCj4gKwkJCW1lbXNldChzaGFyZWQsIDAsIDQwOTYpOw0KPiArDQo+ICsJ
CQlpZ3RfZm9yayhjaGlsZCwgbmNwdXMpIHsNCj4gKwkJCQlzdHJ1Y3QgdGltZXNwZWMgc3RhcnQs
IGVuZDsNCj4gKwkJCQl1aW50NjRfdCBjb3VudCA9IDA7DQo+ICsNCj4gKwkJCQljbG9ja19nZXR0
aW1lKENMT0NLX01PTk9UT05JQywgJnN0YXJ0KTsNCj4gKwkJCQlkbyB7DQo+ICsJCQkJCWZvciAo
YyA9IDA7IGMgPCAxMDAwOyBjKyspDQo+ICsJCQkJCQl0ZXN0X2V4ZWMoZmQsIGJ1c3kpOw0KPiAr
CQkJCQljb3VudCArPSBjOw0KPiArCQkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywN
Cj4gJmVuZCk7DQo+ICsJCQkJfSB3aGlsZSAoZW5kLnR2X3NlYyAtIHN0YXJ0LnR2X3NlYyA8IDIp
Ow0KPiArDQo+ICsJCQkJc2hhcmVkW2NoaWxkXSA9IGNvdW50IC8gZWxhcHNlZCgmc3RhcnQsICZl
bmQpOw0KPiArCQkJfQ0KPiArCQkJaWd0X3dhaXRjaGlsZHJlbigpOw0KPiArDQo+ICsJCQlmb3Ig
KGludCBjaGlsZCA9IDA7IGNoaWxkIDwgbmNwdXM7IGNoaWxkKyspDQo+ICsJCQkJc2hhcmVkW25j
cHVzXSArPSBzaGFyZWRbY2hpbGRdOw0KPiArDQo+ICsJCQlwcmludGYoIiU3LjNmXG4iLCBzaGFy
ZWRbbmNwdXNdKTsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiAt
LQ0KPiAyLjM0LjENCg0K
