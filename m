Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197A2C83F22
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 14:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B9810E367;
	Tue, 15 Jul 2025 14:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hw1XaTBe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC2D10E367
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752591217; x=1784127217;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=okRtrJr6xc8YXrBZ2wgNy4ihx4WcWPZ9o6pm+nDTKIA=;
 b=Hw1XaTBe6F1ZA+qa5mTWBUiPF94gPnxfFdmyUl9FV0dsfVuD3A9QgviV
 KBMatVv17dl+oC/QUJsR5i6jdofaKmesbnihe3G8b5C/LCOmYsT1ci3Md
 w4UUcnduwRHodAMoQjhUQFrOMJPJLDq/KfrG++CFDFOyJ7qCBhJoiQmRa
 LU7GElVoVLyzA/ox6unY4ChTqWil/OI2VJTxVGwQtsMFhm13zCcqxpsFC
 4MNh3Gxw66c8b0KLpVBsbe9M5RYWxsXqpw1+csUyoEVZt7tQQTm6r2IVO
 Z8hSvLxT2EnNFdwzcZW4+C8aaeA6I0E05M3dO/ZKrrGmwpwDJic/Ptk1E A==;
X-CSE-ConnectionGUID: cSFWh8M2RcGIfvy11GCPKw==
X-CSE-MsgGUID: TY7OzFRLSrWmL0qjAi5PWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65384633"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="65384633"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 07:53:36 -0700
X-CSE-ConnectionGUID: 2NLIue0EQIKQyObbgYUGUQ==
X-CSE-MsgGUID: CREsria+SXKbefsbtMV22w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="162885040"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 07:53:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 07:53:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 07:53:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 07:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJnEc5x+kdQemqpFkM09LA1XiyLeMZRE7U38Y25gDF5iNC/B30aHTs43pqrUJtBJHbau4+LmIIWEyFh3OEkw1h/HCLptPB8/Qe2g4kHgmyGq+7vEl947Pwkp5g4JN/vnxtVMWCynu6twm75aO9MLDnFDbdWyVPPdhhHR9cW4C+oCM8l8Xr3U4JeNbariWplQioT2RgoeqBIK3IdORhgVF+c+U0PaItotxhpoLsirKOkoSAVzqZhk2Yz0cU4jPSKI7qAwVb7NeVCwerWXrDeVjN4GNwvHv+ACMU/4p/7v4Cx0aTqhzWGTR21mo/UwmsYzEVHlKNRbpPwwAK60R5GXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okRtrJr6xc8YXrBZ2wgNy4ihx4WcWPZ9o6pm+nDTKIA=;
 b=VJLItXHOR0B7YSQD81QvKxljGveDB1K7xiCE4N7vSYS4TT4vQI1CyJucFKBLMpZhyGvPwxb6q6TG9lnH8ZlZNkMM8ckr10gouPQnNGvcvgj0bxcMwssDCzsLFaZUdDErG0u24DI+M70CQGIvhzKxjsdBRqrK3K51JEif54wNZlOItBjrn/BSDqe7YIRcVmf+gbfkc/Hs7PG46ljxjsdZM3WuC+YeVnwA0tvKVOLNWlt2zlsFBJP/hA4TpNjYkEd03BXIHKm3r018OltgKQAppb0lP8wVDl2uFIBBief4be8wBxutYP5Yeuqxn4ZfoylRced/EHC8Ssq30OXEP88U3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB8204.namprd11.prod.outlook.com (2603:10b6:8:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 14:53:27 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 14:53:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Samala,
 Pranay" <pranay.samala@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Reduce test
 complexity for simulation
Thread-Topic: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Reduce test
 complexity for simulation
Thread-Index: AQHb8jl3VwBawQC1m0CyM4l9D0nPobQzPm0AgAACNcA=
Date: Tue, 15 Jul 2025 14:53:27 +0000
Message-ID: <CH0PR11MB54442BDB9C3028D1BDFE1D45E557A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250711080458.1218533-1-pranay.samala@intel.com>
 <8fd92947-a1f0-45dd-828b-49c6aa65997b@intel.com>
In-Reply-To: <8fd92947-a1f0-45dd-828b-49c6aa65997b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB8204:EE_
x-ms-office365-filtering-correlation-id: 9c583b3b-6552-4caf-561d-08ddc3af5b38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VnVSTmZzYmVMWDdLTFFHNmhQdkRQMTdKVk5zMVhFbThBaWp3dUFYaGxFbWRN?=
 =?utf-8?B?bllrdmlpcGJZdVg1WGwyM3FESUJrMmdNNlAyZ3lDUkNONFF6WkRxTlZHRVp2?=
 =?utf-8?B?ZEs0TXNjNWZNWkVnZkdzYmIwT05xdUs2aGhQZmlWbStwQnkxSDJVeHFyVm5N?=
 =?utf-8?B?YVN0aXYyWG5yZ2JUdytlcW9Iam5kc3Yrd3gyb2JaR29HbHJtbTNZaEhINmt0?=
 =?utf-8?B?QlZENmsyY2s2WTJhYko3Q0R3VE1JcXFwNDZ4YzBOeHU5VkJHNTZXaCt4eCtt?=
 =?utf-8?B?bmNWemxUVnBXRlNKb1Z3TjJQRXJMMEdUM0RadTBvRUNsNk1aMWtHN2VOQWdR?=
 =?utf-8?B?aWlLU0h2Lzk1MjYyT3l6NEZiQ2EzdXAxN0VhYUNMdUsvc1dycEFBYVRmRE9o?=
 =?utf-8?B?blc1WGt0QW5Na0Nya2V6SmVvUjVaY3E0UjVMR3FncFYyZ0RQQk5rbEtUZThx?=
 =?utf-8?B?UzVRekFJTFJHTVl4WUovdWRsLzRCMkUrbHkveGd2RmJPaWdSa2VpL0hWa3oz?=
 =?utf-8?B?S3lRZWpIMmJFT1k0VUJwVS9EbDQwNnAwREhZMGtiVTNZa2pFOXpMUlMrZlRY?=
 =?utf-8?B?VGNBQmoxUDRYWmM1SFRxVWJXc2o1ak9LYms2MUtGN2oxa0N5RmVtWEZManhy?=
 =?utf-8?B?b2xTRUFzbm1MWHdKQUdPSExCTWhQak1BSzR2QVRlTW9lWlM1WmNIZ24vNWM5?=
 =?utf-8?B?dktvRjQrOC9EakVxWFdnZ2k3VnhMVkxkZVhYcUtZLzlsOUdpOXN3MGlhS0Jw?=
 =?utf-8?B?K042bkYvek84RFdwT2xIelhYN0NNbTNFSkwzREZwcnF2U3pyRzN2UlNSQll1?=
 =?utf-8?B?YmNicW1iYUZkaFBxOFJTQmpsRW5LcnR1M0RkOWlZS1BhTytrYWhLemRXcmYy?=
 =?utf-8?B?VjkyOWNVU2ZHd3hVSEl2OUJzQzRxNCtXRjM1aTBza3BYUTNPQWZ1SGliK1dK?=
 =?utf-8?B?ZUpSQzIrRTVUR1FLdUVDakxQZDVTTlBKVlJMME9EQitLby9NSStEdVhTMHZk?=
 =?utf-8?B?M3hWbmVzS044RmJxalJVQ3MwZ3VUM3J1aGo5Vm1Qb3d5MnN2M3ZXUWZkR2Rq?=
 =?utf-8?B?RjFxejZJVm8ramVKalJkdVFUOXlHWjZ5MjZic251Vm9iSUc1QkdJdmNCOVhN?=
 =?utf-8?B?bU8zVTlmSXhZR3d5OVVHK09ra0IwUWV1c3AxcGYwYzNxRU92YUxQVkt6TGFo?=
 =?utf-8?B?VmtXTUNHZHlDbkZNNTZFR3ZnaGg1Q2VLQlp3RUc4c3hUVTQrWG9CckhHMC9B?=
 =?utf-8?B?MEszclNKTG5XZDRaeTJkQVVWRUNhc2ZtcXY0SGJOUzA2N25lUVdiUnByUHZS?=
 =?utf-8?B?MzVDMVF6Z25GbDNMNHQrbkp3bVlrRlRKa3VGNGY2WTQwZERIeG5hR2NOOXhY?=
 =?utf-8?B?M3FSdFdQZDNyZzdCVm8vNzB4NXNnWkRQaUlWUEMzR3lUZkE1WkFDWVNybkFB?=
 =?utf-8?B?MTMydDlYaXFUZzZFQVVnSS9SakZOQnBjNVFxWUptR09Vc29QTWdaY09JOGlm?=
 =?utf-8?B?VHdMOEF4NGZPM2crbStQWUNMN1AydTRoZGFvekZxMWZuMVNBbWQvUUt3Y3Uy?=
 =?utf-8?B?QWZEejRHUWM0OXBtUVVJS09ZWVZDMzNjWmpmSk45cG50QXR4eUVzN0xlSWt2?=
 =?utf-8?B?azliTnVIcGVQY01qSW9ocEJuRnVZODBnQUJralEra1hiUHpFL0Y2UldBbWo1?=
 =?utf-8?B?VmVJREd0N0Fwck5Sb3A5UWg0WkFOcG1IM0FwTEZYTm81NGo3UWpGSEhNUjF3?=
 =?utf-8?B?MzRQbVpoYy9aRmtJNTdVWnZxMUpDTW9rVzdVaEE0QTJCNjJhc1lPK0ZiTXRz?=
 =?utf-8?B?UENBTVUzUjBkYmNSclZ1bVJDTVlZdTBDMCs0cGUxN0FFL1kzN3Z0TWc1RGFI?=
 =?utf-8?B?bXJLYXcwdVd4QnBDaG5DQmt6Uk45OXMzYVpxMmdZeTJRclpvVlBiNHdrRVZF?=
 =?utf-8?B?MEtQNUdVVTlnczFBT1pFT1VPT2NmbFVPbGtQK1ZIRmhrWWVYYnJweXJFenNL?=
 =?utf-8?B?WHdOVWRmdGpRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUlUczdkaVBRZjBNVnRlbVZYc21vTGdua3RkSmQ0R1pvNXU0QkEzRjhmZFpT?=
 =?utf-8?B?dWlDUTB1TkZuSkY5TjkwK3V0NGdWSzZMVnc1TnpVcllHZkRLNFdHZldVcFJY?=
 =?utf-8?B?SWY2aGhIQVBZWjVVRFY4YWh2TnFqQkZGa01vdkFxZ2J2YVM1MVVUTnJRUU5n?=
 =?utf-8?B?QjExSUgwTXpZZXFvQmxjSjAyYXYrUFdHUm9YTVZ5djl1Vndma2hpMXNvbDh2?=
 =?utf-8?B?clQ2MmpLUUpIeDBPUWtSWlVEaG9SV04yeWpFdWRCWHZUYUFmY2R2bEQrNnps?=
 =?utf-8?B?dXNyN1pSSnJNVkFhcUJRRWlVMHBhdUdyTDhCNjlTS1RWUEZSZEZtSFg4ZEhE?=
 =?utf-8?B?SmFaeGhlYUdoUUltcmliYnpLVDhZR0NRWmFvM0UyZ2hjVlE5WWtWWFJnRTEw?=
 =?utf-8?B?WGEyRTJpMnBtemJnYmVQamtwTXJLNFlBcW9vWFVqUlNLdWJZL0dRbXJvOUk1?=
 =?utf-8?B?R2ZXcTZLNkx3WlltT29kOWRod3ZNYWFUQmxraHYzSWtKV2JDL1MvbUhwL1J2?=
 =?utf-8?B?M3cyOFFFUlVPSmROV0Z1R3lPSFI4a1MzaTZQL2RMZk12TW9SQ29DRlIvbCsr?=
 =?utf-8?B?Z3VCbjQ2TXpxaEE0Wms0TkNQN0Z5OXVkeEEzUFA1MHJ0aWRSRjV2ZzNEclN1?=
 =?utf-8?B?dkREUVh1dThoWEw1YUh6M3p1R2VUWFplQjgzMDZTbTczVkludGVPZ2V0aXVz?=
 =?utf-8?B?MHdHdzd6Y3hwc3A4ZUk3dmcrU0dpNTZmcXI2QTdPUGQxdE1ocHhSR25LdmpE?=
 =?utf-8?B?di9uMGEzSHc3RHlhSERKOUQ1UXo1enFlc3hMM3NUYURJWjJGWXhCQnVzSWlB?=
 =?utf-8?B?aGQ5SjV1aiszZ3dkandkNlZWTHFPNWZra0FwNkh2b3p3eXdkYmdhMG54b1ZH?=
 =?utf-8?B?eHpSQnd6K05lVVB4dyszZnBCc3dObDZyVnpMTE9WSnNsa0YzdEdNZG9aZTVI?=
 =?utf-8?B?cWtFMVlyQmxHemxteGVmSXM2cUtsSzVnNnlEZnpGRng4K1hqTzYzRWdNMEpt?=
 =?utf-8?B?TW5LV1AzN1pmQmhpVW8zV1g1YXE5bE0yOFZPZ0FFSEFWdFFOVmVyZk5CbUpZ?=
 =?utf-8?B?NXc3QUtxMitHdFF3a1JvRVNoYXdkTHM4MVBxVnNNYjNHVnkrU0ZKR1JFUHU4?=
 =?utf-8?B?eXpQRTVhRGtjQ1JoZDdXK0VjakNTbllqR3dGMVR4ZEpJQTlCcUlLQ0hCQk92?=
 =?utf-8?B?dmtyNElVTFJaTmROSEJPZ0JxZ241ZmZMdEd0ZGd4SUNsSi94cFFReUgrM09l?=
 =?utf-8?B?VzAzRFp3a2ZTZmd5SUVkRHkxakZGQWZuNVIxN1RDVTNKbnVvVTBmZkdHYmVK?=
 =?utf-8?B?Zy9ORTJLdFYreUh0RFl2R1pJQUlodkQwOEdaNlNHdmhwQ1hPV0lhZEV6dnpw?=
 =?utf-8?B?OW5lNGE4QUJsaEVydUFsbXY0aUg4N1N6NkcyaUdtU201eXRBM3IrR3QvOWlT?=
 =?utf-8?B?UmMwSU9zUmU3OGgvN05YeGdMemlDc0RkaHF4djloc3RXaHJvWnU5L0dlZk5X?=
 =?utf-8?B?TW92WURMRUVYTDBLNSswanNURFhMbWwzczNqNlJiM2dVNk1kSklxcHpKWExK?=
 =?utf-8?B?R3R5Y3NjUnV0SjJQVnF1WlFOeEg4ajdFb2NFQWRmajJnQU9uRHVJK05wUUVW?=
 =?utf-8?B?WnhGdXZmb2dva0NKY0RtWE5OSVFBRDRHSFloVEtkcXFyREpZb3ZIR21VeDNp?=
 =?utf-8?B?dC9Mak9sUzhCUkR5eTdueCtCRk8rWlNSMk9xMkFteGxwbi9oSG55YmdIeEt3?=
 =?utf-8?B?bmFzcEs1RDNvSGZnMEM5Z2ZxbFVpdS92cExDYmZWazNvbUlXU3lUTWZnd2JO?=
 =?utf-8?B?MFUxSWtRY1VoWnMzUEpEY3hBdmVMaG9Qa2Q5K0Z4d1E3NnRUbDQvQkVrQjUx?=
 =?utf-8?B?UHVlUGlYSDl5cnVDU3NKc3BOaHk0Mk81M3ZtejNraU5qRE96TmVsditEblhJ?=
 =?utf-8?B?dEl4Wm5NNVQ0YnVTZ3ZUa2tZbU8zZ2V4ZjZ4eEY4TmVsa0RIdmxLeGVvLzI3?=
 =?utf-8?B?RGg5SXBYblpJRGZyUE1MZjg3Y3JPS1NPdUptWE9KSDVhME5icDJaRzRsd0lR?=
 =?utf-8?B?RG1wZ2NpRmtOWStoTTVXKzJydEFmNDk4WTVRQ3NwZ3lXa2tKQTJMdHE5Vmw3?=
 =?utf-8?B?Uy9aNnY2LzM4MVp3VEZFSnJKSTR0OEJrbkxEaE9JaXp5TU5Va1NXaE9BNHEx?=
 =?utf-8?Q?U/BzBvSjOUm7YfSdkyssUrw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c583b3b-6552-4caf-561d-08ddc3af5b38
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 14:53:27.3079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ur5H34QDPZ+K2IaPPgpZPt262RSiwjrfkT3CQ73iw9Zis6aUJvdpbSqmf2Yf1d3c/daFnRevZBPsSbFQ+LScQwrqAj95ZCLewQ98LMLETzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8204
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGlndC1kZXYgPGlndC1kZXYtYm91bmNl
c0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBSZWRkeSBHdWRkYXRpLCBTYW50
aG9zaA0KU2VudDogVHVlc2RheSwgSnVseSAxNSwgMjAyNSA3OjA1IEFNDQpUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2lu
dGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZzogUmVkdWNlIHRlc3QgY29tcGxleGl0eSBmb3Ig
c2ltdWxhdGlvbg0KPiANCj4gSGkgUHJhbmF5LA0KPiANCj4gT24gMTEtMDctMjAyNSAxMzozNCwg
UHJhbmF5IFNhbWFsYSB3cm90ZToNCj4gPiBSZWR1Y2UgdGhlIG51bWJlciBvZiBpdGVyYXRpb25z
LCBkcmF3X21ldGhvZCBjb21iaW5hdGlvbnMsIGFuZCBsaW1pdA0KPiA+IGV4ZWN1dGlvbiB0byBh
IHNpbmdsZSBwaXBlIHRvIGVuYWJsZSB0aGlzIHRlc3QgdG8gcnVuIG9uIHNpbXVsYXRpb24uDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUHJhbmF5IFNhbWFsYSA8cHJhbmF5LnNhbWFsYUBpbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gICB0ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tp
bmcuYyB8IDEyICsrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVy
X3RyYWNraW5nLmMgYi90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiA+
IGluZGV4IDY2ZGNkYzI4MS4uNjMxYjEzYWExIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVs
L2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwva21zX2Zy
b250YnVmZmVyX3RyYWNraW5nLmMNCj4gPiBAQCAtMjkwOCw2ICsyOTA4LDggQEAgc3RhdGljIHZv
aWQgbXVsdGlkcmF3X3N1YnRlc3QoY29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCkNCj4gPiAgIAkJ
CQkJYXNzZXJ0aW9ucyB8PSBBU1NFUlRfUFNSX0RJU0FCTEVEOw0KPiA+ICAgDQo+ID4gICAJCQkJ
ZG9fYXNzZXJ0aW9ucyhhc3NlcnRpb25zKTsNCj4gPiArCQkJCWlmIChpZ3RfcnVuX2luX3NpbXVs
YXRpb24oKSkNCj4gPiArCQkJCQlicmVhazsNCj4gSU1ITywgU2luY2UgdGhlIGlndF9ydW5faW5f
c2ltdWxhdGlvbigpIGlzIGJlaW5nIGNhbGxlZCBhdCBtdWx0aXBsZSANCj4gcGxhY2VzIGFuZCBp
ZiB0aGVyZSBpcyBmdXJ0aGVyIG9wdGltaXNhdGlvbiBuZWVkZWQgZm9yIGZ1cnRoZXIgdGVzdHMs
IEkgDQo+IHdvdWxkIHJlY29tbWVuZCB0byBhZGQgYSBzdGF0aWMgZ2xvYmFsIHZhcmlhYmxlIGFu
ZCBpbml0aWFsaXNlIGl0IGluIA0KPiBtYWluLCByZXBsYWNlIGFsbCBpbnN0YW5jZXMgd2l0aCB0
aGlzIHZhcmlhYmxlLiAgVGhpcyB3YXkgd2UgY2FuIGF2b2lkIA0KPiBmdW5jdGlvbiBjYWxsIG92
ZXJoZWFkIGFzIHRoZSB2YWx1ZSByZW1haW5zIGNvbnN0YW50IHRocm91Z2ggb3V0IHRoZSB0ZXN0
Lg0KPiANCj4gUmVnYXJkcywNCj4gU2FudGhvc2gNCg0KDQpUaGUgb3ZlcmhlYWQgZm9yIGNhbGxp
bmcgaWd0X3J1bl9pbl9zaW11bGF0aW9uIGlzIHJhdGhlciBzbWFsbC4gIEFuZCBpdCBsb29rcw0K
bGlrZSBlYWNoIGluc3RhbmNlIHdpbGwgb25seSBiZSBjYWxsZWQgb25jZSBwZXIgcnVuIG9uIHNp
bXVsYXRpb24sIHdoZXJlaW4gdGhlDQpvdmVyaGVhZCB3b3VsZCBtYWtlIHRoZSBtb3N0IGRpZmZl
cmVuY2UuICBTbywgdGhlIGN1cnJlbnQgdXNhZ2Ugc2hvdWxkIGJlDQpmaW5lIGFzLWlzLg0KDQpU
aG91Z2ggSSB3aWxsIHBhcnRpYWxseSBhZ3JlZSB0aGF0IHdlIGNhbiBmaW5kIGEgYmV0dGVyIHdh
eSB0byB1c2UgdGhlIGZ1bmN0aW9uDQp0byBhY2hpZXZlIHRoaXMgZGVzaXJlZCByZXN1bHQuICBT
cGVjaWZpY2FsbHksIGl0IGxvb2tzIGxpa2UgbW9zdCBvZiB0aGUgYWRkZWQgZnVuY3Rpb24NCmNh
bGxzIGFyZSB1c2VkIHRvIHNob3J0LWNpcmN1aXQgc29tZSBmb3ItbG9vcHMgYW5kIGJyZWFrIG91
dCBvZiB0aGVtIGVhcmx5LiAgSW5zdGVhZA0Kb2YgdHJ5aW5nIHRvIGJyZWFrIG91dCBvZiBlYWNo
IGZvci1sb29wIGVhcmx5LCBwZXJoYXBzIHdlIHNob3VsZCBiZSByZWR1Y2luZw0KdGhlIGR1cmF0
aW9uIG9mIHRoZSBmb3ItbG9vcHMgdG8gbWF0Y2ggdGhlIHNpbXVsYXRpb24gcmVxdWlyZW1lbnRz
Pw0KDQpTbyBoZXJlLCBmb3IgZXhhbXBsZSwgd2UnZCBkbyBzb21ldGhpbmcgbGlrZToNCg0KIiIi
DQpzdGF0aWMgdm9pZCBtdWx0aWRyYXdfc3VidGVzdChjb25zdCBzdHJ1Y3QgdGVzdF9tb2RlICp0
KQ0Kew0KCWludCByOw0KCWludCBtMV9tYXggPSBJR1RfRFJBV19NRVRIT0RfQ09VTlQ7DQoJaW50
IG0yX21heCA9IElHVF9EUkFXX01FVEhPRF9DT1VOVDsNCglpbnQgcl9tYXggPSBwYXR0ZXJuLT5u
X3JlY3RzOw0KCWludCBhc3NlcnRpb24gPSAwOw0KLi4uDQoJdGFyZ2V0ID0gcGlja190YXJnZXQo
dCwgcGFyYW1zKTsNCg0KCWlmIChpZ3RfcnVuX2luX3NpbXVsYXRpb24oKSkNCgkJbTFfbWF4ID0g
bTJfbWF4ID0gcl9tYXggPSAxOw0KDQoJZm9yIChtMSA9IDA7IG0xIDwgbTFfbWF4OyBtMSsrKSB7
DQoJCWZvciAobTIgPSBtMSArIDE7IG0yIDwgbTJfbWF4OyBtMisrKSB7DQoNCgkJCWlndF9kZWJ1
ZygiTWV0aG9kcyAlcyBhbmQgJXNcbiIsDQouLi4NCgkJCWZvciAociA9IDA7IHIgPCByX21heDsg
cisrKSB7DQoJCQkJdXNlZF9tZXRob2QgPSAociAlIDIgPT0gMCkgPyBtMSA6IG0yOw0KLi4uDQoJ
CQkJZG9fYXNzZXJ0aW9ucyhhc3NlcnRpb25zKTsNCgkJCX0NCi4uLg0KCQl9DQoJfQ0KfQ0KIiIi
DQoNClRoaXMga2luZCBvZiBjaGFuZ2Ugc2hvdWxkIHdvcmsgZXZlcnl3aGVyZSBleGNlcHQgZm9y
IG1vdmVfc3VidGVzdCBhbmQNCmlndEBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmdAcGlwZS1mYmMt
cnRlQHBpcGUtJXMtJXMgKHRoZSBsYXN0IGNoYW5nZQ0KaW4gdGhpcyBjaGFuZ2UgbG9nKSwgdGhv
dWdoIEknbSBjb25maWRlbnQgdGhhdCBzb21lIHJlbGF0ZWQgd29ya2Fyb3VuZA0KcHJpbmNpcGxl
cyBjb3VsZCBiZSBhcHBsaWVkIHRoZXJlIGFzIHdlbGwuDQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4g
ICAJCQl9DQo+ID4gICANCj4gPiAgIAkJCWZpbGxfZmJfcmVnaW9uKHRhcmdldCwgbTIsIENPTE9S
X1BSSU1fQkcpOw0KPiA+IEBAIC0yOTE1LDcgKzI5MTcsMTEgQEAgc3RhdGljIHZvaWQgbXVsdGlk
cmF3X3N1YnRlc3QoY29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCkNCj4gPiAgIA0KPiA+ICAgCQkJ
dXBkYXRlX3dhbnRlZF9jcmModCwgJmJsdWVfY3Jjc1t0LT5mb3JtYXRdLmNyYyk7DQo+ID4gICAJ
CQlkb19hc3NlcnRpb25zKEFTU0VSVF9OT19BQ1RJT05fQ0hBTkdFKTsNCj4gPiArCQkJaWYgKGln
dF9ydW5faW5fc2ltdWxhdGlvbigpKQ0KPiA+ICsJCQkJYnJlYWs7DQo+ID4gICAJCX0NCj4gPiAr
CQlpZiAoaWd0X3J1bl9pbl9zaW11bGF0aW9uKCkpDQo+ID4gKwkJCWJyZWFrOw0KPiA+ICAgCX0N
Cj4gPiAgIH0NCj4gPiAgIA0KPiA+IEBAIC0zMjc1LDYgKzMyODEsOCBAQCBzdGF0aWMgdm9pZCBt
b3ZlX3N1YnRlc3QoY29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCkNCj4gPiAgIAkJdXBkYXRlX3dh
bnRlZF9jcmModCwgJnBhdHRlcm4tPmNyY3NbdC0+Zm9ybWF0XVtyXSk7DQo+ID4gICANCj4gPiAg
IAkJZG9fYXNzZXJ0aW9ucyhhc3NlcnRpb25zKTsNCj4gPiArCQlpZiAoaWd0X3J1bl9pbl9zaW11
bGF0aW9uKCkpDQo+ID4gKwkJCWJyZWFrOw0KPiA+ICAgDQo+ID4gICAJCS8qICJNb3ZlIiB0aGUg
bGFzdCByZWN0IHRvIHRoZSBzYW1lIHBvc2l0aW9uIGp1c3QgdG8gbWFrZSBzdXJlDQo+ID4gICAJ
CSAqIHRoaXMgd29ya3MgdG9vLiAqLw0KPiA+IEBAIC0zMzMyLDYgKzMzNDAsOCBAQCBzdGF0aWMg
dm9pZCBvbm9mZl9zdWJ0ZXN0KGNvbnN0IHN0cnVjdCB0ZXN0X21vZGUgKnQpDQo+ID4gICAJCX0N
Cj4gPiAgIA0KPiA+ICAgCQlkb19hc3NlcnRpb25zKGFzc2VydGlvbnMpOw0KPiA+ICsJCWlmIChp
Z3RfcnVuX2luX3NpbXVsYXRpb24oKSkNCj4gPiArCQkJYnJlYWs7DQo+ID4gICAJfQ0KPiA+ICAg
fQ0KPiA+ICAgDQo+ID4gQEAgLTQxODQsNiArNDE5NCw4IEBAIGlndF9tYWluX2FyZ3MoIiIsIGxv
bmdfb3B0aW9ucywgaGVscF9zdHIsIG9wdF9oYW5kbGVyLCBOVUxMKQ0KPiA+ICAgDQo+ID4gICAJ
CQkJCWJyZWFrOyAvKiBPbmUgb3V0cHV0IGlzIGVub3VnaC4gKi8NCj4gPiAgIAkJCQl9DQo+ID4g
KwkJCQlpZiAoaWd0X3J1bl9pbl9zaW11bGF0aW9uKCkpDQo+ID4gKwkJCQkJYnJlYWs7DQo+ID4g
ICAJCQl9DQo+ID4gICAJCX0NCj4gPiAgIA0KPiANCj4gDQo=
