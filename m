Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684FCCA0EEB
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 09:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE40110E0D1;
	Fri, 22 Aug 2025 09:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzSAho59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8C710E0D1
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755856065; x=1787392065;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZY3UmGr0xnSidxqQjp/vHAQmxo8AOaCf1G2N+Tup4wk=;
 b=DzSAho59uv0k3rS0Azu/cIDlN5ELK+FCy1E06DojHXzLOFmwRU2HClt8
 GWO7Fb8rRAsYlxksg1SDu6K5QZgv5zm92Jc9aEg9ScVLQBS01na9HJ/4x
 VaBcU2PU65MpHFbs8ZBbHyDyXbB1MC3oBZjCv7OqkQhPkgFPub5lDRpuE
 mYIaKjbTyAaw7gp5aTmUPQ8CO8zbJ9deu8/NY87YFOdUsStIXvVQoca6U
 /ryN3CTIGfvdeBH0d4HHRrAVxrtVK9bMD+2m1ouPiI5vGrUiU54CnnuBy
 0sEtzFGgVaMnh8Akltrn9D918Es1Tejjo+GRxiURnOGK0IiUtWXesp8Lo Q==;
X-CSE-ConnectionGUID: 33zZ7VVYS7iwRTmpVpRhZQ==
X-CSE-MsgGUID: bkaAtVPKSvm0DWNAu6vFAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75617562"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="75617562"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:47:45 -0700
X-CSE-ConnectionGUID: tIc8L695RkWjbHKqGTV35A==
X-CSE-MsgGUID: kvog8OOMSvG9p0oiIH9cmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="173986898"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:47:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 02:47:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 02:47:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 02:47:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmqKfttHxFAnFHlFyDzipjItiRNxLy4DJ1/jMjSmalOvKV0FXbWMi0/teYmNvDS2l8Cfsss7BPF9ZbqXNXMNBnZf3UpguQ2PRY0HvlGVf8baOjX6/L5uEHC77WdRaF8rADQkkLZ9I6vQnd1OK/DEO9yA2RIvnOVuWDkgGYig/1AXIY4hdQA4fBsdr3NVYcIN00oqK5kxymL+Ix64azy64TTTiWmIcoW8HHbrvvveVMwYB9LmPVmV9JGH+xqokishiHidyojt56fvo3t6HwC8wYPO2mJLrrCaS8IjqWcKU5k5PMhL4oJwpHeesJaeBWZVL9E7o1qeeGJkqN0h7c7m2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWOH6awQxA9FWI2japALTwocaOWm1ZIr+TqkuSvyv/E=;
 b=Nm0/A9FTIdvg/3ADFpmGtwHXR9NEJjwdjQY2MWK0vaXs+RtvDADKXOtIr+8QRo6HllpqBwSIF79/f7DmiR87dQLiVyCSCjRQx2Ssrx1/GutE8Ar0oKo+Q6B2lbAEXthvvyDW8YPHfZlTxWYXuaxOmKp7lqBxRPAT0WEEKQfsvycswpYfE0rU9I3Jpwj+TG6Myt9WbBm2wFHBOYe9s7zm0ZnI251GPbdZaUElLEnfJiT0+x9fBzYMMGN1Dbxmkav6jDoplGb4P/hdd/u/1r5p4glTYp3kMEius7UyNPA4xTlzSmlizEHWThEF64hxVfqTF6x3gde2vmVYm0o/B5YdUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Fri, 22 Aug
 2025 09:47:41 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 09:47:41 +0000
Message-ID: <82bd517f-f746-4c9a-b6f9-e828d9e16a58@intel.com>
Date: Fri, 22 Aug 2025 15:17:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_flr: Handle missing
 provisioning data per-GT
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250822093908.414306-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250822093908.414306-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::17) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|DM4PR11MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e62c446-c267-4c1e-c65b-08dde160efc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTU0cFp2QURraUFIMlorOFdHTE1udW9LUm9VcWxJRFlXR1phNS9uSzlZdk9w?=
 =?utf-8?B?OS9LNGNvZjNRc3JHRmMrYzdveEpKeXVsQ0dMbThiYXk4NUdnWVhvbFAxVDFX?=
 =?utf-8?B?Z2lVWmpEemJybFBnLzNGRkhzMUhvWlpxL3dSUDQxVWpMdCtYKzUyeDdXcnRp?=
 =?utf-8?B?OVlieDlQaWlLN2RqMmNlYitkZnRoTGdZdWhLeFhJaUtKMDkzSEVQSnVNL3Aw?=
 =?utf-8?B?WkxZc2JONDNubm1YejN0T3lEbGtheURnN1BjcWFzeUVxUDVzb2JlVHNNVGpH?=
 =?utf-8?B?Y0NzNnBPTjdqSlRRd09YaXlUUmEwZjY5THo2VUcvdWk2dDh0eGRMZ2pLSHpV?=
 =?utf-8?B?Rk5HQTlMaGt4RzhSWFJQZjZPamJZRXM4Tmt3VitsWGtOcHBZZitEUnJqM3pC?=
 =?utf-8?B?L0JjSm94R20zaDB6eHVsUEFpeXlnQ1QydTcvUS8rcE9aUDRScEprYklPQkhq?=
 =?utf-8?B?aE5qZlZUTklGWlJyeWhYY3ZQa1ZCQ0NTQ3ROYTM1ZEFMU01LUHJZdnIwV0ND?=
 =?utf-8?B?TXZ5a3dNVmwvemxLVEtHL3JzeHpLN05FVUtWZlpya1dDdkJhWFpWb2lORnpj?=
 =?utf-8?B?Z0pzZERtSjFxM2c3T3JrQXVHQ2hJNnhaR2NjY011QzQ2UzJxVjM3NWFIYTVu?=
 =?utf-8?B?bE54KzI5MFdjejhJWXBCTHgwOXBNL3ZzSm5RTmpSekhNbTlTVlRoZHVldThN?=
 =?utf-8?B?UkFFVHRHeU9wUDROQm1nREtvZTEvenBFTCtDM1RVcWtRRStkM0J4RnZVSFBN?=
 =?utf-8?B?cWs2OWUzUlBHL0NneHNidGtaMUtud1dGOG8zNE40Q21QYzVheWdCNDkreHA3?=
 =?utf-8?B?VFhnbGpsdll5c08xZHQ3c1NQOFpicGY4T0R0R0hsZ21XS3VneTZocW83cUpu?=
 =?utf-8?B?dnZ5NDdoNSt5d3NSaHVIUnRNSmJISFJtdjljQkZtM2lZNm1CWmFpVjlaMGx4?=
 =?utf-8?B?RU02U01UcmFyNUhZUFZGbkt4M1VqSzBoNlJmdUhmY3h5N3gxeVlScDRPbWFF?=
 =?utf-8?B?TUFqS20xT2FoSTNRaGpXd09hZ3c0OCtoZU1vdjREZmN5RGlQV0l4NC9iQlpa?=
 =?utf-8?B?ME9ZMHlTYm5LMDJ5VWp3aTg2eENhWFcweWc0S3lnQWxCUFNBT0hDeFR5cnFG?=
 =?utf-8?B?a2ZJSXEvc1RlSjdwbzFqNjZaeFQ3QzhDTEpwdGpmR2xidXQ3SmNyTHJ6WGRZ?=
 =?utf-8?B?QWoxbUlQbzZFSFNHclMzZkV3MVZGQ3oxQUNDcXJXVWw0OFk2eDVGUGVCQ0ZN?=
 =?utf-8?B?TzJTMSs5SlMzRVlLL3duMi9MSG5zQzcyOWZlcDByVG5QY1Rpc2ZCNUdGZmgw?=
 =?utf-8?B?cUtMMFp3d1hscVA1aEF4SkhOdmREOGtHcWhvVTBoWGM5REFURXU0eGFzQVJs?=
 =?utf-8?B?NzhObEZzSzlsR1F1SzVVVTR2ak4zVVZzQVNqdHpoSUtIUmkxTnlxS3htdUJF?=
 =?utf-8?B?RDNLRStudUhoZHZJcWNIcTR5VUVZczRqbXJMcVJibi9jOFJWY0t4ek5penJB?=
 =?utf-8?B?a0lIODBzSEtZWkE3UVNRWkZVZHREd1ZkNzN5ZTBpek9CVTRtalZERFNnS2xi?=
 =?utf-8?B?ZEpYUERHemRHTlpOVWh6cmR5U0c1ZFRBU2F5UXNKcmdOV1I2NnZ1bkdJdHBC?=
 =?utf-8?B?cm5vbVlJcHk0c0hxWVluWmozUlBvTUhLQWhIVzZZQ29ydFFoQ0VQSWQ4bDZR?=
 =?utf-8?B?YWxINEQ3Q0ZFRkxxQ29EUmo2NmFGQmMxd29ubEkwaU1hMkVMYnp2SUFrbWNG?=
 =?utf-8?B?clFQT0FNSktHMk1zVjUyR3ByRTBWcS9VblFEdlN0VnpiRVZGOGl0UVJxMEhv?=
 =?utf-8?B?cjJNcFR3aEJiem5kYzJaekV1dXk2QVdXbjRpMFRaV1dVekErQ1kweE5HanIv?=
 =?utf-8?B?Tkswa3duTVpXUXBMRy85SStkNTI0N2NieDJUR2dkUmxxTDRjMVVRaGdyTXNi?=
 =?utf-8?Q?YE0+fOzhbcw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVRMT3VreGhyZzFnZlc4OXZqVDRveExOYWdUMG5kOG1lTlovNGxKQzg3UVpB?=
 =?utf-8?B?MXR0RHJHSFc4dzdVUEpMRHlFc1lGSDBGcXBRMUhVUGdsa005d0dSc2p4dXN1?=
 =?utf-8?B?RE5od3lENGtTeTRZYWd3MW04bSthNENxOFBVT01hQmtXM21RTDFXU25SUkVp?=
 =?utf-8?B?WTFhcmtXREsvcEs4dWFRVjZaRzRxcFFWZFRma2hnTE1aM1RVOGFZYUQ3RDBZ?=
 =?utf-8?B?d0daeUNPdk9GMHA0TjBTUGZjYXI3ZE8wVmxld0xwbUtnckR4TUY2K1k5L0pC?=
 =?utf-8?B?M1gzSktqczJvWU9yMVA0V29oRjF6SDNITk4yOVg2ZDdIcVhnV29xVjVoVzdn?=
 =?utf-8?B?RXo1eG1mUk1mZ3lsQU9hNEtRaENCOTcrbWlFMk5yblZwR0hRZ28raVJPUzl5?=
 =?utf-8?B?QzdzZ3VmMHdkMFBweXBuS2ZhdTZWK2JEYm5xa2xKalNjRFowRWNNOC9UMGM4?=
 =?utf-8?B?amVZMUJ4aStra25vdmRKVGt4eWQ4VFNWUS9JWE05d010d3lhZzZJRDRYcGw5?=
 =?utf-8?B?OTNtZEY0UEc0SkhWRmo0a0VpQjhTWVZ1NFFMMk9ERlVIc1o2V21PRVkvMUJm?=
 =?utf-8?B?dy9oVWlxVXVnUFpuZE9Ca2tKNDhUNHBOK1U1T0ZXK1o3d0N2bXZocGxMS0dw?=
 =?utf-8?B?ZDFDYUM5b0JUZGZ5V2hydUszV1VNSjczemludVNrQVZvOGpJWGltTVdKcWQ4?=
 =?utf-8?B?TUlFNUhOS1U2TDJrOC9kaTFneHZrUk9BMzg1RkJkdGtqS3V1MzlhYzZpM3FP?=
 =?utf-8?B?ejNBYXFvMzBTVi9FeS85ODU4TlVIT2N6NklleDlqMFBhWWFEQ3ZZdEVWazRK?=
 =?utf-8?B?N2gvamFHZC84K0E1UHFoM2REWVJIQ3BGMnhnck9oQUJlcURoQjltSk1xdEQr?=
 =?utf-8?B?eFEzMlZsOTVpOHRsbUF4dXcva1RPYXc4S0Q0UGMvUFJoSEkrVU8zbEx0a1VX?=
 =?utf-8?B?dkZabC94MldaV1pqbnpyU3pFZlo1dVdkZ1RWcmx1ampYTDB0ZTRsM2ltNENC?=
 =?utf-8?B?NWQvK0hLZ0N5c3Rpbm1WbFNReGhIdmZ4UGg4bERsMHVXcHZmWXR2NDNodnpa?=
 =?utf-8?B?bEhPWHM2dzRDM08rSzJJeUZ0bUpzQWQ0eWczUHNlU1pWeGRGT0tZUUlmaHRX?=
 =?utf-8?B?TUt5cEVrN0xTemtsbmlVSXVxQ2NQRCs3djVBbloxcGxsZVo2ZFNBUmQ2VTFG?=
 =?utf-8?B?N2doWnZDQUI0VjJCK0VHVklHSk14V1ZKcm9aVXJYeW5iUTVQSmtFQjQyU25j?=
 =?utf-8?B?eXVya0ZLMy9WN3N2NGZtNUZJb3JjMURKejh0NTlLaVgvRXVIdnUxRFdGNTZQ?=
 =?utf-8?B?c0gzNGVha1BqdWFsUFNSbU5mREl1N1MzYVZzVTZpWlhFeTg2R1JteUNGaFNa?=
 =?utf-8?B?TTVYVzhEWjM3UVl4bXd6KzJCMzdOVnU5dzl6Wm16TnJMVktsR3l4MVYwS24x?=
 =?utf-8?B?d1VEKzNEYXdDeC9lMXJLa0ZKRTA0d0tvYjhkRTdUVkpvbGxad3pZRmx1NG56?=
 =?utf-8?B?TkFwODBhK2NnRDFDbk1aVHg1OTM3QzZJaHowUmpHQnFFYmtSa0J4c2ZRa3FP?=
 =?utf-8?B?RzVLNldBQzFtZDNDMytRZENhMDJvU01LT043NjI1S2M4VGUvZUM1Tm5KOFhs?=
 =?utf-8?B?YXd4NWY2UTFjamVGRVpQRHlRNS9IYW1zSEVzcXhTYjRWZEZ4TTVpSVFuTFky?=
 =?utf-8?B?bmVQM0QrU2wvUGJKcFUvbVZIbFZkSUs4VlRJbzMzMkFob2d6djEwRnltcDNm?=
 =?utf-8?B?YjFTMU9hb204ci9BWGtRU3VzRDlZb3p6YjJGb1l6L0Fod01QOWpWaUFFWXUv?=
 =?utf-8?B?TnlwYnp5allZWmNDYldyczhJVVY5M3RaVyt4Z21YWlQ5VEJzdW5YT21Ub3do?=
 =?utf-8?B?aUtOSzgrTWNjWDdqeWdSTXI3eUZOYU1JQXE3Qkh4Y0htUWU5OENnYnB2Mm9o?=
 =?utf-8?B?TE5EeTBLbjQxRTRVUVNGVGhTK1pIL2dTcG50NkQzUlg1RllQdTdjd1hkb3Fy?=
 =?utf-8?B?VEt6YzRQdlFvTzdqVWJQd3hLNTVDWnZkK0YvRko1VFlTTkFsLzFZeVlLL1ZY?=
 =?utf-8?B?TkxURjRmdlBLVjZFc3lpUlhjSnR0cUdYcjMrdzlHOEFRejdjNEZ5RmQ3Ky9J?=
 =?utf-8?B?OXBqY2w0MzgyaldnVkJ4RW54NTZBTFd4MDQxM1ZOeFloY3lVQmNrRVRTdkhv?=
 =?utf-8?Q?kSb/TRC3I+S6t1Uy0RoiI64=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e62c446-c267-4c1e-c65b-08dde160efc9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 09:47:41.6133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6LMC80hIrQZgssKJxeiDzDhtgHRCGSJK37T2eYc0U3W3BZhIQ96ldGKGZ0HOQrYPuHFZtMLAYhPp7tZLQCqYEkYoGZx20/RKiiEzq+5bCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
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



On 22-08-2025 15:09, Marcin Bernatowicz wrote:
> When reading provisioned LMEM ranges from debugfs, some GTs may not
> expose provisioning data at all. Previously, this caused the test to
> skip entirely with a "Failed read" reason.
> 
> Relax the check to treat -ENOENT as a valid case and simply continue
> to the next GT. This ensures the test is not skipped unnecessarily
> when provisioning data is absent on some GTs.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index fc08703c0..9eebe5f71 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -816,7 +816,9 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
>   		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
>   								  XE_SRIOV_SHARED_RES_LMEM,
>   								  gt, &ranges, &nr_ranges);
Is it applicable only for LMEM? What about other provisioning 
parameters?> -		if (ret) {
> +		if (ret == -ENOENT) {
> +			continue;
Can we add a debug level print here with GT id?> +		} else if (ret) {
>   			set_skip_reason(data, "Failed read %s on gt%u (%d)\n",
>   					xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
>   					gt, ret);

