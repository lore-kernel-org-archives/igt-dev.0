Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92D3C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 08:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4C510E010;
	Thu, 10 Apr 2025 08:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTS0ZJmc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BB010E010
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744272438; x=1775808438;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kQwbp6DTq20ljOF16HH6rd8dWpGIwRsR1zb1aQ8AEQU=;
 b=iTS0ZJmcyBoz60Gk/b4WdtFIAayNxiLJfvWTlz6GF34SDODvJFwTOLsj
 fawb86cQQHWrJ3JuAVpA892ptmHMhO6IEghgA/YGyoCBloCqKpYI00EeU
 9NXSdAKlXzcPVEVR0Dc30H0cS/UGPYeAtEd63uCY76TesPfRkBcJ7sQx2
 ChLJx3quAVCGSF/sQBJHyQ1fUmwGOTk+X5GODuvvQypJw2Ib8O3fFfSs+
 FdJoeKEKFsNforbzgvok3MT4uumYGqKeksEiCN8YBO28AVMRHGzRn+mr2
 leg5/3cDjXqcS0CAyenvsVDkKtUuJEUQBctg/cyx7OhDiWGS5VT3LsQPX Q==;
X-CSE-ConnectionGUID: EkcbS9CBQH+EmowNmH388A==
X-CSE-MsgGUID: ftaOrEn8TH6HjB5jRqmlfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45491170"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45491170"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 01:07:17 -0700
X-CSE-ConnectionGUID: 1emjlT31T2WHGruFrDvyJQ==
X-CSE-MsgGUID: DCC7+nX4SGKvuIBU2yk/9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="132963641"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 01:07:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 01:07:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 01:07:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 01:07:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVYdaaRS8LivXEHVvTZz/VeNzTHAqiM7o4qFsjtALIZ3KJ84CT9wQGf913kMwOZ3aFjO6PslzKe0MMxmAmZ7xwYQToOe+YOGsilQZpFZ79b6djqu7o/NsiDhklnvou9ie5xSV6prFwqcUqRG0psielvBKIudFDjUtyv5fBgVkzunHCSPK6xWYpi7c0IP9f2ERxbVcD9HEUfu/2gBtu8BoYlqiVazQNTFiexhfBMkjNnMEOSCY/OjmRY6eNReh6QUpI/Ieu6rdGYtP/EYb8gLjgv2Clcg4eBQXzuMG4Ee5OKrkcZ51RMSCUoS4Zu3eL9/+RQzzHrFVAcBCWfiHsUjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQwbp6DTq20ljOF16HH6rd8dWpGIwRsR1zb1aQ8AEQU=;
 b=eTTfgJFPYXoU1qGzfVKv5av/RuWoDDLnqgh5SPsaDnOOVneWqeGXyaZScqLNsjX17rkJ9GCGirwIYS7ljaWIOJl8GpECw2xJk17ny4uT8v5opSoByFnjQ4rTN/Sq7ez9IadfGh4z5+XtuqFtojpLarTeKfSZd82Rg9QHLaHbBEVTP1oa5Obex5d/fo8vro0pVFgIwqMxlAolahkYGA0hSNfYq7wiCFMzqUHX73txcgv7dzYErTkjzljxnok2ALBCkQCKqIXp2B2yNL1W/FtYKSyFXBPCocVAHA98GxdZpwEgRoLE/IsXgyZg06ZC01xw2IKo3LQIomkwkyFF7nsX0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SJ2PR11MB7502.namprd11.prod.outlook.com (2603:10b6:a03:4d3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Thu, 10 Apr 2025 08:07:13 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 08:07:13 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Thomas, Sobin"
 <sobin.thomas@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH v5 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Thread-Topic: [PATCH v5 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Thread-Index: AQHbqPhs/8PFNtSfy0ySGl3mc8QiyrObgwCAgAEGSnA=
Date: Thu, 10 Apr 2025 08:07:13 +0000
Message-ID: <DS0PR11MB7264FF1D07E2BC161860196FD9B72@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250409022217.2292395-1-sobin.thomas@intel.com>
 <20250409022217.2292395-2-sobin.thomas@intel.com>
 <20250409161429.n5e42tmnytiyee3u@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250409161429.n5e42tmnytiyee3u@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SJ2PR11MB7502:EE_
x-ms-office365-filtering-correlation-id: c216a86e-a3a3-403c-0283-08dd7806b373
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QnBZcVg4SXJuZyt6UHJ4UlpFMDJoNUVHRXA3YW54K3VRVDBaS3R5R2Z1NVZN?=
 =?utf-8?B?cktSd0xvL2hHbVBUdlpwWkV4NEIxUnJRcVZOc0ZjTVo1ZWNpNys3RlBKNE5Z?=
 =?utf-8?B?cVdjeURRdDNvZHBZSDdPM3AzQXRxbWNiaGh3dzkvZGpFMW8rRFVXNTE5MUdO?=
 =?utf-8?B?QmlZSkdZZ0VkLzFJbFZXZm9laE9TVkpoUVhzYWlDL054ekppRWJPWVZIZFFi?=
 =?utf-8?B?ZEJQOTYzYXRtdlVDWDkrUFpIejM3ZEMzYWdQdWx5OXBEeU15a0Q3OHFEcXJR?=
 =?utf-8?B?MEVFM0ZlQnRSRVBzdkt2N0NwbGpxLzJGaVJ0VCtmMDg5T2FUbXJoMElYMjVW?=
 =?utf-8?B?K3pUTmMxeXoxc2VRajJrNDBPM3YyMy9FQlE5eG8ySHZEM1hxTlE1NVU2SzIv?=
 =?utf-8?B?NE0wM0tZOGx2NkcrQVFSN1Fvd1YwTVR1WmhSMHc2MVUzcDNYZDJJOW83NENs?=
 =?utf-8?B?WmNnNm1EK2c4akZ2SUZPMEkzM1QycFlPa216ZEtlMlJEWWtyb0NEditEZVI5?=
 =?utf-8?B?eEQ0a0ovRU02UXhZMGtkQTZJZ1N3Sk1MRUF0N0lBeEtqKyt6M3k3L1ZrUll4?=
 =?utf-8?B?ZXhkOUJBbWxZQWJIWFJGaWp6cVdTek93WnRNKzZuWFlETlNLZkU2VEp2LzZD?=
 =?utf-8?B?VHJZVENWejdXdjdGWjBsdDhqUlo1M3BDdnlYZ2NhMVpDdG9Yb0JQQm50OUEw?=
 =?utf-8?B?dTkzMVJydG5rTGowME9oZlNIeFc0V2lUVmVZaG1LdWJtV09IUWNpak52RmUv?=
 =?utf-8?B?cWw2TXdNOVN1OUZ4a3pXWnFQWmthTU93dzVqZkZnQVR0Z0tra1dVTDcrMVFx?=
 =?utf-8?B?ZGpHblhJcGRrd2Vrcmp0QWdCOUluTmNiaG1OeHAyTjBhVjlRTktlVUs1THk0?=
 =?utf-8?B?Ry9VSXUzQnN3Qm5QdHkvS2wyRjZtbXl0K1Z6dVJIaFpQMTZ6L0VWMGVEdkta?=
 =?utf-8?B?b1FBcUUvVDh3MzJ5YVZRUVczV0FWRHNzYjJ3TmVIRkVlc3hPb0ZLQ2JQUVZT?=
 =?utf-8?B?ZUN0UUFOeS9meFNHSUZ1Y3lyUC9abEFVcFZJdkhnYVZJQXFIQmd1bGRCbEI5?=
 =?utf-8?B?QWhvOEJzalQxWU4zdXRxcnNvOW9aL1FDVyt1TlJpQmtsSW5kcXV2QjE3QWlZ?=
 =?utf-8?B?YUczUVZlbE96VDV6aU5kdWpjUEwyTGk5aGlXV25wd3J6aVA1SnVCYzQzNG5j?=
 =?utf-8?B?SnRGU2kwV0xLdERNODdsZ3VHdnV2ejdIUGlndFh6aDF3QjVOVHoyNzRNWTA2?=
 =?utf-8?B?Skg1ZWkrVW9ZUFVIRTlBZGJqQnk3VlBMMC9xeC9vWVQ0Yk9vQkI0dGozMkpi?=
 =?utf-8?B?QWJ5aFE2bkFxaVAzMmZjbDFzSHk5L2pNd0JJSVBYc3c0ZjRTQkIzZ2tEL3Ji?=
 =?utf-8?B?S1J0NEk0dzJSTXYwcUNHTGZJUlF0SUIyUWl3NFlCRmJHcllKM3dkdHAzQUhP?=
 =?utf-8?B?eTVHcTdlVGxrWDNyczJvSVMwN3lPa1FNUCtVZHVSK0tHdDIrZ1NNT1p2cmt1?=
 =?utf-8?B?aXBEeS9maW1XTGJYV3lkWlo1SmpXWXZueldOemtCUjQ0NFl0d0lLaDJRdUR0?=
 =?utf-8?B?TGk3eTdlRElFbHV3cXEyYnFRRnVycnQ1bFBxQWJSY1c4Qm9vam1OclVwMVVq?=
 =?utf-8?B?akNCZ2hEZTIyWDA0eXlBL2xwV3ZGZFlhbmtSRWF6VThPaWE5dzJnVzJvQlR5?=
 =?utf-8?B?dTNOS2wrc0ZybnprcFBTUS90VVdiL3ZPcVFLMVcwQjVldGEzN3FCT3VRQmk0?=
 =?utf-8?B?VENwak5WSWdRaTlHR2U1R3UrSktlVVVSb203ODFCYXhIWmxCem9mbUYxZlBH?=
 =?utf-8?B?eDBoQVhEbkQwUTdTcmFBeEdXWXV3OTZzVGJ4ZGhQUGNCSHhTK2FDUXFGejdP?=
 =?utf-8?B?M0pqSDZiNnZTOElJSm5Ya2VYWHFyajlpenJoaHZuWk1JdVo2MXJ3YVdSN0Qw?=
 =?utf-8?Q?GUoP+sUNmBlxPT9sP3Apg2G3bEt9NCoa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2NNTmxsOWVoeENCQWlKRkoydGdQcWhyUHg4N2NGbUFsTlZvdWpiQ0hKZ2ZC?=
 =?utf-8?B?OUdBY1U2S3dCQlUydWRXSDYyUVVxR1RmMlZwNFJwczRaWUw5QmIzNG9HdnRx?=
 =?utf-8?B?QzhXK1lWaHl1RGJybGZWZmxqQy9kUHhGbjNmSEZQNG43WmZ1S3lrdWQzWkhU?=
 =?utf-8?B?TzlMQlgycENnRHhkdDhlTUZUL1pvT2YvaEFpSlR6V3lOeE01R0liSktjeGZi?=
 =?utf-8?B?a05adks0Q1NHcWRITEZuc05oakxMNkh6NlVuaVc4NWRJeU5RYkNDNCtZRDZa?=
 =?utf-8?B?bzhSejFMcXNyWWh5K3dTdlpwU214a0gwWURaTGJ3eWJnSUtCZFN5R0ZMM0JT?=
 =?utf-8?B?d3JKNEFGK29hZE1JdDJuV3kzbDB1VktDVFJSVGFRL245VlZBZjJ2RU81RVli?=
 =?utf-8?B?RGEwRThrWmM3QWM0d3V1MllBUmpCL3BqdW5ueE9SR2h0QThTNEFZVmU1bEln?=
 =?utf-8?B?M3JoMmJVTDZnSlVrZGNZRVZsbkFHaS9DbTVEZVErdkdwMmo0YUZKckE1elY1?=
 =?utf-8?B?WFNxS0RuRnIxKzEvWldiK3hlYlE2ZUpiYkhDOEJJNE95YzllVWg4cTlFNldK?=
 =?utf-8?B?bDJaYVk2Mk9mbldsTzd2elNVdU56UHVDUDZ6QTBpVW5pMjVOREdVaEI0T2hk?=
 =?utf-8?B?Y0QvaHdKMkNTMGl6d0c3R3FKdjZBK1Nxc0xuNWlvZzllUmE5MUFOVkxIakZW?=
 =?utf-8?B?UWlDUDI1RmZSLy9CNlMvZzU1V1g3NE95WVN4bXNaYVUwK3FpSlluckpGMVU3?=
 =?utf-8?B?NjFORDU5SkxLai9HdE13eWl4ZGxycXJPY24wVFJjODQva1JaNHJqQzRQcWN0?=
 =?utf-8?B?endjVDA0bXBNaVVWSE1pbzRIYlpXZlFVZFhUTkhPV050WmRpdkhBSXl0Z214?=
 =?utf-8?B?dDMwWGtvZmF6WXM4VjFXbUM0T281WmVNZzdnVWJuVnZERUprZVBxRCtEYUhN?=
 =?utf-8?B?N1lBejMvSWdFWmNxb2tma0hUb0pEMkNKV3JUMDVxYSt5eGczV1d6bnhoZHBC?=
 =?utf-8?B?R21uZ0RhQlF4SmQxampSQUJwZlVRczFpdEprSFhRSloxbEo3eGtOOWhva0kw?=
 =?utf-8?B?TEdTNkhOOEEzV2tITjhrK3kxbnJLdEpqZEdtMCtacGptVU1PdnNPRVkvTXQw?=
 =?utf-8?B?WDJ3dXlWN3E1QVRaUDUvdFJVUmcvRTNqS1VMYnFtV1YzSGRiYnlvL2FEanBh?=
 =?utf-8?B?eGxkSlBsMnhZSUw1RHZGQ2Qrdzh4eExWUGNwazl0RzRxZlZvbXNKaVhuR1A0?=
 =?utf-8?B?S3YwdDJHa1Z2ZmZQZDZEUTNDa3lUNENOZjNxOXBLdXc3akpSeXNwYkQrbkJK?=
 =?utf-8?B?b2NzRG5TYlpQakZrS0V5VXNpczJVWGRQNENFektCdVBwZmtjS1k0aGNzYVgx?=
 =?utf-8?B?eWJpYVhXZ3JVT0RDZEVVY0VVQyt6cStwRktXZmFVNzJrUDF4UDk1MFplOVp6?=
 =?utf-8?B?L1dKOWFhLzU3ZmtGWDVSTzZPdXczVkV4ZlVVYWhjbzBRNEFhK09NTmFSdlVJ?=
 =?utf-8?B?RktOdzNSaXUzbGZCVUI3TkV0RHdMMnkwY1JSRFNQVXpwOTZuQVFxMTVhUG5w?=
 =?utf-8?B?WjRKVzlYZVh0MmRZelBQZ2U5ZFBlNTdiaVpqWW1yWEFMb0MvVkZtY21jRU96?=
 =?utf-8?B?aGZqbG91VkVzaHdMZlh2UjFKeENhcmdVSnBlYnp4VTdZQUcydHRsbTBoK0Nh?=
 =?utf-8?B?SFkvTTJHVWJqaDU5QlZPNk10Nm9WTnp0czV2ZWtDTmE3elVCQktYcERqeE13?=
 =?utf-8?B?NTBRMnJldnNNMGhkbEVUUWJUVTh5Q0txcEhWcGFKaHNDcUhRc3Y3SjYvUEJo?=
 =?utf-8?B?UjZkL1B6cE9zOWE2Ri9Ham5teFNEM05QYnpRY1lrRU0vSDdjMVpnY0E3NjFM?=
 =?utf-8?B?WDh5MjZPeFhqMHU2aXVaUFJ4bmhBdDJwQTA2Z0I0TXVVZGJxcXdZWCs3SjF2?=
 =?utf-8?B?Z3d6NGxzbWtSb1E0ODB5THhMSnVrWHJTZnBnb3pBSW9tNTRwZWhUR044Rm5x?=
 =?utf-8?B?bUJIckR4NkZ5LzdCWGxOOW8rSlNieXM2cFNHZ3pORjR2VmV3SkhnOFppazFI?=
 =?utf-8?B?ZWRYa2FsY2ZkVFpoOU93UVZGU2w2azhwaDZ5MHlBVFQrdkNFVnJzUGk5N2dp?=
 =?utf-8?B?VllocCtnUzBhbXFCWUpNMUxaSEMzRUxYb2NOWGlNM2d4S2lzWWw0eHArSUN6?=
 =?utf-8?B?eVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c216a86e-a3a3-403c-0283-08dd7806b373
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 08:07:13.1981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oTU85053J2NHuyDhAms5qspz8E3vBlCcX4aNXLVEzUWwCRqRF8A/keFVZDmRyNlGn9IuuvUse+qJvC89/ZDIvRsathrioEL2mQ9edIOR5RTR9lxNe51j65wXd8u3VUvS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7502
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

SGkgS2FtaWwsIGhpIFNvYmluLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4g
U2VudDogV2VkbmVzZGF5LCBBcHJpbCA5LCAyMDI1IDY6MTQgUE0NCj4gVG86IFRob21hcywgU29i
aW4gPHNvYmluLnRob21hc0BpbnRlbC5jb20+DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgUGlhdGtvd3NraSwgRG9taW5payBLYXJvbA0KPiA8ZG9taW5pay5rYXJvbC5waWF0
a293c2tpQGludGVsLmNvbT47IEtvbmllY3pueSwgS2FtaWwNCj4gPGthbWlsLmtvbmllY3pueUBp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgaS1nLXQgMS8xXSB0ZXN0cy9pbnRl
bC94ZV9zeXNmc19zY2hlZHVsZXI6IEFkZCBpbnZhbGlkDQo+IHN0cmluZyB0ZXN0IGZvciBlbmdp
bmUgc3lzZnMgcHJvcGVydGllcw0KPiANCj4gSGkgU29iaW4sDQo+IE9uIDIwMjUtMDQtMDkgYXQg
MDI6MjI6MTcgKzAwMDAsIFNvYmluIFRob21hcyB3cm90ZToNCj4gPiBUaGlzIHRlc3QgdmFsaWRh
dGVzIHRoYXQgaW52YWxpZCBzdHJpbmcgaW5wdXRzIGFyZSBjb3JyZWN0bHkgcmVqZWN0ZWQNCj4g
PiBieSBlbmdpbmUgc3lzZnMgd3JpdGUuIEl0IGVuc3VyZXMgdGhhdCB0aGUgcHJvcGVydHkgdmFs
dWVzIHJlbWFpbg0KPiA+IHVuY2hhbmdlZCB3aGVuIGludmFsaWQgaW5wdXRzIGFyZSBwcm92aWRl
ZC4NCj4gPg0KPiA+IHY1OiBGaXhlZCBkb2N1bWVudGF0aW9uIGFuZCBmaXhlZCBlcnJvci4NCj4g
Pg0KPiA+IHY0OiBBZGRlZCBzdWJ0ZXN0cyB0byB0ZXN0IGxhcmdlICg0aykgcmFuZG9tIHN0cmlu
Z3MgKGthbWlsKS4NCj4gPiBSZXBsYWNlZCBpZ3QgbWFjcm8uDQo+ID4NCj4gPiB2MzogRml4ZWQg
dGhlIHRlc3QgbG9naWMuIEZpeGVkIHRoZSB0YWJzDQo+ID4NCj4gPiB2MjogQWRkZWQgZXJyb3Ig
Y2hlY2sgZm9yIHJldHVybiB2YWx1ZXMgZm9yIGlndF9zeXNmc19zY2FuZiBhbmQNCj4gPiBpZ3Rf
c3lzZnNfcHJpbnRmLiBSZW1vdmVkIHRoZSBjaGFuZ2VzIGZvciBmYXVsdCBpbmplY3Rpb24gaW4N
Cj4gPiB0ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiA+DQo+ID4gdjE6IEluaXRp
YWwgY2hhbmdlcyBmb3IgY2hlY2tpbmcgZXJyb3Igc3RyaW5nLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogU29iaW4gVGhvbWFzIDxzb2Jpbi50aG9tYXNAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+
ICB0ZXN0cy9pbnRlbC94ZV9zeXNmc19zY2hlZHVsZXIuYyB8IDk4DQo+ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5OCBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfc3lzZnNfc2NoZWR1bGVyLmMN
Cj4gYi90ZXN0cy9pbnRlbC94ZV9zeXNmc19zY2hlZHVsZXIuYw0KPiA+IGluZGV4IDRmYzc2NGY4
Mi4uYzQzODZmZmNlIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3N5c2ZzX3NjaGVk
dWxlci5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfc3lzZnNfc2NoZWR1bGVyLmMNCj4gPiBA
QCAtMTUsNiArMTUsMTYgQEANCj4gPiAgICoJCXVucmVwcmVzZW50YWJsZSBpbnRlcnZhbHMuDQo+
ID4gICAqIFRlc3QgY2F0ZWdvcnk6IG5lZ2F0aXZlIHRlc3QNCj4gPiAgICoNCj4gPiArICogU1VC
VEVTVDogJXMtaW52YWxpZC1zdHJpbmcNCj4gPiArICogRGVzY3JpcHRpb246IFRlc3QgdG8gY2hl
Y2sgaWYgJXMgYXJnWzFdIHNjaGVkdWxlIHBhcmFtZXRlciBjaGVja3MgZm9yDQo+ID4gKyAqCQlp
bnZhbGlkIHN0cmluZyB2YWx1ZXMuDQo+ID4gKyAqIFRlc3QgY2F0ZWdvcnk6IG5lZ2F0aXZlIHRl
c3QNCj4gPiArICoNCj4gPiArICogU1VCVEVTVDogJXMtaW52YWxpZC1sYXJnZS1zdHJpbmcNCj4g
PiArICogRGVzY3JpcHRpb246IFRlc3QgdG8gY2hlY2sgaWYgJXMgYXJnWzFdIHNjaGVkdWxlIHBh
cmFtZXRlciBjaGVja3MgZm9yDQo+ID4gKyAqCQlsYXJnZSBpbnZhbGlkIHN0cmluZ3MgKDRrKS4N
Cj4gPiArICogVGVzdCBjYXRlZ29yeTogbmVnYXRpdmUgdGVzdA0KPiA+ICsgKg0KPiA+ICAgKiBT
VUJURVNUOiAlcy1taW4tbWF4DQo+ID4gICAqIERlc2NyaXB0aW9uOiBUZXN0IHRvIGNoZWNrIGlm
ICVzIGFyZ1sxXSBzY2hlZHVsZSBwYXJhbWV0ZXIgY2hlY2tzIGZvcg0KPiA+ICAgKgkJbWluIG1h
eCB2YWx1ZXMuDQo+ID4gQEAgLTM5LDYgKzQ5LDQ2IEBADQo+ID4gICNpbmNsdWRlICJ4ZV9kcm0u
aCINCj4gPiAgI2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+ID4NCj4gPiArI2RlZmluZSBTVFJf
TEVOR1RIIDQwOTYNCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBnZW5lcmF0ZV9yYW5kb21fc3Ry
aW5nOg0KPiA+ICsgKiBAc3RyOiBwb2ludGVyIHRvIHN0cmluZyBidWZmZXIgdGhhdCB3aWxsIGJl
IGhhdmluZyByYW5kb20gc3RyaW5nIGdlbmVyYXRlZC4NCj4gPiArICogQGxlbmd0aDogbGVuZ3Ro
IG9mIHN0cmluZyB0byBnZW5lcmF0ZSwgZXhjbHVkaW5nIG51bGwgdGVybWluYXRpb24NCj4gPiAr
ICoNCj4gPiArICogR2VuZXJhdGVzIHJhbmRvbSBzdHJpbmcgdGhhdCB3aWxsIGFsd2F5cyBjb250
YWluIG5vbi1udW1lcmljYWwNCj4gY2hhcmFjdGVycy4NCj4gPiArICovDQo+ID4gK3N0YXRpYyB2
b2lkIGdlbmVyYXRlX3JhbmRvbV9zdHJpbmcoY2hhciAqc3RyLCBzaXplX3QgbGVuZ3RoKQ0KPiA+
ICt7DQo+ID4gKwlpbnQgdHlwZSA9IDA7DQo+ID4gKwlpbnQgZGlnaXRfY291bnQgPSAwOw0KPiA+
ICsJaW50IG1heF9kaWdpdHMgPSBsZW5ndGggLyA0Ow0KPiA+ICsNCj4gPiArCWZvciAoc2l6ZV90
IGkgPSAwOyBpIDwgbGVuZ3RoOyBpKyspIHsNCj4gPiArCQlpZiAoZGlnaXRfY291bnQgPj0gbWF4
X2RpZ2l0cykNCj4gPiArCQkJdHlwZSA9IHJhbmQoKSAlIDI7DQo+ID4gKwkJZWxzZQ0KPiA+ICsJ
CQl0eXBlID0gcmFuZCgpICUgMzsNCj4gPiArDQo+ID4gKwkJc3dpdGNoICh0eXBlKSB7DQo+ID4g
KwkJY2FzZSAwOg0KPiA+ICsJCQlzdHJbaV0gPSAnQScgKyAocmFuZCgpICUgMjYpOw0KPiA+ICsJ
CQlicmVhazsNCj4gPiArCQljYXNlIDE6DQo+ID4gKwkJCXN0cltpXSA9ICdhJyArIChyYW5kKCkg
JSAyNik7DQo+ID4gKwkJCWJyZWFrOw0KPiA+ICsJCWNhc2UgMjoNCj4gPiArCQkJc3RyW2ldID0g
JzAnICsgKHJhbmQoKSAlIDEwKTsNCj4gPiArCQkJZGlnaXRfY291bnQrKzsNCj4gPiArCQkJYnJl
YWs7DQo+ID4gKwkJZGVmYXVsdDoNCj4gPiArCQkJc3RyW2ldID0gJ18nOw0KPiA+ICsJCQlicmVh
azsNCj4gPiArCQl9DQo+ID4gKwl9DQo+ID4gKwlzdHJbbGVuZ3RoXSA9ICdcMCc7DQo+IA0KPiBp
bWhvIHRoaXMgY291bGQgYmUgZGFuZ2Vyb3VzIGFzIGluIGFsbCBsaWJzIGxlbiBmb3Igc3RyaW5n
cw0KPiBtZWFucyAwLi4ubGVuLTENCj4gDQo+IFdoeSBub3QganVzdA0KPiANCj4gCXN0cltsZW5n
dGggLSAxXSA9ICdcMCc7DQoNCkJlaGF2aW9yIG9mIHRoaXMgZnVuY3Rpb24gaXMgZG9jdW1lbnRl
ZCwgYnV0IHRydWUsIGl0J3Mgbm9uLXN0YW5kYXJkLg0KS2VlcCBteSByLWIgaW4gdjYgd2l0aCB0
aGlzIGNoYW5nZS4NCg0KVGhhbmtzLA0KRG9taW5payBLYXJvbA0KDQo+IA0KPiBSZWdhcmRzLA0K
PiBLYW1pbA0KPiANCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIHZvaWQgdGVzdF9pbnZhbGlk
KGludCB4ZSwgaW50IGVuZ2luZSwgY29uc3QgY2hhciAqKnByb3BlcnR5LA0KPiA+ICAJCQkgdWlu
dDE2X3QgY2xhc3MsIGludCBndCkNCj4gPiAgew0KPiA+IEBAIC0xMjEsNiArMTcxLDUyIEBAIHN0
YXRpYyB2b2lkIHRlc3RfbWluX21heChpbnQgeGUsIGludCBlbmdpbmUsIGNvbnN0DQo+IGNoYXIg
Kipwcm9wZXJ0eSwNCj4gPiAgCWlndF9hc3NlcnRfZXEoc2V0LCBkZWZhdWx0X21heCk7DQo+ID4g
IH0NCj4gPg0KPiA+ICtzdGF0aWMgdm9pZCB0ZXN0X2ludmFsaWRfc3RyaW5nKGludCB4ZSwgaW50
IGVuZ2luZSwgY29uc3QgY2hhciAqKnByb3BlcnR5LA0KPiA+ICsJCQkJIHVpbnQxNl90IGNsYXNz
LCBpbnQgZ3QpDQo+ID4gK3sNCj4gPiArCXVuc2lnbmVkIGludCBzYXZlZCwgc2V0Ow0KPiA+ICsJ
c3RhdGljIGNvbnN0IGNoYXIgaW52YWxpZF9pbnB1dFtdID0gIjk5OWFiYyI7DQo+ID4gKw0KPiA+
ICsJZm9yIChpbnQgaSA9IDA7IGkgPCAzOyBpKyspIHsNCj4gPiArCQlpZ3RfYXNzZXJ0X2VxKGln
dF9zeXNmc19zY2FuZihlbmdpbmUsIHByb3BlcnR5W2ldLCAiJXUiLA0KPiAmc2F2ZWQpLCAxKTsN
Cj4gPiArCQlpZ3RfaW5mbygiSW5pdGlhbCAlczogJXVcbiIsIHByb3BlcnR5W2ldLCBzYXZlZCk7
DQo+ID4gKwkJLyogQXNzZXJ0IGlmIHRoZSBpbnZhbGlkIHdyaXRlIGlzIHJldHVybmluZyBuZWdh
dGl2ZSBlcnJvciAqLw0KPiA+ICsJCWlndF9hc3NlcnRfbHQoaWd0X3N5c2ZzX3ByaW50Zihlbmdp
bmUsIHByb3BlcnR5W2ldLCAiJXMiLA0KPiA+ICsJCQkgICAgICBpbnZhbGlkX2lucHV0KSwgMCk7
DQo+ID4gKw0KPiA+ICsJCWlndF9hc3NlcnRfZXEoaWd0X3N5c2ZzX3NjYW5mKGVuZ2luZSwgcHJv
cGVydHlbaV0sICIldSIsDQo+ICZzZXQpLCAxKTsNCj4gPiArCQkvKiBDaGVjayBpZiB0aGUgdmFs
dWVzIGFyZSB1bmNoYW5nZWQuICovDQo+ID4gKwkJaWd0X2Fzc2VydF9lcShzZXQsIHNhdmVkKTsN
Cj4gPiArCX0NCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgdGVzdF9pbnZhbGlkX2xh
cmdlX3N0cmluZyhpbnQgeGUsIGludCBlbmdpbmUsIGNvbnN0IGNoYXINCj4gKipwcm9wZXJ0eSwN
Cj4gPiArCQkJCSAgICAgICB1aW50MTZfdCBjbGFzcywgaW50IGd0KQ0KPiA+ICt7DQo+ID4gKwl1
bnNpZ25lZCBpbnQgc2F2ZWQsIHNldDsNCj4gPiArCWNoYXIgKnJhbmRvbV9zdHI7DQo+ID4gKw0K
PiA+ICsJcmFuZG9tX3N0ciA9IChjaGFyICopbWFsbG9jKHNpemVvZihjaGFyKSAqIChTVFJfTEVO
R1RIICsgMSkpOw0KPiA+ICsJaWd0X2Fzc2VydF9mKHJhbmRvbV9zdHIsICJNZW1vcnkgYWxsb2Nh
dGlvbiBmYWlsZWRcbiIpOw0KPiA+ICsNCj4gPiArCWdlbmVyYXRlX3JhbmRvbV9zdHJpbmcocmFu
ZG9tX3N0ciwgU1RSX0xFTkdUSCk7DQo+ID4gKwlpZ3RfZGVidWcoIkdlbmVyYXRlZCByYW5kb20g
c3RyaW5nOiAlLjEwcy4uLlxuIiwgcmFuZG9tX3N0cik7DQo+ID4gKw0KPiA+ICsJZm9yIChpbnQg
aSA9IDA7IGkgPCAzOyBpKyspIHsNCj4gPiArCQlpZ3RfYXNzZXJ0X2VxKGlndF9zeXNmc19zY2Fu
ZihlbmdpbmUsIHByb3BlcnR5W2ldLCAiJXUiLA0KPiAmc2F2ZWQpLCAxKTsNCj4gPiArCQlpZ3Rf
aW5mbygiSW5pdGlhbCAlczogJXVcbiIsIHByb3BlcnR5W2ldLCBzYXZlZCk7DQo+ID4gKw0KPiA+
ICsJCS8qIEFzc2VydCBpZiB0aGUgaW52YWxpZCB3cml0ZSBpcyByZXR1cm5pbmcgbmVnYXRpdmUg
ZXJyb3IgKi8NCj4gPiArCQlpZ3RfYXNzZXJ0X2x0KGlndF9zeXNmc19wcmludGYoZW5naW5lLCBw
cm9wZXJ0eVtpXSwgIiVzIiwNCj4gPiArCQkJICAgICAgcmFuZG9tX3N0ciksIDApOw0KPiA+ICsN
Cj4gPiArCQlpZ3RfYXNzZXJ0X2VxKGlndF9zeXNmc19zY2FuZihlbmdpbmUsIHByb3BlcnR5W2ld
LCAiJXUiLA0KPiAmc2V0KSwgMSk7DQo+ID4gKwkJLyogQ2hlY2sgaWYgdGhlIHZhbHVlcyBhcmUg
dW5jaGFuZ2VkLiAqLw0KPiA+ICsJCWlndF9hc3NlcnRfZXEoc2V0LCBzYXZlZCk7DQo+ID4gKwl9
DQo+ID4gKwlmcmVlKHJhbmRvbV9zdHIpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAjZGVmaW5lIE1B
WF9HVFMgOA0KPiA+ICBpZ3RfbWFpbg0KPiA+ICB7DQo+ID4gQEAgLTEyOSw2ICsyMjUsOCBAQCBp
Z3RfbWFpbg0KPiA+ICAJCXZvaWQgKCpmbikoaW50LCBpbnQsIGNvbnN0IGNoYXIgKiosIHVpbnQx
Nl90LCBpbnQpOw0KPiA+ICAJfSB0ZXN0c1tdID0gew0KPiA+ICAJCXsgImludmFsaWQiLCB0ZXN0
X2ludmFsaWQgfSwNCj4gPiArCQl7ICJpbnZhbGlkLXN0cmluZyIsIHRlc3RfaW52YWxpZF9zdHJp
bmcgfSwNCj4gPiArCQl7ICJpbnZhbGlkLWxhcmdlLXN0cmluZyIsIHRlc3RfaW52YWxpZF9sYXJn
ZV9zdHJpbmcgfSwNCj4gPiAgCQl7ICJtaW4tbWF4IiwgdGVzdF9taW5fbWF4IH0sDQo+ID4gIAkJ
eyB9DQo+ID4gIAl9Ow0KPiA+IC0tDQo+ID4gMi4zNC4xDQo+ID4NCg==
