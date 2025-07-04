Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC16CC83030
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 08:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1DD10E97F;
	Fri,  4 Jul 2025 08:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbS3/7MA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2127210E97F
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 08:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751616119; x=1783152119;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x6rcpDYq0ttMWzNEFZkqhjpPlVVt6yucz2h3OFu4jEE=;
 b=nbS3/7MAJKeEHDAobEYonx3RJ5l111rD+Fy/MLZPyT7UkcYhPRKzbFB8
 R7Z21mss37jMNHaDSbkMDaBDwTbcfnIplN0cpTzBEUVTBNARdADB0Uz/R
 NXldbVLqwtTOXyCGtrTWDEJa390xkXGXKSJO5ys6y6XzIVAF0IclaP+cc
 af7KmTtKCZ1NsxQN2EAUJ7amShOvSvfe0sNwphHAfhpOXM2ts7DGz+ijK
 lLJIQ373+0pgYFWs+Cd55642dqxl4b9d2w79D+IeqcZm+GN1/5fdOHfXw
 5WsG5WB/0Na/OQYjFTZwvqpTa86Gh1FQxXN5F/FqKzzlkyPZKPyiDBi/O Q==;
X-CSE-ConnectionGUID: c+KgVM1cSle9XxAYVyS6iA==
X-CSE-MsgGUID: jNrls17aTVqkpAjshH4M1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64640845"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="64640845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:01:59 -0700
X-CSE-ConnectionGUID: 05tnp2SgQ+WIlr3N7Fs6Zw==
X-CSE-MsgGUID: 3MjoBPT1QjeV4RRZJpH4Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="154003222"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:01:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 01:01:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 01:01:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.87)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 01:01:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRZtApSzdSB+vNdVACHqPyPSg3neXnr2oSqPpeWa6J3x4/Shwptp+xlYtQnmSgrpF5cOF+zSl5gbUTMwa7uAmXwGFGwvsSBNaDDH7Nu+zKWeqTeY7sHr0LsELCfnMBfrE/M+dNRD5k2BiicVIUPKLi7BJ+Xsv+MMtigI+q6oDS4pe95cY9rMMvYDCpp5N6Yq8ADMfnWuvdJylOH8LL8mgkfeL3TUw/9yEyovHh2T65f2vVY/+YvziiyQRPDTRvEh0srpx6svOccRZKViFRgLsxh6DScUcyf0hxqXuNKp+MO62BDPjHEDkStNqszQHQEXpEf4xUtOOO/cn2N4SmYuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qyh9df7kHN3LXGVOwonbUS02/d2J3ijwPoFjazcWKeI=;
 b=B+CT2+FoYekqcWf/XTPiY9MKLGHVreIlEqWrPJPnRg8eCKhoOXughNkqQCwnfOgmhLt1PT3RqebzpiclxqLBSnTudufqxToodNYWYgXAJOximUhTS7vGozszFRWuEOeTEo4xGu0ChLRQQvqu1jF6P1QKrZqtN8307gsuQQNxQucz2FhROxRRG3FMNCB9HJEfCAbsEMPlYzlZHc2qC920S0UtVNDkQPMahAQCYtk4dlsJPW4EFNyEsJ28JvduCsYc/7YPqOpOCY/FTRUNtt1Hbf3pWeXfrjSZ1MIl9CRd+LbJx4djwBOYOC1poZ9QjyQ492FLUDC2MT197paDVw5kXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA0PR11MB4573.namprd11.prod.outlook.com (2603:10b6:806:98::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 08:01:53 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8880.021; Fri, 4 Jul 2025
 08:01:53 +0000
Date: Fri, 4 Jul 2025 10:01:46 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/3] lib/intel_compute: use macros instead of
 binary data in post-sync op
Message-ID: <aGeKakU90Ua2Pw5n@fdugast-desk>
References: <20250703063032.553963-5-zbigniew.kempczynski@intel.com>
 <20250703063032.553963-7-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703063032.553963-7-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0227.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::15) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA0PR11MB4573:EE_
X-MS-Office365-Filtering-Correlation-Id: a8446517-3771-45b2-6aaf-08ddbad109c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K09pUC84dzY3OXJOZXZ3MEhpeE9VT0tMZXJRRWNiVmJFbzRReFYwNXJGSWJl?=
 =?utf-8?B?UzlyUUFFRWJuNk9jUDZkY2ZMMTNnU05vbitQWUFLaFozZ1FZMFl5KzB1enFM?=
 =?utf-8?B?ZVltN1NPODdiNHUrelluMmIvVW1qTmJ1Q2lUMkZTV242cGtuT3p1dFlaWDIv?=
 =?utf-8?B?VlpkMzBUUXNUa0E3dkVJODBpWmY1VE9rRE5MYVdpTUJ6bDUrR1NUNDRLTjAw?=
 =?utf-8?B?bVU4Qmwxc2lFVTF4Q3NPZnJ2NWx1NkpCbVp3R0dvS3VUN1FPclMyRTBBSFA3?=
 =?utf-8?B?RDVQa205VHB2T2g5NkpnWFZZTm96S3Nqa05MNDR6WE9qSm1MWWI5MlRUaVB3?=
 =?utf-8?B?d2NyOEZtUjVkeVlZWTZpWGt0ZzQzTTNJUlFKSThlMDRhVnQwQ1Jqb3NHNXlC?=
 =?utf-8?B?VFMyYnN6MFRMMllCSE05b2p6S3BFb2hYL3NnYVFGaE5KMXdoU3BONDhxR1hC?=
 =?utf-8?B?eWhSVGtxRWVObDI0NklWd3NLVFVTanR3MnJ0UVlaeGtraU9jbGRWdzlva01J?=
 =?utf-8?B?eW10OWpMSHU2MlRJR1BmOHloQ3JGcXozNnBWVjloenIzRVMwdHY1TUtWMTIr?=
 =?utf-8?B?OXNWcjhiTVhoVENWMHhUYmFwQWtyNFRGQWpRSStFTDNIM21YaHNEaFUwWmc5?=
 =?utf-8?B?RkpBOHJTRkxyL3JROXA1ajVjZ0lzSHh2M1dRckt6VTJ1bjZmT1BxMmtRU29j?=
 =?utf-8?B?ZVN5Sm54eXdRd2YxZjdNbmNnUk5iVi9sM1QzUUlQQnhZZzZzTkF0QlREcXQ4?=
 =?utf-8?B?bnVPSWdBTnhwK0UrVFp6cUwvbEl4QlN2TWZLM3dzQ0M5SHFZYjRVekdjdDdP?=
 =?utf-8?B?UXFweHFJNitKYlFDVm44OUdEbGVrRVRQd1BvRnY1dlJZcmY0enZiTHJ3RGNm?=
 =?utf-8?B?NHJaUVRnektCTUxJSVhjNEYzV1NXaWN0c0tKWEx0d0F0NkxqYit4bjBYb2VH?=
 =?utf-8?B?UWZabjVOSEhUZFY1YWxRNFdSNVcrVXpFUnZVc25DS1V2S2RaZkhtQXUvWklF?=
 =?utf-8?B?U1ZZMXYvc2tWa3VkMlVVL2FiNWladWlGYm9mQ29lSnp0dE1TVXpteFNpeDdH?=
 =?utf-8?B?aktZNXNRZmIwM045K3V0MEM0Yk5tSHdxdFljQ1RRSTlRYXJPVDdBdE5nR0J6?=
 =?utf-8?B?cHVidFpkS0RkcTh0ZHc5bkxlSWNwN0w0M0xaQnVudXdJTWRZSkxiT3FrRFVI?=
 =?utf-8?B?ZXJrR0NWalVmVktkRnFIdjJBTUxoei9sa2krV0R0SUNwTmhXKy9tdUNVZ25Q?=
 =?utf-8?B?b2w5ZFdJWm1QaVgzeFVsOUxtV1MzSW9IaHBwNmZpcVJ6a0Q5eGl4dUVad2ww?=
 =?utf-8?B?bXgwTXcxQS9zNm9Ua2kvOXBJTXRCaG9qREc0KzdrTmcrZnQ1QkJGZ1RPcUtQ?=
 =?utf-8?B?NkgvQUIzSFZXZkN4L1M5T2x4KzIwcHFjYW9kMXFERUVhRUR2MHduV3FSSW40?=
 =?utf-8?B?ekp6Ui9sN1lMd29ybHdPdyszbW1KeHg4NnBacEdHcVljZS8vQk40WG5rNDJM?=
 =?utf-8?B?SnJFOVRDMGFhQjJTL1c2L1VwNnVDcTB4eExvczQzTGVlRjhNR0locTc3Yzd0?=
 =?utf-8?B?dEcvSFhOWjZRNWVlTzVPN2ZxdzlUdG9hQ0thYjIzblRnQUF1NXV1VVQvNnZ6?=
 =?utf-8?B?V01mSjErU3JTSDV6dG9lQjRDVU1yeXh1ekVmc0FTNW9UOTViOTFUNU1mSGVx?=
 =?utf-8?B?bkNnSVpEV2FEM0ZGSDhpY2dJd01HaXpJV21nTXZXUXhYRzJ6ZkJKTkN4VEhw?=
 =?utf-8?B?QXU1Rm5PV0EwV2xLNUk4K3E1ZzZST2x4clJYSEludDEveVdPbmtyREdPVE92?=
 =?utf-8?B?UmlDMnM0VmVVUHd2NlF4amd5WTByU040Y1BDWEtaY0l4cGVwaGpVd1A5YVBp?=
 =?utf-8?B?VkZmMDZMYWllZEttUEdyMmVpc0hWNk5ZQzg1enVsS2hSTlRQQnVYRHNwNktC?=
 =?utf-8?Q?ztWW4YcHrwc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUQrZVVnRFVYYUtBNHdZb0JNcDA3R2FDUDhKNzVqeVNkOE9WMmlNVk1jdmlt?=
 =?utf-8?B?V1B5Mi9jbzhqUVdXV0JaNUx6QmVDVFlQeHQ4ME1VL29PY0cwWFRwMVFlTFYx?=
 =?utf-8?B?Qmd0bUFPc0t4RWhaTXNTeHExS2lPNTMzZmZwL09CWWRjUllFbGNhN3ZEUlJC?=
 =?utf-8?B?VmR3QWN0WUVOZ0xEMGlsQk50RllueWYzNEF1VkpHekdFNXJjeHhYVGEraUgx?=
 =?utf-8?B?WmRiQ0cyUEwxVHVDSmIvUzBPM1FTMUh6WnZDQ051QWxoUzEvbGdrVDJTQ3BN?=
 =?utf-8?B?VW4yWTFxdzJmVWhXUnZPWjU3UlV0YXZnMThPaXlET2VhZnRzK0dhc29iNXFy?=
 =?utf-8?B?UW5GQXlpa0pJT2RBdDRLOHhETTArMnRidXc0ZjBLa0JwS1NlejFNZEpvY1dw?=
 =?utf-8?B?TG1DbnY0bVcrL01rZDB4M1c1WGdVci85Y3JKd3BxSlE0RklxeEN3TzVGK2tG?=
 =?utf-8?B?TnFvekx6azBCdjV2bmMraE1wd003YzdMRXh1ZEFSSGo3ODhrNGJvK2IvMm9Y?=
 =?utf-8?B?dEd2c1AwSFRaUFFHd0hmMXBDa0UrckdiUkZiVzFVN1dUV3NMNTZMWllkRGhh?=
 =?utf-8?B?Y1BnTDhnbWxKTW95UER6c1JjMVRoY1BySXVranFsTVFzeFJETjlkWGVEc2ZJ?=
 =?utf-8?B?RVdPUmRXQWZ2UFdLQWt6K2dIT0MrcDZKOUhNM21ZeW5LbWgrMmgyaVU5RlpZ?=
 =?utf-8?B?K1FsS2gxUHJMZkhQV1RsMEdCbGdIOUk2b1ZFdnhqTTdJL1FwczNMdTFJY3cy?=
 =?utf-8?B?UFMxZ2F0RTkxd1FIWTM5aFR6b0NVa2QwYUhPRjVWTzVxMHFqVmRML3JnenFW?=
 =?utf-8?B?ZW9zSUZUcmE0aFEyUDY2ckNYRmNGTUxpY3k0bGVtZndFRFlGdUl4N0pmVHg5?=
 =?utf-8?B?OGFkMUhYYjQ3ZmVpQ3VrZTMrZ2xMRXk1QWJuRlNJUThwTHYySlFCWG9UME41?=
 =?utf-8?B?UFZnd3ZucEF5aHczMkxmZGMxTUROcHlkeXhzcWpzTXFzc1BWYVIzQXN1Mitz?=
 =?utf-8?B?WFgrZ3pERllWa3FiSEl4ci8zT25iZjFaUHJ5Q044YmpwV2tjVzdXOWFsYjBm?=
 =?utf-8?B?bFB2S2RZLzdNZEhYK0I0eGFDdlZFa2R4VW1CNlBKbjVKZHZVM0FvU0NEMnBa?=
 =?utf-8?B?YTVXZlkzd0doNWkrSjFkQXFqSEErenkyRXNLSUgrd0o1Z1JMRERhZXRkQWRv?=
 =?utf-8?B?eUtGTEZTM3BnczNWMTU4NlZtMFZybFdCSXRVelJJcS95S3lGemRUNkxGVXAv?=
 =?utf-8?B?TzFYampPaHhIZjJjVTFLY013b1JockFDSG9peGdKUnhvUENiOGdYa0JKcDJ6?=
 =?utf-8?B?QjZxc09kNlJsVlIvN1QvZnNiRGl5MlpsWVUzUkJWNllhREZPa3FHZ2VIeVho?=
 =?utf-8?B?TG1ncGN0TWVOSjJtZDZNQW43aGhiMnJXbVBhVE8xcUtjZml0R2NsdTJHWWlh?=
 =?utf-8?B?WlR5YXR6T0pXbE9zMlY3MU5BbGI1YjVuaXpUNy9PQWxBcnd4NW5TazRWVnlU?=
 =?utf-8?B?SWZvZmJOMWd0bXZtTVVCL0tpcEVDRFpzUzJ5eXRNb1MvSVBvbEh6OVZPMWRJ?=
 =?utf-8?B?T29hY1drU3J0eTVaeHdRTmtzWGxKS2F1WjNYUHg5YVVBOTFRZ1lxRXJ2YkY4?=
 =?utf-8?B?RnRwQ0srQ0ZiZENRdzQwS0pQMjJCQ2tvdklKbDBwMFJPeDJKY25UaVdRdkFh?=
 =?utf-8?B?dHJmQXVkOTdBQ2hCWnNibFdITW42bExhY2ZXRXdYSGhENHFqVWVGaGtwRXlH?=
 =?utf-8?B?cHk2b0M2WVU0UzRMWVhmcXVGaE1nT2wzVndvZ096YU40cndJQ2pkQ0lFQWFG?=
 =?utf-8?B?WFRyS1ZxdzdSbGVGaWRlRUFPNHlCSmVUKzZTMEorYzdHMTcxaTdmZGMrWXB5?=
 =?utf-8?B?L05ja2dIZ3Y0SlZ4aXA0SWIvNmsra3E1YmpwNUhLekR5R3pSWml4d1V0Q2Rp?=
 =?utf-8?B?YTVrTW5pc29XellWbHF0bTJaMys4a3psS2Y4Vy9EWjVyTlFlZWU1OXI1OStO?=
 =?utf-8?B?VXVaMkd4M3haSHlHaHF1di93dXd4eWFmZDM3ZmQ2alAxM1ljaGpGRitweEJy?=
 =?utf-8?B?NHR2Mk1RYnlVTHFSSGErdEh0VVRDVFZkNnJwM1R1bUpkNFQ4Q0FpWGZ4dTdq?=
 =?utf-8?B?TWM2ajVKTTlDZmVoc3cwbmltajlzMHQweDN0MU1kb2toMXk0aTZhQ1pGd2Ir?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8446517-3771-45b2-6aaf-08ddbad109c4
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 08:01:53.3316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hy51jYam9wMJ+UaKC3VqAvRVbU/0T/roYaplnGfqX+I4GIue8Yx/Ooc36KJAAUP6q5suKXPUX7Qn8+GUa1rLTJL6DN3AP4dXIxs24DW9VMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4573
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

On Thu, Jul 03, 2025 at 08:30:35AM +0200, Zbigniew Kempczyński wrote:
> Upcoming change in TG preemption detection requires modification in
> compute-walker post-sync write. Replace binary post-sync to macros
> which are easier to read and modify.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

LGTM according to bspecs:

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_compute.c | 40 +++++++++++++++++++++++++++++-----------
>  1 file changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 9f5fc1bc59..9549b58fdf 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -14,6 +14,7 @@
>  #include "gen8_media.h"
>  #include "gen9_media.h"
>  #include "intel_compute.h"
> +#include "intel_mocs.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
>  #include "xe/xe_ioctl.h"
> @@ -60,6 +61,9 @@
>  #define ENQUEUED_LOCAL_SIZE_X		1024
>  #define ENQUEUED_LOCAL_SIZE_Y		1
>  #define ENQUEUED_LOCAL_SIZE_Z		1
> +#define DP_SS_CACHE_FLUSH		(1 << 12)
> +#define DP_PIPELINE_FLUSH		(1 << 2)
> +#define WRITE_TIMESTAMP		(3 << 0)
>  
>  /*
>   * TGP  - ThreadGroup Preemption
> @@ -975,7 +979,8 @@ static void xehp_create_surface_state(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  }
>  
> -static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> +static void xehp_compute_exec_compute(int fd,
> +				      uint32_t *addr_bo_buffer_batch,
>  				      uint64_t addr_general_state_base,
>  				      uint64_t addr_surface_state_base,
>  				      uint64_t addr_dynamic_state_base,
> @@ -983,6 +988,7 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  				      uint64_t offset_indirect_data_start,
>  				      uint64_t kernel_start_pointer)
>  {
> +	uint8_t wb_mocs = intel_get_wb_mocs_index(fd);
>  	int b = 0;
>  
>  	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
> @@ -1067,7 +1073,8 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  
>  	addr_bo_buffer_batch[b++] = 0x00000008;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00001027;
> +	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | wb_mocs << 4 |
> +				    DP_PIPELINE_FLUSH | WRITE_TIMESTAMP;
>  	addr_bo_buffer_batch[b++] = ADDR_BATCH;
>  	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1150,7 +1157,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	input_data = get_input_data(&execenv, user, bo_dict[4].data);
>  	output_data = get_output_data(&execenv, user, bo_dict[5].data);
>  
> -	xehp_compute_exec_compute(bo_dict[8].data,
> +	xehp_compute_exec_compute(fd,
> +				  bo_dict[8].data,
>  				  ADDR_GENERAL_STATE_BASE,
>  				  ADDR_SURFACE_STATE_BASE,
>  				  ADDR_DYNAMIC_STATE_BASE,
> @@ -1201,7 +1209,8 @@ static void xehpc_create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
>  }
>  
> -static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> +static void xehpc_compute_exec_compute(int fd,
> +				       uint32_t *addr_bo_buffer_batch,
>  				       uint64_t addr_general_state_base,
>  				       uint64_t addr_surface_state_base,
>  				       uint64_t addr_dynamic_state_base,
> @@ -1209,6 +1218,7 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  				       uint64_t offset_indirect_data_start,
>  				       uint64_t kernel_start_pointer)
>  {
> +	uint8_t wb_mocs = intel_get_wb_mocs_index(fd);
>  	int b = 0;
>  
>  	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
> @@ -1293,7 +1303,8 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  
>  	addr_bo_buffer_batch[b++] = 0x00000008;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00001047;
> +	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | wb_mocs << 4 |
> +				    DP_PIPELINE_FLUSH | WRITE_TIMESTAMP;
>  	addr_bo_buffer_batch[b++] = ADDR_BATCH;
>  	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1364,7 +1375,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	input_data = get_input_data(&execenv, user, bo_dict[2].data);
>  	output_data = get_output_data(&execenv, user, bo_dict[3].data);
>  
> -	xehpc_compute_exec_compute(bo_dict[5].data,
> +	xehpc_compute_exec_compute(fd,
> +				   bo_dict[5].data,
>  				   ADDR_GENERAL_STATE_BASE,
>  				   ADDR_SURFACE_STATE_BASE,
>  				   ADDR_DYNAMIC_STATE_BASE,
> @@ -1532,7 +1544,8 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
>  }
>  
> -static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> +static void xe2lpg_compute_exec_compute(int fd,
> +					uint32_t *addr_bo_buffer_batch,
>  					uint64_t addr_general_state_base,
>  					uint64_t addr_surface_state_base,
>  					uint64_t addr_dynamic_state_base,
> @@ -1544,6 +1557,7 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  					bool	 threadgroup_preemption,
>  					uint32_t work_size)
>  {
> +	uint8_t wb_mocs = intel_get_wb_mocs_index(fd);
>  	int b = 0;
>  
>  	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
> @@ -1651,7 +1665,8 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00001047;
> +	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | wb_mocs << 4 |
> +				    DP_PIPELINE_FLUSH | WRITE_TIMESTAMP;
>  	addr_bo_buffer_batch[b++] = ADDR_BATCH;
>  	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1857,7 +1872,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	input_data = get_input_data(&execenv, user, bo_dict[4].data);
>  	output_data = get_output_data(&execenv, user, bo_dict[5].data);
>  
> -	xe2lpg_compute_exec_compute(bo_dict[8].data,
> +	xe2lpg_compute_exec_compute(fd,
> +				    bo_dict[8].data,
>  				    ADDR_GENERAL_STATE_BASE,
>  				    ADDR_SURFACE_STATE_BASE,
>  				    ADDR_DYNAMIC_STATE_BASE,
> @@ -2152,13 +2168,15 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  
>  	bo_randomize(input_short, SIZE_DATA);
>  
> -	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
> +	xe2lpg_compute_exec_compute(fd,
> +				    bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
>  				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
>  				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
>  				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
>  				    threadgroup_preemption, SIZE_DATA);
>  
> -	xe2lpg_compute_exec_compute(bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
> +	xe2lpg_compute_exec_compute(fd,
> +				    bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
>  				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
>  				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
>  				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
> -- 
> 2.43.0
> 
