Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99C4C55AB9
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 11:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7CB10E7DD;
	Fri, 20 Feb 2026 11:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8dQDgbR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0382110E7DD
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 11:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771585977; x=1803121977;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Xoj8ZBXSNgt4U6B2gFvMJcd1U987OWxOXCFzfu0GcPI=;
 b=n8dQDgbRz60Y8jEptLJj781GkYwylvk6OlE1CS6YYTsm879rch83Htwh
 b4mASIV3rhNDcG8WQxkZkAyGdNU8QsBDQEK80z1FgECrbQbmuCyFx3NrA
 lvlU6fwxNiQeSkSVUyV3Ig3ZOxywI3isAY+BxATA3ffCWIG66q28HJaU4
 ymJVD/OrF3ry8jwou0kya8hQ4yT4+qV5zZzh0P8JFzSgoV7KeRVKE8TUB
 W5vKd7ZBn2v8aA6w/PEgyDDmL/NGnzXw37P7JPwwBt/pEpSpK1mCv+4tF
 L3OjFmB5oviQN5QTbPbZUvhg+j0YJ5nlvdASaW2aV9TC6fDLk5ymYb1RQ Q==;
X-CSE-ConnectionGUID: ci97PVgnSQWI8trvTs7Cjw==
X-CSE-MsgGUID: SH99SrrkQPab4EriE4Io/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="84038536"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="84038536"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:12:56 -0800
X-CSE-ConnectionGUID: iTz14n7vSOyn0ONgXEBYqg==
X-CSE-MsgGUID: lVzBtreyQH+Xe2eCx2slGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="219327281"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:12:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 03:12:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 03:12:54 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 03:12:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=og9CjcEggZC5PLIhHtVIC+TVscKJf3E6s7+gTYAWhPJ0B4kMXc3bR4/4pQlcA/DBdIo7ELqEJSQQVnbuROpfWbFyMIo8h5xT+9iGe7gdMe1IBb4qzs+xWEFPEEKXvrEtfYor6+IZLxZf1IlBezC+6aJfTq7qSnTrQdN1AAuvxC2QKi9SLGMpbtM60viBgJ1UvckQJJrmwU0uABkBdhYGj9f3uabX5HqjQOKGliX4IOCILy2zJ+9jS3sDEXEPUpGDz0HF3YOMo1cGck8ZpjHGYhkSdeFDWvNCcC8Zp0DYrnoJqazMylGl0RtIYchcT+NYINGM9ZC1dNduF2HWfgUUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqKgDICS5QRkhRsMKC1RMsKKHTh9JVsRmbJfbDNYR24=;
 b=fKWzp86uREVyPf6OzYym1UG2FJTW3qkf39PRjhecHCq1VrttMFR8vbVciZDReBEs2YhARPWYqFd10XgFDmZ6aK8n1Uk6KSF5qgWuQvGKz0EiuFMSbK1LQV76mOmMDIDGF5o5gZYjuPGI47Wz7vCI7WDoxAJSoPfxW72pfdbsJIBy3Ejmxrhanq+RSC4fPGnXlFQJzgckzrsxDjy5vzx7OqyxfjdJbLfawtIkwava+4c2yu+vDMEz89AAoxDiFZ71mnjpL6gL1Nb53/2TqkR9TME+0Z1rOXb5KgFh39QVX31r54LMY/oCpMZmXTiILHKmbq8DTJtLXRjtxDXmlVV7lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) by
 SN7PR11MB6994.namprd11.prod.outlook.com (2603:10b6:806:2ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 11:12:46 +0000
Received: from DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::9b52:15d2:880a:6129]) by DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::9b52:15d2:880a:6129%4]) with mapi id 15.20.9611.013; Fri, 20 Feb 2026
 11:12:46 +0000
Message-ID: <6adcbc66-427c-4e54-8295-b1a49c0d4df6@intel.com>
Date: Fri, 20 Feb 2026 16:42:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/4] tests/kms_color_pipeline: Run tests on all
 supported planes
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260219090545.340383-1-chaitanya.kumar.borah@intel.com>
 <20260219090545.340383-2-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260219090545.340383-2-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::11) To DM4PR11MB5993.namprd11.prod.outlook.com
 (2603:10b6:8:5c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5993:EE_|SN7PR11MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dde00cc-91d5-4ddc-9c16-08de7070f9a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2s4NG53dVduWlVmcnJLb2RnRTJxRkVyUnkxVmFFZm9YQ1JXb3RvZjJGWExF?=
 =?utf-8?B?dXllZ3JBSlp3K3hhNnBPUUJPSFo5N0NJUHFSbld5Rjc3Sm5RL1JmdkEyaXJ0?=
 =?utf-8?B?Z2RieVVyNnc4aVNjT2FKL2F2WXI1dThYb3g0TmVJbUNWU1JJTXhXVTFCRmZC?=
 =?utf-8?B?WlF6TEhZMnpVSGtSREx6bktBL3Fsc3JGRUtiR1o5dy9uME42WGpHazdubUhz?=
 =?utf-8?B?cVgvQmNhVmhUYmVSYXV0bHR5dS83V0NWVVppZ21FNGxEQ3gyT2wzZjRJTEFE?=
 =?utf-8?B?MTZPbzhucEhUa0RnVkVQVXB3anN6R1oxNW5GMUdDRHVnU1lINSsrVHBBbVI5?=
 =?utf-8?B?cUNKQXY4WnRUeDNoKzdYaHJ4cENyME9oUzlzTjRqTFBobnFaY1VOSEtTazc4?=
 =?utf-8?B?Ri9QakNOdnRkL01zV2dPTWJQenE0MmVkanhUdy9sdTcwRHdLalc0aDRHc2tp?=
 =?utf-8?B?b1hCTGFlQVlsb1dWaDFENnpzd0RIa092OHJLelZYMGVKdFBCRVZabW91bGpF?=
 =?utf-8?B?Y0tlYllPdzhhbHpZK3BjZDF0OVdZclR4OWF0ZzJtSzFpU3F3ZXNkb3pJZjVp?=
 =?utf-8?B?OVhrRXJ4T1lKUnhOVzFHdlhVbXZLbGQzaTBtRkEyb1RxTTBlQ0htOXRMOFZj?=
 =?utf-8?B?OHh6TzJPeUY5OWtoQmU5Z3RTWWpWaUZRZmUxUHYvSThkS1VFUDBSeTFNRThJ?=
 =?utf-8?B?Nk54S2F1ZjdweVY1Tmg4R0Ntb3FtQXJRNERhQ0daNEIzZGtsZkZZMUR5d25D?=
 =?utf-8?B?NXloakZLMFdLNHZiVUN1TWNvNEc3eXk5YlI4Y0dxWjdmZVNYSG9pUTBXOTdH?=
 =?utf-8?B?QmEveWdvRU1zNExucHhIbGh2QmZGTjVPZW0xNEpUOGFkdnBwS3JNNTFJU0gv?=
 =?utf-8?B?TXZYRjdnSjdPQmlUZmdnbVNUNFVVYS9HQko4d0FrSkZ0eFNtbkJOZnNQMGNi?=
 =?utf-8?B?dFhpR0lDczVrRjVNbHh2a2N1dEcwcTc4cXB3REVoeU1UdmJSTXhZaVZIVVhJ?=
 =?utf-8?B?OHhKdy9VYlhZVGpqMEw2RnlBNW5UdCtkMUhVUmFiamdoVmY4N01WZGdnTzY1?=
 =?utf-8?B?VVdVMFVZaUhqQmdoWmMzVVpocDRQVEdkQXJUUlY3cVpSaVM3Wk5Eb1BodjNW?=
 =?utf-8?B?YkJBWFJrR0doUVVIVloxcHpHT1NZRHZ6ZFVkVU1TQTJYeWFqbWpQVy9SWitO?=
 =?utf-8?B?bmVmeVNDMUtpQUZERDRnL2wyV2laWEJnNDFFZlZTWlg3SGg3MEU4MVlUTUo5?=
 =?utf-8?B?NnFRTlYybmQxTHFtTVU2K0RWZ2lCTXd1bXBHWmFiTHNrN2Z4YlNrUUM1SHhU?=
 =?utf-8?B?ZUFmcVJnVVNBOWRzQTdaM3RaT3Q0T0FTR1dQdnlTWWpQeXlxbU1jQkhzSjJV?=
 =?utf-8?B?UW9xYXNCS3M4S05XcE9sSUZZZW5oeG9UQWMxWUNRZDdYUXQ5U0dQMVoyTlhp?=
 =?utf-8?B?UXFQSHZobEVuZUhKWHpWakF6eWoxaVhWcGNXRGwzZitjTlF5WFordDlzc0VM?=
 =?utf-8?B?LzNHS0d4NlI1b2puWWlaMldlRko2bUJYNmIzd3FUYm9FMDNrZ3p5allHSjI5?=
 =?utf-8?B?dVdyNTUvRkE4V0huU05vZm11cndXMkdIT1dGQ05WQ05WdXRWeUp6K1hqb1F6?=
 =?utf-8?B?WXU2VHg2ZnJjOUw4SWpPVjg5a2lONTE3ZTk1VGdsRS9zYkhpUWpzTWhGRVBR?=
 =?utf-8?B?cTFyMHFDL21pNGRXVTZPZXRyeW1sb2RiV2Mwcm1ncmtqUWIyVUwwREk1bW1h?=
 =?utf-8?B?YmN2aldRWkZuelJIbXI1cUE3Q0hyUmNMUHpTb2R1ZjZNOGdQeEliRHhUd0xa?=
 =?utf-8?B?VWJDQXdOdTVKYnZiN0YwOHdEQVJXUE9TNkpjYnN6K0NxSXBOUTFtMk9wTTAw?=
 =?utf-8?B?eGZPMlJISE5Gd2ZPajc5eGFQOXBhVmtRRmp6YWhOWTJTNE5sVWU0V2FabTU1?=
 =?utf-8?B?T2RDbGhrcjRDMGladjlMakNyd1lIS1pLNjRheFl6djVONkwrZTdCc1hZV25s?=
 =?utf-8?B?YzZldTVFVkR0d0ordEV0UE5RZ1NsaWFTVUxmaVpEWHQwbG82OFpDeWdMdFNV?=
 =?utf-8?B?T28vU0dHSWpnMFl6YUJwclF4eHJjRHRSNnc0SE9iR3pQS1dYam5yN1QzRG1t?=
 =?utf-8?Q?blPs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5993.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckJRQzBPV2RXTFYzMVBoL092SjNlNUUrSmNoVHFTUGd1bFcrYWp2Ukc2SGJ0?=
 =?utf-8?B?ZGZHTjhDVXdmUXhTMzFUUHBjcXJYWGMvejBBOUtSQ3ZGK2gza1c4aUVrNzZp?=
 =?utf-8?B?cEtlaDAydjVxL25lYk40elluVXpMNTBZRy9EVXBvRGZXVGlzR01mUFFFdW1r?=
 =?utf-8?B?aHNqamtyYXVGbnRMdnQ2OHJlbXJCK3RhNkNMWDVGWVRuOEVUc0txKzF1MnUx?=
 =?utf-8?B?NzA4NE5KaWZnaG0zeDhFQnd3Z2UzRG9nTUEvMkMyLzdNSGMyM1UwWk1mc1I5?=
 =?utf-8?B?QWFjUEsrYm9QOVZyKzlVenRETEQ3RElRZ1c1bDV0TGpWZFJWcVg3VUlMbGpk?=
 =?utf-8?B?bTJXM2VVZytaZXozSnpmUU9tWXpjajF1Q2ZYS1JTRzRKV2dDSXNGRHhES29F?=
 =?utf-8?B?R25jRFJtWEk1UmpQVk1zSTNkV0JROGJYM0R6dlF5T2ZuSEY4K3ArZ1NjaE9q?=
 =?utf-8?B?ajNKY1RxY0xGR095d2FSelZvektTY01tUWU2aWZScklreEdIQTNpSzlRd3dS?=
 =?utf-8?B?V0pyVE1nL296QUpxdml1SS9VRFF2bjIrNElCUUVvMVJHdzdHSTVHSTJNOVZQ?=
 =?utf-8?B?dkhHRWNRcHg2WHcra3ZFTlRobG45amxKayt3WTVkNkRLSkdVZUxMMFZCalZi?=
 =?utf-8?B?aGMzZjBVODNXRTlLbHhlVkhvS3VuRWh3QUdIYWY1ZXlOa20yUnRQWkxpWS9y?=
 =?utf-8?B?ZC9ocm12OXYwR1RlU00xbHVaM3E0eGd0bXI2RHJvdmFwWCtjcEoxaVJtVU9X?=
 =?utf-8?B?TFJiekttUmtLQk0vMGhwWkFzOFBKQ3ZyUzViMkwyV3k4ZCtOZWVoMXo5YkJh?=
 =?utf-8?B?MmRjZ2VlOVRpOWcvbkVYZkZoNU5jNDcxdTg0eHhFWER5WEg1d0h4SVkwZVBh?=
 =?utf-8?B?QzNzOUVvZkxPNkFaNGlSbnBGN3QxRWdyaFgwWnJoQzkyQWt3WEZGYURvN2Zo?=
 =?utf-8?B?UmJVRFZaYmF5K3IrTmxQOVoxdHpFbEJ2MDNjS2lLc3RTK1pFYnFFRzlUYTFU?=
 =?utf-8?B?UEFJa2Z1U1l1aWVBa2VuK1NUZjRhaFJVSnVXOTJaWHM5TnFPaGpnbm1sSUpt?=
 =?utf-8?B?NXU1ZlI4ekQ3ZWEyU2dkMGZoQ0FQUEZ2SnJmK2RDWXlyRFFjdFFFU0xUVlZU?=
 =?utf-8?B?dTdRSlBUZU0rZTRWTG9EeFRsa3Z1N2lhMDFETU9UVEkrUkFKdkxCRkNSMmZH?=
 =?utf-8?B?K1VRS1gzdDZ6cURTZE5qM0tVUmtXYXpScGFFamJ2RWdYVWJjSU9oS1ptWmZV?=
 =?utf-8?B?ajJZU3FveVo1UWNxV3Zac1FCUkVtOUtoZElqTml5UGRLbnM4S0VaclhjV3I1?=
 =?utf-8?B?VnhzT1k3bG40dFV4cHE0WVd0eTJDL0JxUmZ5NUFlRy9IM3loQklXRWF1a1Bi?=
 =?utf-8?B?ZkV4US94ZHZQS2JHRmRITjdsYzZVV0dEUDVoYlphT1NhYlQ5WWpUWkxoQXJY?=
 =?utf-8?B?NWVFd05pSUsrNTEyL0ZhdTJvdktxYUFLSDVwdWdWZ1V3dTJEbXNmQVlBYnh5?=
 =?utf-8?B?eDJBMDIxUlJ2OXJsZnVodmtWT3FPNDR3cnhBTHZQSmlteExQOUV1MHJPRHJC?=
 =?utf-8?B?UHR1SWhlZnZ1bGY5THJyVTc1a3FiY1JQdUtPMzFMRkd6MFpOWFZrQnRWZ2Jr?=
 =?utf-8?B?N04xNktWVkdqeXEyeGpYaWxDTHQ2aUJCZ1lBc1liZStwYSsyamRqQUl1QzZC?=
 =?utf-8?B?QWZTSk9KMVFUSmt1cmlZZlJ5TklpNTBGOW1MNjJlTk5aOUFmeUpTRHRnNUpE?=
 =?utf-8?B?eTF6VGpCZWR1ZDl1b3FCN2crRnN4Mm1nVjdtYUplTW4vOXQ3aEI1V29Ba2dv?=
 =?utf-8?B?UkhkaGlkZE9HN1gydVQ3azdIWllLaG9jY0xFUXlkTHpVUHBWWVUvd25WYXV3?=
 =?utf-8?B?VDVnNDZuZ2J2ZG1TRTN4L3N6THVLeGEwZnJGZkJJam0yQ2dmK2JFOURSSFFt?=
 =?utf-8?B?bVlCTWsrUHBZUVdia1luZG5DeE1hdnhCWWN2Z3hidnhYSGJvU0lNdFFqdVVU?=
 =?utf-8?B?RTBRUnJRNG5BK3ozOGtiSGNWK041R05hYXdFTjM4Uk9HTVNyaVgyaTdkRlhk?=
 =?utf-8?B?SXhOTm92VDY3TkFmRGFJOGFuK20xU0hCWXF2aGZaR08zSmVtbzZoeUVTTi95?=
 =?utf-8?B?eWZFWE9FakxrN3drNjBneisxSEVHY2czNEpKRXVYaWNmNUZlaHRCRi9CUnRR?=
 =?utf-8?B?YzNUSGpMdmtTanptYTN1bkViWEFXUVF3eWZTSHh4cGJnUUsrYnVmVzBBUHJ5?=
 =?utf-8?B?Q3N0dDEzaStvMEhMSDc3Vmt5VUVNVUFmajlDQ08reXRWdVdFU3pQb0czQlBB?=
 =?utf-8?B?K0RCa0tFc1lTU2haVDhadmFSV1hOaEZXOFVRcmxnQXZncW1vdDg2NGUrSFpl?=
 =?utf-8?Q?iT3RiaYsg4W1RfeQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dde00cc-91d5-4ddc-9c16-08de7070f9a1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 11:12:46.5128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pS7BSaa4dZ9BMsbpfjE76bHwkVmfUPZOMi/QfKeydPswp1q9RCY7G+K2Sf2RLIeQP29kRHalL3pYALHRu8Ys/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6994
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

On 19-02-2026 02:35 pm, Chaitanya Kumar Borah wrote:

> Extend the color pipeline tests to run on all planes of a pipe that
> exposes COLOR_PIPELINE property instead of only the primary plane.
>
> v2:
>   - Rebase
>   - Remove unused variable (Swati)
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_color_pipeline.c | 57 +++++++++++++++++++++-----------------
>   1 file changed, 32 insertions(+), 25 deletions(-)
>
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index e7f168b10..d12874f98 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -61,7 +61,7 @@ static void test_setup(data_t *data, enum pipe p)
>   	data->mode = igt_output_get_mode(data->output);
>   	igt_require(data->mode);
>   
> -	data->pipe_crc = igt_crtc_crc_new(data->primary->crtc,
> +	data->pipe_crc = igt_crtc_crc_new(crtc,
>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>   
>   	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> @@ -82,18 +82,17 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
>   	return true;
>   }
>   
> -static bool test_plane_colorops(data_t *data,
> -				const color_t *fb_colors,
> -				const color_t *exp_colors,
> -				kms_colorop_t *colorops[])
> +static void _test_plane_colorops(data_t *data,
> +				 igt_plane_t *plane,
> +				 const color_t *fb_colors,
> +				 const color_t *exp_colors,
> +				 kms_colorop_t *colorops[])
>   {
> -	igt_plane_t *plane = data->primary;
>   	igt_display_t *display = &data->display;
>   	drmModeModeInfo *mode = data->mode;
>   	igt_colorop_t *color_pipeline;
>   	igt_crc_t crc_ref, crc_pipe;
>   	struct igt_fb fb;
> -	bool ret;
>   
>   	color_pipeline = get_color_pipeline(display, plane, colorops);
>   	igt_skip_on(!color_pipeline);
> @@ -138,7 +137,7 @@ static bool test_plane_colorops(data_t *data,
>   	igt_wait_for_vblank(plane->crtc);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
>   
> -	ret = igt_check_crc_equal(&crc_ref, &crc_pipe);
> +	igt_assert_crc_equal(&crc_ref, &crc_pipe);
>   
>   	/* Cleanup per-test state */
>   	set_color_pipeline_bypass(plane);
> @@ -147,8 +146,26 @@ static bool test_plane_colorops(data_t *data,
>   	igt_display_commit_atomic(&data->display, 0, NULL);
>   
>   	igt_remove_fb(data->drm_fd, &fb);
> +}
>   
> -	return ret;
> +static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
> +				const color_t *fb_colors,
> +				const color_t *exp_colors,
> +				kms_colorop_t *colorops[])
> +{
> +	int n_planes = crtc->n_planes;
> +	igt_output_t *output = data->output;
> +	igt_plane_t *plane;
> +
> +	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
> +		plane = igt_output_get_plane(output, plane_id);
> +
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
> +			_test_plane_colorops(data, plane, fb_colors, exp_colors, colorops);
> +	}
>   }
>   
>   static void
> @@ -284,23 +301,13 @@ run_tests_for_plane(data_t *data)
>   
>   				test_setup(data, crtc->pipe);
>   
> -				if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE)) {
> -					test_cleanup(data);
> -					continue;
> -				}
> -
> -				igt_dynamic_f("pipe-%s-%s",
> -					       igt_crtc_name(crtc),
> -					       igt_output_name(data->output)) {
> -					data->color_depth = 8;
> -					data->drm_format = DRM_FORMAT_XRGB8888;
> -
> -					igt_assert(test_plane_colorops(data,
> -								       plane_colorops_tests[i].fb_colors,
> -								       plane_colorops_tests[i].exp_colors,
> -								       plane_colorops_tests[i].colorops));
> -				}
> +				data->color_depth = 8;
> +				data->drm_format = DRM_FORMAT_XRGB8888;
>   
> +				test_plane_colorops(data, crtc,
> +						    plane_colorops_tests[i].fb_colors,
> +						    plane_colorops_tests[i].exp_colors,
> +						    plane_colorops_tests[i].colorops);
>   				test_cleanup(data);
>   			}
>   		}
