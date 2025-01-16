Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBF4C02187
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 21:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F35F10EA19;
	Thu, 16 Jan 2025 21:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tz2xG2pD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1215410E39C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 21:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737064530; x=1768600530;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ZqymhTxr89X9pvRYZhjM+Zyxf24P2nCTUd2AeL/binc=;
 b=Tz2xG2pDPwZ5enEz1B1nW6RWFPwy0Inu8uN5/HXzwCPe01qaog31gRTg
 Vv70en2avZ5zCCtuU9tdmIpcA9W8DyifPBKIuDt9hdxnyFp81dF9DQEdM
 V/3Dy2VH6qYocVSZwlSl7pEOArScq/fqvW4eZ/nlyYMVV6r5ZN3Ucpifb
 qSOaR7mjDteH8GUtiEiGCPqynG/nNKm7W49GPTAAV+d6Hd2yNXRsIDXeA
 GNqz+0BRDfCcGWzsvAzkiFB64Xk3jYDh6oh6OsV0eOYZxb92WClkaiVrm
 2yQA+ZJlS4Ojuh2TBTLA+9840b4Am8DRw/2F+pvD5u3uqXuyoBwdbUT3D g==;
X-CSE-ConnectionGUID: W6W+33uAQIupn7GoBdDosg==
X-CSE-MsgGUID: pDse6t0OS2O0sp4MrDmSgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37714768"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37714768"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 13:55:29 -0800
X-CSE-ConnectionGUID: jilihjA6Swuzn9K4IHsbvg==
X-CSE-MsgGUID: gtynNziNQPOiTDARoBC4HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="110612003"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 13:55:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 13:55:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 13:55:29 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 13:55:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+6hXspwYo+HOz6nI0zu+SOE1qeQUA/Yok2b2b8P8G2+SsnAenc8buvpQIx+CdW3GEA2+AY6kNJAMdGqM0u5x00ycZjKLAScSKI8EM1JcJFF/RkFvEkAbVmRDWAXBmWxOEys8zkZ8bTkgyDcWYWgryv64ROmQg9flNM2vpev7DoG0C7YK7SB3nKxOmtgZIPphIan2F1fAxwY3gpNOXdTKh5jj8ywCNcHOzLB4xvVP1Tt5+O7RhkGQO5ssrSSyroBXfNt88o7Y0OHyS9azXZFhcX8VEHQMrLg8Z8r/yHXKLKH9S+GopqCyxQ9LzrVEv3Bc8mfLpvR+5Kc6fJe+OPnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqymhTxr89X9pvRYZhjM+Zyxf24P2nCTUd2AeL/binc=;
 b=vcJIzQWOlCXSsvX5E8Tw1Rzf9az33xVhwgCGLK188K44YRjkg5nymLlNq3bwUWZcTjXxkiOx/mlo3k/leWSeE+9ZXhIu+KJzfnrFJ6eRq6hTimSwmCTz84zOVKMYZAYFQq67TPan3OeLiDve06WwPRtPDaB1orMnCQlkVjWo9gbHJHBPPM8yIK1j2NHU29dd8PyjJTyk4sopEwBCBHPGFUDUTg3BW8lsoLVhczQXRfGzb8BtJ03MAeP3l+3yV+Jyq0WsWt512Uj/1szlXGXAyRUVrLtwYrutwIBtSeWGaXO0+45lFmuIyzjOjjk8MwimH3nzXFwf6PmJd0UkJEgDWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by SA3PR11MB7415.namprd11.prod.outlook.com (2603:10b6:806:318::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 21:55:26 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%3]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 21:55:26 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t v2 2/9] tests/intel/xe_vm: Update invalid flag
 subtest
Thread-Topic: [PATCH i-g-t v2 2/9] tests/intel/xe_vm: Update invalid flag
 subtest
Thread-Index: AQHbZ6x9cepoWNzWtEi3icljjjZcbrMZ81iA
Date: Thu, 16 Jan 2025 21:55:26 +0000
Message-ID: <10debaf4405cf45996a80cbd18a6064123958634.camel@intel.com>
References: <20250116001951.4159243-1-daniele.ceraolospurio@intel.com>
 <20250116001951.4159243-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250116001951.4159243-3-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|SA3PR11MB7415:EE_
x-ms-office365-filtering-correlation-id: 521258aa-69da-4a5e-3ba6-08dd36787c6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QUhqb1dmT3Y5cVUvM01PRWlyWVBJQmJvOGVpUGJUYWx0UitPMk9YU24yS05j?=
 =?utf-8?B?aFZ4UW5SN1NPNWU3UGZsUVdPTkFVSWhldEIxSEVkNXVRSm8wREhtNVBHTXhX?=
 =?utf-8?B?MXROR09sQkhVVjk2YTBKZG9ieWl1UXJ3UWhucHFsbEF1Sks0ZWVnVEtBaUc5?=
 =?utf-8?B?enFZNmRFbEdMOHRmc0dEU2dMN05qeisyaDdoT1IwRWFXZjMvRFcvc3ZoekRa?=
 =?utf-8?B?NlBJYURKZDBMZVpZV2hZbC9GMEtzcmVMdmhzR0s3aU1BazhxWHJhSHhyVFhp?=
 =?utf-8?B?aGFvWEhhMWN1QTl4bVE4K1J5aXdmcnRPOEZFTUZoNGhlM1EzZ0tEU1Z6ZEpy?=
 =?utf-8?B?TFdvWmgycXVpSUtXZTc5RVN1Y2ZqUCt0T0pvS05rYmpyQXNCQ2ZmLzF1U2F3?=
 =?utf-8?B?UTJVM1NNdGQ2cytsbDIzaExDazlOTzJ3eXNDdnFzRnBrK1BnZEV0VlVTengw?=
 =?utf-8?B?dlNCUEgvUmdEcDRFcURPWTR1cVNHQzBLc05Ua3pOcGFaSVArN3pHQzMvWTd0?=
 =?utf-8?B?YjhBSVBscnEyaml3UnFnVW9ydXBlSlhjSEQrcktteVV4L2s4V21CQWxkUnd6?=
 =?utf-8?B?eTlPQjVXdXltNXRCS3dMWUl3UExnWG1qdTA5TC9QOWhuQ1NUMElZMjRWWHR1?=
 =?utf-8?B?SFV3TkFPTWk4c25GM3lPY01DeXR4bmlkeUZ0eE94UzdjQmNzUkR6TjVXbUJT?=
 =?utf-8?B?YndaYkQ1dWFCQmdkdHZ4T1ZEazAwRDRXYlI3QjhINTY1S3RjTzY4ZHlaekoz?=
 =?utf-8?B?WjZtdzBZRWcwY1RGR0w3eWNGeCt0dzA1TkVDVk56YzgrNlRpeHJNZ3dwSFhZ?=
 =?utf-8?B?THZPSk8zZWtpSFBXOWlUWUJWUUpJMUVRUEFucmRGb3dvMTRmay9YVEZZR3FW?=
 =?utf-8?B?blNmaVZXdlZtdmhQQzVLSnBvZjZMWHJ6TDFSeTVySnV4Q2FaMmhWUlFaSy9S?=
 =?utf-8?B?YWtpTG5vRG1PdGwvb2Z5VWMzanFYN3daMUs0ZDdsUWdqVmx4VDZZNHl3REhJ?=
 =?utf-8?B?UFlKc1EzdFdWN2lkOFM4blhrY3BQN1drY0NzS2toTS9wdXM5TVAvUUxvbmV3?=
 =?utf-8?B?NzBISW5SNUROc0lIVUJ6OTVZTUI1NUJ0aTdsQUp0NUdFcVlwMm1kc1Ridk9u?=
 =?utf-8?B?Q1hka29WWWtIMjluN3lyb0hnNWNiWlFldjlqOWp3bHUrOXNjNFFsSmZ3aHkz?=
 =?utf-8?B?NWxJM3NVd01nM1NpclZsYmx4aWcyc0ZHTkhrcHo2bSt0ZmVETWlEVzJDOEtU?=
 =?utf-8?B?dTVtM0xFN2R1OEVoaDRubFp6NDRPd3BtNlAyM200ZUlTZXNXdllhdUVzZjBi?=
 =?utf-8?B?QTZacmhsRTB0MGYwTGh4ZjVFRGVJMHcvbzNoV2QwMXl5dlp6SGdtR0NwRlhv?=
 =?utf-8?B?UU03UkVmYlhIWjVERVFZeHBqb0VtUjNnLy9VTmhOMlEzVWtvMVpHbi9Icm0v?=
 =?utf-8?B?OHFudnJQaFlDaUVIdUpNazRZWEdoakdiOGdwVUp1NnBUc3F2UWQ4ZUw5R2Rz?=
 =?utf-8?B?WGFvUFA3UURNVk9rVkJwUmhMeGM0RXZIY3FHNTh3OS9ZNkp2UndreVhGdVNn?=
 =?utf-8?B?VnUxMUt3clEyUTQrMzZ6VjBvYkpDcTNWYXY0S0E5eU0xUTF5VXp3bzhMNGR2?=
 =?utf-8?B?bWdRVDA4TVJqVmZhaXo1QWxzT1pxUXhRcU5zRXFLSmhNZUJSQ2xubmRUTlEy?=
 =?utf-8?B?bEtzVnVzYURXMGlMN0xabFJKVmlTMXVhd3VEM2tNamcrckk1d21GRDRURlVM?=
 =?utf-8?B?SjhIUkFzbEFyZkY0UnFiVlNWNDJMdVlGZGs5VXFkWXY5TTROM1lMbUoyWCtq?=
 =?utf-8?B?TGlncEhURlVOZjdtRG8vbzRLNmw3SjJiVWxRSVBMMG1jTGlHbzJXTythbU03?=
 =?utf-8?B?bjNMMXBicVErcUZaMURqUTM1R2x4T08xaWQrTmxBSUNrdDJ4QUZxT05vdnpO?=
 =?utf-8?Q?d7X9mCxvwFmrjFCutmXUF8R6uMYYjBRx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnBUelBUdUlSUHR3eEJkRDJPYWxEQysrMkp6eTlWM0NMcU9NMEZNVkVFRVcy?=
 =?utf-8?B?ZURpdXRqSFZOajNpWjJrT1ZUV0NYQXExSDBqcTJSZmxMekc2cGI4R2JSL0ly?=
 =?utf-8?B?K25VN3hyYXRzd3kra1crTUhVN0NCbnlBL2dEKyswR1JzU2wxZnk4ck8vWmIx?=
 =?utf-8?B?a2NUaWszdFQxVWhFQ0gwb1FQWThYMVJzYlRjeXowR2tIU1NYNllpcjRqbVpw?=
 =?utf-8?B?NVF1WU8vM1F3c1NiQTd1SFR5Z0Z2bVNySzJtMDd6Ukt1WmY2RENaemFHanNQ?=
 =?utf-8?B?ek1HY29TY2ZFZUFpRUV2VkxrcTl4VWRUbUhGR3BsVDlRY3gyZG5ObHo2cDc5?=
 =?utf-8?B?emx4K2JXOVFwbTRtb3lGYW9OZWxoazg3cmJ5NXN1RElWTzdhejNORE80dlJw?=
 =?utf-8?B?UXZzc3ZXeGl0VmhtTXVBTVVhYUdiSlJKbGZGS1VPa0xsODNrNmtwZndiYm45?=
 =?utf-8?B?NmlzeGdid0ZZcGFFR2p5SS9ldXlMc21HQ3RUaVBHcWVYN1dtRTgwRlAwZ2xE?=
 =?utf-8?B?bnM4R1lhQllyUDJWazhnbmh0RHZZZm5reFFDdHJ5cm1XUFdOd2J1VGRRcHVx?=
 =?utf-8?B?UlkzU3piYktscmtmbGxxKzIxQkllaDJPSzhteTA2Rm1uSjQxOWwrNGdLaG1S?=
 =?utf-8?B?YXZ0SlRRUjRYRGFXM3N4ZmRia2lraldmRTk1RW5LWUdXZ3dpdjNVV0t2WGlq?=
 =?utf-8?B?bVVvK0hqVnRSaE9qMEhwUDVqUFNzQWZXWXd5SWVtbDdHTHRrZlU0cnUwSzRU?=
 =?utf-8?B?cnVGY04xL29uY1FpSlBUckFFaGthb2pCVkZuMUlMOW9xRS9RZENKeGZtU2lY?=
 =?utf-8?B?aE11Z083emZ5SFE1SHNmVXJXWjI0UWN5YTFqajRZWU9rMTRDQXhvRE9GYUE1?=
 =?utf-8?B?Y1BJTENXWGVNL0pITWhrMTlaTHpvcFdvbElyV2t2Ti9VQjhzRks2TDZQNlhp?=
 =?utf-8?B?WEppeXpTWWlOdWF0WmFmTFcvdXk5STIvVm1MU3Z6UWpxR2xaMDhUTFhCd0NQ?=
 =?utf-8?B?N0FHcnQ3dklzVnV6YVlwZUliV1BRbUdJQzF1elI5R3p2WGZpcVVUNkYrT2Nt?=
 =?utf-8?B?K3ZlQjd0NWRTOWVNOSt4Y3hBMGIzWEFIeThRSFRiVUtqV0N4QVE2bDgyUTFs?=
 =?utf-8?B?QzlMeTZ5blloZzFTazZYdlNNSWlYWHRpU2doTEV3VVVKaDRGMEtHT1RHdUJ2?=
 =?utf-8?B?QkJ6ZWxFNEhiZ0hiQ3I5WWtOMFJ2MXgvbHptNzl4TU9TUVp6WGFXOGNob3Jp?=
 =?utf-8?B?dWNrZnU1UVp6bzZ1eE0zeDl0bWFOTmVyMW5rRW1vaTBFZE5BVmRXaWdndnBZ?=
 =?utf-8?B?ZUZ0L3NGQW52SU9rU1RwZGJHM09PanZ4bDhQbUpFT1BacG56dnBnaHhtRkdF?=
 =?utf-8?B?U0tGUC9FVXc4QTR1a0RlYysrVE5HWDloS2Nza0xabmhOeXVxc1E1TUJnVEYv?=
 =?utf-8?B?cFBpTlhDY2NudWw0dDJkVHRVUzBURGFTZk5pSU04Q2lWOGM0WEpmZnliOUp3?=
 =?utf-8?B?cjkwMHppUnZNSWZPQ29wTm9pbUF0eDBVN3ZHZEtiSlFvYXR5R1NiT1haSzFk?=
 =?utf-8?B?TG8wZjZwRzZEa090ODF5ZmY1TlZvdS9lbzVCa2ZFSEJ6VStScDhRTmJqdFl6?=
 =?utf-8?B?MXZxUDhlRHBsSndBeG1BMk9ZT3hPbmdhUVBhSlI4U1lrMkFRVFVKUWFGTkFI?=
 =?utf-8?B?VG1XbzBqclhvaThFV2NhajV3OEhxQ2dRV0VEWkZPd2YwemxEcmNEdUNTK09n?=
 =?utf-8?B?VkJnVUxLZjEyVlFWZWZlWVVYYUNwY29UbkgwKzJocDUvb0FldEg1R1pQUkZX?=
 =?utf-8?B?TjM4dEhHcjRCbVkzbVJVbHpKdFFsUGJaOGMydDdCTDlFMG5ld2lrSi9NVlRm?=
 =?utf-8?B?bXV1eXZMblNGUEgyUzZzZ3QzVzF2dmc4VWwwYjFNc1BjMTN2REx6cFRlQ012?=
 =?utf-8?B?T3NhQ2lXcDZyMkhFaHRIVFp0dXAvYkttaG13SHl3SHJuREhma1huRENUSW9C?=
 =?utf-8?B?VDdXckVVWU5MSWdpRGZTSUZZT2RlTktJUGpyVWpzN0JTVS9WeXFqbVdXY29J?=
 =?utf-8?B?QkZTcU81TnFQMXE2L25hM3RmY01qK2dYd0pPRWJ6NTVUbmM4YU84NkUwanZp?=
 =?utf-8?B?Qjlkd2RuYmIxVjJYNndxZVVJWTZlcGk2U1FzRFp0M3pPQ0I4V2tFRWd6T1gz?=
 =?utf-8?Q?yiUghjNHNfu51GLLwPyU3PI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DB1CAC45B26D64685BAE6D580A92349@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521258aa-69da-4a5e-3ba6-08dd36787c6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 21:55:26.7560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J1ZPikp8evQdCEFuLaD/DYVtOa5Lfs5AjTj/BynOh9dDqbaBU7uEofJkxHsZ09LOwumpCjYDVsPyvlJkPaFSP7aynlZ6YpGVofZwMjPgAoLSzjuNn+eqoO/JbYf4jDN5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
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

UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPgoKT24gV2VkLCAyMDI1LTAxLTE1IGF0IDE2OjE5IC0wODAwLCBEYW5pZWxlIENlcmFvbG8g
U3B1cmlvIHdyb3RlOgo+IFBYUCBpbnRyb2R1Y2VkIGEgbmV3IHZhbGlkIGZsYWcsIHNvIHdlIG5l
ZWQgdG8gYWRkIGl0IHRvIHRoZSB0ZXN0IGFuZAo+IHNoaWZ0IHRoZSBmaXJzdCBpbnZhbGlkIGJp
dCBsZWZ0IGJ5IG9uZS4KPiAKPiB2Mjogb25seSB0ZXN0IHRoZSBuZXcgZmxhZyBpZiB0aGUga2Vy
bmVsIHN1cHBvcnRzIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVy
aW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+Cj4gLS0tCj4gwqB0ZXN0cy9pbnRl
bC94ZV92bS5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrLQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvaW50ZWwveGVfdm0uYyBiL3Rlc3RzL2ludGVsL3hlX3ZtLmMKPiBpbmRleCA2ZWUzZjQ2MzQu
LjQwZTkyZDgwNSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV92bS5jCj4gKysrIGIvdGVz
dHMvaW50ZWwveGVfdm0uYwo+IEBAIC0yMTczLDYgKzIxNzMsMjIgQEAgdGVzdF9tbWFwX3N0eWxl
X2JpbmQoaW50IGZkLCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLAo+
IMKgwqDCoMKgwqDCoMKgwqB4ZV92bV9kZXN0cm95KGZkLCB2bSk7Cj4gwqB9Cj4gwqAKPiArc3Rh
dGljIGJvb2wgcHhwX2ludGVyZmFjZV9zdXBwb3J0ZWQoaW50IGZkKQo+ICt7Cj4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgcXVlcnkgPSB7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoC5leHRlbnNpb25zID0gMCwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLnF1ZXJ5ID0gRFJNX1hFX0RFVklDRV9RVUVSWV9QWFBfU1RBVFVTLAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuc2l6ZSA9IDAsCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoC5kYXRhID0gMCwKPiArwqDCoMKgwqDCoMKgwqB9Owo+ICvCoMKgwqDC
oMKgwqDCoGludCByZXQgPSAwOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZiAoaWd0X2lvY3RsKGZk
LCBEUk1fSU9DVExfWEVfREVWSUNFX1FVRVJZLCAmcXVlcnkpKQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXQgPSAtZXJybm87Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBy
ZXQgIT0gLUVJTlZBTDsKPiArfQo+ICsKPiDCoC8qKgo+IMKgICogU1VCVEVTVDogYmluZC1mbGFn
LWludmFsaWQKPiDCoCAqIERlc2NyaXB0aW9uOgo+IEBAIC0yMjIxLDYgKzIyMzcsMTMgQEAgc3Rh
dGljIHZvaWQgYmluZF9mbGFnX2ludmFsaWQoaW50IGZkKQo+IMKgwqDCoMKgwqDCoMKgwqBpZ3Rf
YXNzZXJ0KHN5bmNvYmpfd2FpdChmZCwgJnN5bmNbMF0uaGFuZGxlLCAxLCBJTlQ2NF9NQVgsIDAs
IE5VTEwpKTsKPiDCoMKgwqDCoMKgwqDCoMKgc3luY29ial9yZXNldChmZCwgJnN5bmNbMF0uaGFu
ZGxlLCAxKTsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoGlmIChweHBfaW50ZXJmYWNlX3N1cHBvcnRl
ZChmZCkpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYmluZC5iaW5kLmZsYWdz
ID0gRFJNX1hFX1ZNX0JJTkRfRkxBR19DSEVDS19QWFA7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX1ZNX0JJTkQsICZiaW5kKTsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydChzeW5jb2JqX3dhaXQoZmQs
ICZzeW5jWzBdLmhhbmRsZSwgMSwgSU5UNjRfTUFYLCAwLCBOVUxMKSk7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHN5bmNvYmpfcmVzZXQoZmQsICZzeW5jWzBdLmhhbmRsZSwgMSk7
Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgYmluZC5iaW5kLmZsYWdz
ID0gRFJNX1hFX1ZNX0JJTkRfRkxBR19OVUxMOwo+IMKgwqDCoMKgwqDCoMKgwqBiaW5kLmJpbmQu
b2JqID0gMDsKPiDCoMKgwqDCoMKgwqDCoMKgaWd0X2lvY3RsKGZkLCBEUk1fSU9DVExfWEVfVk1f
QklORCwgJmJpbmQpOwo+IEBAIC0yMjM0LDcgKzIyNTcsNyBAQCBzdGF0aWMgdm9pZCBiaW5kX2Zs
YWdfaW52YWxpZChpbnQgZmQpCj4gwqDCoMKgwqDCoMKgwqDCoHN5bmNvYmpfcmVzZXQoZmQsICZz
eW5jWzBdLmhhbmRsZSwgMSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgLyogVXNpbmcgaW52YWxp
ZCBmbGFncyBzaG91bGQgbm90IHdvcmsgKi8KPiAtwqDCoMKgwqDCoMKgwqBiaW5kLmJpbmQuZmxh
Z3MgPSAxIDw8IDQ7Cj4gK8KgwqDCoMKgwqDCoMKgYmluZC5iaW5kLmZsYWdzID0gMSA8PCA1Owo+
IMKgwqDCoMKgwqDCoMKgwqBpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9YRV9WTV9CSU5ELCAmYmlu
ZCk7Cj4gwqDCoMKgwqDCoMKgwqDCoGRvX2lvY3RsX2VycihmZCwgRFJNX0lPQ1RMX1hFX1ZNX0JJ
TkQsICZiaW5kLCBFSU5WQUwpOwo+IMKgCgo=
