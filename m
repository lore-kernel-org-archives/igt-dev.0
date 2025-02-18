Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F7BC02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 13:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB7A10E6C9;
	Tue, 18 Feb 2025 13:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSVdyEHV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2478910E6C9
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739886505; x=1771422505;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+e/kPTr5Wb7UARdcS0qabHUsxi1vOAyjEblvfxpnqWI=;
 b=OSVdyEHVzfLvJKlndEc9i1fS9oD/oonKU+W2tJQ4eyYdrjHnn3MeqEin
 GKlldNrDKYnwqXdzuyq+8YXFvJnc9Uz0PYWIgQ9OpcsrALCumCNgeQc3u
 S+H+F6ddSXZjs3V4PghFjON2XJf3978cfRDI01l62ZFYn/wflVwYaKx0H
 HxYiZVsTvGDtSXXQP6oCY0vU7s9w7mNeHm6Xfgp/l+uK3ewRUpl5khbNN
 tEodqiBHU0hPN+KXhGH4ULn4vvInKNPFcqfLAI/HQMgzTub1yr6FInvUq
 GFSxHtFk78HzS5t7OPOK6JcOmDkNT5TN6VrqoMozxMFvPxwIuQ+38rq9j Q==;
X-CSE-ConnectionGUID: Icn8aTw5QN6e2plJdqjz4w==
X-CSE-MsgGUID: +btj52h5RYyyidfgUzKaKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40447888"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40447888"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 05:48:25 -0800
X-CSE-ConnectionGUID: ZHWsOS61TPGou90mzZc5PQ==
X-CSE-MsgGUID: fH4R/FdaRC2bPnOTGJ/UXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114909108"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 05:48:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 18 Feb 2025 05:48:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 18 Feb 2025 05:48:24 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 05:48:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJMms5YBD3iuSRppIJ7dERX+hfSD8te19LkQJCYf0KJ9TsDPMGfSXW8mJE9+o4YQ0ld1ut7P8/IZMroZGykir5cxPcC6ueSWN/fMuzNuINnfJcmb/Mu6wDSLyLGMpH5DYgrvoDbUdKYOcyieoI8+lQ1stqVvepqQ1EIHv2XL9a/olmg0y8XdBerciBefmNY+Myxx41CNgWlB8v2zEw0qxosT3m6cUmYubB9JYldRkCClVg+si83xDQuLDULda9PQInNRHMf0eEhlPnj94h+lAiCjvG77rduu+tt4XnbLuAEc/JZyI3s7gPLv2m6FbGY1ly5WirW1H16J4JETLzpUpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCPzIt1AgltGWrsMrFF6o5IgMO6sHKVoNeNhUrGazXs=;
 b=IBs4FdPlmTExDTS/9Le6JIiLUGRAjg7/6gmM+dXQdF82ooXjWcdl0YaGz3YO5Wheye2127pVwgJIn7tc7jtqdnm4wqvzGeqV3lGBaztsCH1RTAe4hWL9QpkeBIck7l9P7aUFqnJwhpsNO6HdOaYgiA79DyHQUjKFwAtj5PF2eRGMK+yGq/ESmxKsXOFWW/zLmtHA4uGxap9j9D5Zm8xghjjSRovfu67PiaTxMQ3KpIMEVJwyLZZWABHLAaIXml/s3H38IdFTYLu/kZaQHgU+WamE9ZRfTF9tVpILcf02d4AjYHw4fw5V+XgFYpLHla9+Qwbh84CphHywiqgL1dP2wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8840.namprd11.prod.outlook.com (2603:10b6:806:469::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 18 Feb
 2025 13:48:21 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 13:48:21 +0000
Date: Tue, 18 Feb 2025 14:48:15 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Message-ID: <Z7SPn9Kstq7TKErm@fdugast-desk>
References: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
 <20250207072902.12582-5-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207072902.12582-5-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR0902CA0055.eurprd09.prod.outlook.com
 (2603:10a6:802:1::44) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d07e18b-78a7-4084-94b0-08dd5022e828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHVKWFA5L0FNYURXVG0rbUh0M2RibEptZW9YcmZrMmU5UTRVT0xycWJRYUJD?=
 =?utf-8?B?WWkrL0VrVXVNV3crWnJhV0lNV0w4QzBqaUdCYk1oN0owV2dkbytQY25iMEs1?=
 =?utf-8?B?RW1MNmsrMXV0RFZpUXN1aWVZdm9zeDNkaXgrVkpoaVZiTGdET1VCT2FWakNB?=
 =?utf-8?B?UEtZblIvR25Dd2V5Q1VVQmduRG5zTUdRdm5LdlVjbngzSm1UQjhhZ3U4Uk9v?=
 =?utf-8?B?dEwwazhSM0FlS1Z3bm1hancvR2oremdrQms4ZENHK3Qxc09Ib3oyZjhkQnd3?=
 =?utf-8?B?bE91SndMTEVXaTVFVjlIOEd5cFZqaTg2R0tIclRHbk1wL0tSVjdELzNHRnBa?=
 =?utf-8?B?UWVUUEpNcVFsR1orYitXcHVQTGt1MEpSS1l3MkNlOW91eDRLRVdNSDFRaHp5?=
 =?utf-8?B?THlyREY1Yk5Lek9CNVJ2eFVRdEhYNUNlcGR6amJWOFlRdHFRTWxwVXh0dlJx?=
 =?utf-8?B?Y2x3NGRpSTBTVURxOUdjQVBEanIrVFNDZlFmbUw0UFBvSHdxMkRaVlpQU3Y4?=
 =?utf-8?B?U252WVdEVmRhUjZ4NzFMNWVBZjRhU2lYYkZvK0VQSkNpTmRnWURRVlUrMGRv?=
 =?utf-8?B?bFZYNEVYbjdKd2tEbmU1K0tYd04zMXNIZkJDMVRVU2dGOThJUkZoSHcxVGRs?=
 =?utf-8?B?OXBQK3liSEdvRXIzRVZrR1RtYm5QQkN6azJtRWcyN2pQWGwyYzhpNk1TeVkz?=
 =?utf-8?B?RloxdVdHaldPVWp6UlVabU9iU293UXpoZjNzaEN5clNmbVBGdDlXUVF2UlNM?=
 =?utf-8?B?TzZmTHQwZjk2RXRLMEtpeVdieFR1dzN0WklxWUNyVmFaSndRVDlyYmM4Y05o?=
 =?utf-8?B?WTE3bjZSUzVxWU1vR2M2ZlpjcjZ2MHRudjd0bFRMWi82YVV1a1QwNHI0bktH?=
 =?utf-8?B?MEdINFFzQjFqSGQzQ1hHb3BaMmhtQzdpZS84ZVVVbXdSRnRMbWRuTlN4amlM?=
 =?utf-8?B?Ni94WWVZS054akZCeFVRdWdRczVobEE3d3EvS0tTZDhVZHJyd3VsWUVnSlI5?=
 =?utf-8?B?SGRDZmlmZmtiaW5QQlFQNjhWdkNBSTNaQkVSUUNUVEtwU1d2c0JwMEt0K0Fq?=
 =?utf-8?B?U3dMUFZ4VnViQ3F1dFU5d1dvcUYwM3RTZDVwYm9xTTlDKzlHRXkrY1NvRXRN?=
 =?utf-8?B?Vi8vaEJoS3NReHZIckpRWEZHTm10aTBoL1F0YXhxelg3YlFHK1dIby84Tmln?=
 =?utf-8?B?K3p1VHQ2VGtobVhzdm5sZjh4NWtaY3NIWmxBQVhRMEEvNUlKaEM4QVlDQ0Q2?=
 =?utf-8?B?d2RiYlppTExHd2R5ZDZRSGdFSVBxWC92R29UUzk1dkp0dEpYMC82Sll1L0p3?=
 =?utf-8?B?ckR5Rnc1d0hzNG4xS2puWHhxRmRKcEVBY0hrSjA5WCtqQS9VeE43Y2NuRWly?=
 =?utf-8?B?RnB5eFpkZTdnL3ZJeHgzUTQ0WEtuTHBXRG01TWdjL09ZSGFlcTEyYkJRa1hN?=
 =?utf-8?B?OW51RzA4SGhxTkRvU3NtL2xWNUhSQSt1ZVBodXVtajRVb0Jhd1JFeFhPdW5u?=
 =?utf-8?B?MFpjdXNDUFhRVS9SZk5xUHlEbVhCTVNqU2NEekMxUVFzdDhCYjBFMlBFYUUz?=
 =?utf-8?B?M2FPNldUd2lvTmtMVi9HUmZ1Q1BwTkl4elR5b0N5enpXTXJqK1JWRXpGNU9k?=
 =?utf-8?B?RDNLdkdEU1lKUHE5TmhVNFVtNzBwNWxwWHh5a2V3aFBzdDh3RWxZMml6Mi9K?=
 =?utf-8?B?NmJCUEVoUUtnZmdmZ0NQTWw4RXlZWVgzSDFDT0RFN2s3eFF3eVhNazVRcHhw?=
 =?utf-8?B?bHcxSHdHNE40N29YYXduVmxjb2liRzE0REhIZ3E2cFZ3S1VnVHA5TS9vRjJ0?=
 =?utf-8?B?cElhUGFVTU9tajBYaXhrWVNUMVI0aDdDWUl4cUhEVy9HWlhzV0hFUmFESUw4?=
 =?utf-8?Q?rT4S1HiO2BU+0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWlyallSL1hjaFZ0UUN3SkVMNWYvcytxU0d5Z08rWlErdnNmcWNyeGZ1NlRz?=
 =?utf-8?B?VmFHWHQrT2UwdXN1Y0pTK2dvWUw2NVFLWGZqRkNtR21aQ0JRWlM1UVBic3li?=
 =?utf-8?B?UHVqVFltdGM2bHRqZjlMOHFYTnRONTBFc1ZVbkNSbi8yQkxGdWxGa0dkS3NE?=
 =?utf-8?B?cGMzQVNRZUw3WVpXSytKTXBZb2h0UnhVQzk0Q0ZBV0EvSDE2ODloRlFXMHd0?=
 =?utf-8?B?dlUxdmp3MXpVQitjM25qY2NlNlYvOWVYNmJCd3dNY3pqQUtmdFdyMk5SNEVM?=
 =?utf-8?B?bUVQVEJDbzNhZW5UK1JucFZ0Rld5dTRIUG1mdDZhRFZyaUl1SXc4SGRQL094?=
 =?utf-8?B?dnZqa1VJREdUNllQbnNERExyY2NZd3ZrOXNXRDlGUmVxcUgvNDN3RzB5VGo0?=
 =?utf-8?B?ZEVnd1d3MkpTSEkrZ3RzWWpsalZab3JEdzQydXBoNUxWTWVORjlZdmJ3L0VM?=
 =?utf-8?B?b0t2ZDlyN1JodWVDL2dWRUp6Rkk4cStwcVdCMEdlN2NiMkFpVkVIVGgvbTAv?=
 =?utf-8?B?RW1LcmkybUJQZEt1QXJSZGxQTXFKL0EzUXRRNkFLeXc5OGIrREc3TmRNKzlJ?=
 =?utf-8?B?ZjZaKzJDMzY5UnU0elRLL3F3MkxvcEc4bjFnVmpWUG5GeVMzU0hBcGk1dkhp?=
 =?utf-8?B?elltME4ramovWkQ0QlVabjU1WE1DNlc5bVFyQjloejVTZ0xFNG05VzROYVZm?=
 =?utf-8?B?MkVYQlpoV1lxR2VudExXSEk3bUlZV0VEOTIrV0lQUmFidmhrRWUrZzZBTFph?=
 =?utf-8?B?aWR3UnhkZ0Jqc0lZWWJZbWF0czhYdXNjMGEzTktTWDNFZFJRcDZtTDZnQmhI?=
 =?utf-8?B?U2FxVlh0MnRkUVBPODR5M0IwWVZ1ZWNoZE16KzdGYzdNNUl1cWpFdHZ6SzBZ?=
 =?utf-8?B?dVVNeGxLVWRJVUNKdTQxWlFpTzh3d0Zod0pGQjhLdnpsK3pCZEhWRkIyQUlj?=
 =?utf-8?B?RVV4RDl4SHh0NjBtZTFaTTVnN05lY0hnbElYQlYvaVk5V29ySTBFYjdsem9m?=
 =?utf-8?B?RHEwalFQc3UxZjlqTndnRk9BcVdGT3FEMG1WNk9WYTVQOTBnd0lSM2dmTDZu?=
 =?utf-8?B?YU90d2ROUUl5ekllV3E5UVIxdXBHWE96VVAwT2RGYVNwTnVTNTBVTnB5ZzRu?=
 =?utf-8?B?b1k5bXVPRW96dEZqQ1lOcW1SNWp6aHUza3RBZFVWUkJlWk5GODVjK2sycUhU?=
 =?utf-8?B?anM2Q1BIOHVrbTFCdmFtZ1lnRUh6dlZreE8zdnZJTDN1MXd4Q1JQT2p2TW51?=
 =?utf-8?B?MlluVW9pVzREWmJhRnpkMUNzOVpqdTdta2xOak5oWDZURlRyVHBVQzRma0x4?=
 =?utf-8?B?bjBCUVpsM1lqWlNPb1pYaXhnVDNvbTNRZU9iSjdmSG4vbXE2WXIzK3dBQ2o4?=
 =?utf-8?B?bGFuNExFbXJyL2lLV0MrVDU4ZTlvaG84RU54VnRPdmxURUlsdWMyMXIyTVBu?=
 =?utf-8?B?N0w1NVBBaThYVkVNTWQwS0QzUEw3cXN0WmlReDh3dWhqSmJIV2pKT2VadGNu?=
 =?utf-8?B?anNYbFhEeWVKL3VyTldONlVBYVdWQWdiWHVOM0JyTnpQUU56U2d1YTJUbmxL?=
 =?utf-8?B?cWpUdGpvdmp3dEkzcUFiY3NFR3Rod0N5UGFVUmJieVJCSm9hMmw3T1Y3U2lJ?=
 =?utf-8?B?U0I1Mmw5eWxJY1lJR3pJLzdMQmlLelZyODhnQitFVmorbXBzbkRvWmxmUldO?=
 =?utf-8?B?bHROc2RWSTJJdC91YWtBTmRxYzFuMWh3dnJvS2tZV2hWWEdwMUNxdndZQk9Q?=
 =?utf-8?B?NEt4ditRTXFUdXdsVUxPYTdHV2NFbjhlWnkzY0o0MDNreDEvWnRSVFViM0tZ?=
 =?utf-8?B?ZnM2MVZoV3U5d0pYa3gxNG00eHRFL3FMWnpPdVRnYmxMNG03QUd3VlkrTGxk?=
 =?utf-8?B?U2o0REhCZCtoZVpJcmIzeXp5QXRFZU5FWGRhU3B0aDVEK0IwYVRlbEdkT3ZF?=
 =?utf-8?B?OVBLRjNkNVZRYVEzVEg1TUF4bDNUWDFWMXB2d3hJWUZoclBwOGx0cFBGZFpS?=
 =?utf-8?B?QlkwT2NSYTFIOXB5b0RMREJza05qc1p0Z0REUCtoWlFVUDBENWJZclhLSXJO?=
 =?utf-8?B?Qy9iOGMzTklZV29yM3NrOXJQZFhNZDRROVUzOEVaTTJDVU9YWFBQOGYyRXd5?=
 =?utf-8?B?TVdNSlh2eHczV09TRENsQzJQK1JOUnBXNnNJUVRPRU1VRnBCd3RUYkxycXo5?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d07e18b-78a7-4084-94b0-08dd5022e828
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 13:48:21.1863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdqI5TgYvV51em7Z8wLQc8zVrjgqGWkoX2F3v/X+I3/EKpp8JE9+GFPyEcA1K8ZIRFBJvHTNNmvgpbX8ANKjPs5xM1biFQl0xToIxFH52GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8840
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

On Fri, Feb 07, 2025 at 12:59:02PM +0530, Satyanarayana K V P wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe during driver probe when executing xe_guc_ct_send_recv() /
> xe_guc_mmio_send_recv() so that more code paths are tested, such as
> error handling and unwinding.
> 
> Error can be injected using:
> igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
> igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 41 ++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 9432828c2..288a5c384 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -231,6 +231,34 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_UNBIND);
>  }
>  
> +/**
> + * SUBTEST: probe-fail-guc-%s
> + * Description: inject an error in the injectable function %arg[1] then reprobe driver
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_guc_mmio_send_recv:	Inject an error when calling xe_guc_mmio_send_recv
> + * @xe_guc_ct_send_recv:	Inject an error when calling xe_guc_ct_send_recv
> + */
> +
> +static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
> +		struct fault_injection_params *fault_params)
> +{
> +	int iter_start = 0, iter_end = 0, iter = 0;
> +
> +	igt_assert(fault_params);
> +
> +	/* Get the iteration count from environment */
> +	iter = get_fault_inject_iter();
> +	iter_start = iter ? : 0;
> +	iter_end = iter ? iter + 1 : INJECT_ITERATIONS;
> +	for (int i = iter_start; i < iter_end; i++) {
> +		fault_params->space = i;
> +		setup_injection_fault(fault_params);
> +		inject_fault_probe(fd, pci_slot, function_name);
> +	}

This loop is specific to the guc test, it is not present for other tests.
What is different about this test, why do we need to inject a fault at a
given iteration?

In case IGT_FAULT_INJECT_ITERATION is not set, why running
inject_fault_probe() 100 times instead of just once like with existing
tests during probe?

> +}
> +
>  static int
>  simple_vm_create(int fd, unsigned int flags)
>  {
> @@ -330,6 +358,7 @@ igt_main
>  {
>  	int fd;
>  	char pci_slot[NAME_MAX];
> +	struct fault_injection_params fault_params;

This struct is used only in probe_fail_guc() so it could be local to that
function, along with the memcpy() below.

Francois

>  	const struct section {
>  		const char *name;
>  		unsigned int flags;
> @@ -363,6 +392,11 @@ igt_main
>  		{ "xe_vma_ops_alloc" },
>  		{ }
>  	};
> +	const struct section guc_fail_functions[] = {
> +		{ "xe_guc_mmio_send_recv" },
> +		{ "xe_guc_ct_send_recv" },
> +		{ }
> +	};
>  
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
> @@ -387,6 +421,13 @@ igt_main
>  		igt_subtest_f("inject-fault-probe-function-%s", s->name)
>  			inject_fault_probe(fd, pci_slot, s->name);
>  
> +	for (const struct section *s = guc_fail_functions; s->name; s++)
> +		igt_subtest_f("probe-fail-guc-%s", s->name) {
> +			memcpy(&fault_params, &default_fault_params,
> +					sizeof(struct fault_injection_params));
> +			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
> +		}
> +
>  	igt_fixture {
>  		drm_close_driver(fd);
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
> -- 
> 2.35.3
> 
