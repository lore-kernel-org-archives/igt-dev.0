Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE9DC27C75
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 10:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD8010EA25;
	Thu, 13 Jun 2024 10:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsdVHVq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF62F10EA23
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 10:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718275296; x=1749811296;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=BbwJ5VDeY6nL3uoMA4v+xr24/55hKhPDXQspb5C8130=;
 b=BsdVHVq+NySlk32URs666rzMHacMcmLBVnpZPRcyaGvHXtyEsDKObGIR
 PakcnnmGd/BFAx1Vs7egUsHO+i/fgo0eIZc5Ml9x0kLmLLHaJbC6fu9TF
 K36c45uFe6VbWscdJi5/VZzrNx3lD/iq185p/8LOsHUA1D+CUc7RgSkFY
 0nsV+/NmXJNGpKFRLmAWJPXIhvUML1znCJOWy2pUiISOYrqGOuWbOKMCk
 4e9m9HXGDgXd4qEl3AEROzsCCOsf1AIbQcF55U9NdzcU4MRIx8OfF9qIP
 w80FYJ8YGG7a8jJ/XCTb8FRyt7RJLprh183FC8BeC28PPvtcxaTDQ5+xy w==;
X-CSE-ConnectionGUID: n/YqE1EUSOS6P9Tk5FA0Pg==
X-CSE-MsgGUID: X3Ii73g3QIuWPPwtc2bZAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15212447"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="15212447"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:41:35 -0700
X-CSE-ConnectionGUID: FYvb+se5TImTPxWLJDHQ1A==
X-CSE-MsgGUID: GeVjkVEvTTetXjxV645IfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="71313140"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 03:41:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 03:41:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 03:41:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 03:41:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8Uu3Cr7rXQtWACLAuvdHbGStOsxqbxKbqN146HjI/xSf9duY64n8Qu9JgL3T3TTok0IglH4dMfPyW8Zv2/zaczfQxNniaB4VnmGGC6uWhGMMlarecGlW99eJfkk5IitTYt0PlV6N3eKxobDM4Y1jbgWCyU59YOhNir7QrmF6X5aSTPsfv48deFGmSqmxvzWGVNKiXuamIc8I6j49Hjd46W0plNLTqVLmqqXwiKJ+5AEuv280G5iM5uWecBtQIdPJi679kALJ4UCHJ7gI2IOt14Rx7QA0NlXFjnTQGW+hcnnRP/pL4if7EVl5XmieiCOhUfyyMhrFvJU9yuN+yxtJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbwJ5VDeY6nL3uoMA4v+xr24/55hKhPDXQspb5C8130=;
 b=VcDPa8/s7mwcKT2tPG5dBsYpBNUaideZv9qIy+I8vdkq1boyjmFxCDkUPmWRoe52e5S3Zt5gTRppgCjGGnSdl6ZY8btSI8NEbul26+QZdYY5wVfzzyMs5cpWXq+obgBhE4nIQ2HXS0/lQg8Q/RGUH9AqzpNbVol8T379IeMtJJQ4PME+4Rq1pPHqWYnL6WRzZNvUkpZBwTogRHeq1kqGYJCdPxD2i7nrpzDF1V3NM75DkgfzDZJPvu/i4jr1YKagcoBeT/8/7ipMGVLXrG0e4dP6EY/aKdhHNbUYm+YYgUFTiQjK0Q+5Z3mAC8oz+JxHaaYI8ezTApaFcH2lb8M8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 10:41:32 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7633.036; Thu, 13 Jun 2024
 10:41:32 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for early
 transport
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for early
 transport
Thread-Index: AQHavLeNk14XGDjA/kq+1TBMntkz5bHFgxKA
Date: Thu, 13 Jun 2024 10:41:32 +0000
Message-ID: <0638aa69b474837dc2d0bde5ec3a3235567a36e0.camel@intel.com>
References: <20240612110645.1110374-1-jeevan.b@intel.com>
 <20240612110645.1110374-3-jeevan.b@intel.com>
In-Reply-To: <20240612110645.1110374-3-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CH3PR11MB7914:EE_
x-ms-office365-filtering-correlation-id: 5d34bee3-c12f-4037-90a0-08dc8b9563f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230034|376008|1800799018|366010|38070700012;
x-microsoft-antispam-message-info: =?utf-8?B?MGs2WVJGYTRtWkZFUDFkZHBnZko3eldURXlFQXR6S1ZyQ2cxNFMzdVNHZ0hS?=
 =?utf-8?B?MklRNWxpczlHK1oxTGFnUUtmSW1YWXBDc0NocEEya0Z4L2F3b0ZNRDVmVVN1?=
 =?utf-8?B?RGJOcEtkejZYaHBnc2tmR2l6VFYxcW5FNGQwMkgrWWtlSGVpNVBSVXd1dmh0?=
 =?utf-8?B?VGlrelhtcE80dFFvUXB1Vmt3YWM2ZXlOS2pXWG5mdUdYQmg4UW5NOFVNZFZ0?=
 =?utf-8?B?eHkzQjhiSmZEcEZhTE8wVkJaR0pQOUJVZXRRU2pDZGhueFRuR05CS0tNMnZu?=
 =?utf-8?B?RVVTck5ORFBIZWRZblRGeHN4N0tHUWdhczU5RmhlY2NiZHZXSHZsYzc4SzZK?=
 =?utf-8?B?Z3lFOVpDZ0tvZEYvT3RmNkZhVVBkeHh2cW1QSm9SYjlzTS9DNGtPa3Z3dXhn?=
 =?utf-8?B?Q0F4dU90ajh6QXpwM1p6SkJQK21DYUxZUmxFOUNnRU4zaGUzMURxTkI0clNL?=
 =?utf-8?B?Mk15RjliWVBIemJTTHd6ekl3YW1SWGJlazFzMmNWTi9YaFVNWmE3cWNmYmMx?=
 =?utf-8?B?NmJ4S2t0UHZyWTBUeTFXeitYQUFIcDZndUVyWnZpWEh0UGJWbkU4VjlnaHpF?=
 =?utf-8?B?TEh0dnZuSnpYNGFiZXVmcFBFWXZObFl6c1pkVlVmN3BhOEJsWDEzUmNpWDlF?=
 =?utf-8?B?S0E4anpoSEFmRWVvZm1jY1l1ZlNHM0J2Q0xrT0xXR1dCUjF1RzdVKzErdGNY?=
 =?utf-8?B?TDNKbEdlYVZTNHdJSTIzR296MlFLMkxZYjBKeTFGOG05NEp2WU1nUTUraWYr?=
 =?utf-8?B?U2IwZU5iSGV2MTl6Tzg2dHhqb0ZGbTFwOHVGSWQwMnlzeGhuNlNFQVNqaW5Q?=
 =?utf-8?B?bGxIVlQ4TGtXT0lMVWJTcnJPcEwyNG1nT3Exd21nVFc5UHVNR1pUOFVxazh4?=
 =?utf-8?B?MlNUTXFLbmRXWnlMNFQ1VlI0Q0Vjei9tYm5qcmJJaUhKNzhDSCtVcWJrUC9K?=
 =?utf-8?B?Vm84c0VWYTV5eVJpazZ5enBuNXNvNVVEQklLeGllZDJFbkgraWhRWlhiWlI3?=
 =?utf-8?B?UGdKdGV1Q0k3Z2o0L2J4dHdPczBubTVjK3VxT2pZeCswNy9SRkRYNEdrbUJx?=
 =?utf-8?B?ZjV1UE9ySGNDZkJubHpjcld6djA2VGhEREo4bUgxT0tCRGZlcFZmdHl1MEE0?=
 =?utf-8?B?YjVvUnNCN3kwSzg3Zi9veHRWdVBCWXkvakJMRHlmc2NEZlp2NzBoYTJ3c0tH?=
 =?utf-8?B?aURTWXNTZmxKR2FOZTJEVUFWYlZSM3FCMHpsSEdDTFF2cURPM1RaVHYrdGRE?=
 =?utf-8?B?TUZHSFExRUV5Zkp3RXorTXJtTytxUzV2YUF5OWh0dU42TDFMbUgwVlFzS2gv?=
 =?utf-8?B?dkJyc1dURFNleUk5ZjU5R2h0WldQNkN6KzhEWFBjZitlakRDbFQxQ2JYcDlX?=
 =?utf-8?B?cnRwdGs4dVRXUVBtOVphbHhZeEx4dHIrSXA1aGlwTmdtZnQ1cCtkQmY4K3hU?=
 =?utf-8?B?Vldobmt1QVFwZFIxUm8xcWpyMzZpYVJoc2NlelNDbTRKbnIza1ZwNTVLeEJN?=
 =?utf-8?B?L0VFSnppWXNYWXRDcW5HellBd1BMT0twdG5XV2I1b2tSc2w2NjFZNFVDYStS?=
 =?utf-8?B?THQ4a3FKZVRBMDA2d1pDMW9FL3JJcFdKV2ZMb3JZcHNVMjAwcUV0NWpiUGlV?=
 =?utf-8?B?NmYrbGRCZHhrRmlKR3JscmRLMlZrSFRLbjhId3c0TGZXbGt6ZWtNWTh4TnY3?=
 =?utf-8?B?QnlPQlcwRDhCUGFJQTlHd2dqZ2J0cWJqZG9oWUNvaGx5UWlCYlNFNTlvZFpW?=
 =?utf-8?Q?CBR8RUrBkMdAEMsq20PqI/J1dV5SPBa12oR/Vhp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010)(38070700012); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cW1NeklNTVlHZjhjZGM1cHp5WEpUbFVhdEd3aTgvU3B1Y0VoNXdwZDIwUnh1?=
 =?utf-8?B?dTJ1YUVrQ1dSeitLN05zbWVyRlA1UTRJUEh4NFVEMjBGdUxCbVUxT1hscnpp?=
 =?utf-8?B?aVpyOFgybjMyUzhIM3d1WjJrR3ZIL2lpQUZ5anlTLzA3MVdDMVpybHQ4UGtF?=
 =?utf-8?B?MVpnMHlVU3dGbTZqNlJLNnJvdE5McDE2d1Y1ai9aVUZEL05adGpiN25VKzhn?=
 =?utf-8?B?UEdUKzc4Q1RjckE5anFlaW5QZ0pEK1FnVWRrOVF2TU54MU1YNmlMWEVhUWkx?=
 =?utf-8?B?QjA4a3dXNmdsV0NpR2YrV2M1OEhqaGU1cGY5VXBmTHBzSzhIL3BLWk1SRUpr?=
 =?utf-8?B?Z0g3RnhmYUJhV0NvbW9lUDhNUFpaS3VSM3hIVDIwSjNibEk1ZExIU0F6NGlZ?=
 =?utf-8?B?VlA2ZHNJVytWeFErbDdPNms3Skhjcm0wQXpFa0Z5aEJ1dkMzUEMxMXpZMXJ0?=
 =?utf-8?B?RWZzbVNOZTFYdHhZdEJxWTBQcnVyZXBYQXMrU095Z2VESE1WSWl2OGtqYUdD?=
 =?utf-8?B?QVFBWnpWODhsVE9wVkJXQTNiY05YOGZ6RjNDd3lreGtlT28wSmRPV0ZFN3dH?=
 =?utf-8?B?d3VCWEN3MDEzZkVpaVhIVkR2ZjJTeUpLUkdVenpTMWhqVTFXemRHV2UwS0ls?=
 =?utf-8?B?aVVSUnEvYUhBSXFwazJYdlZCV2ZrdlFNMVZiSnA1RjgwdGgrbHAvcklUdUlh?=
 =?utf-8?B?c3dYZzh1aXc2a0ZPVkJRYTdhNXJpS3M5clFHSm9vMFE4bFF5NmJpSWhhQ3E3?=
 =?utf-8?B?WUI4K0o4cERYaTJkUmVJSU9YQ1J2dFU4SjQzWFowb3ZtQmc4K0pZdzVhRXFP?=
 =?utf-8?B?VEdHQ3dTYThGV2svWEtlWWJlM1pVTUUzNkxla2diaTg4bXFPOTBOWXk1c2JP?=
 =?utf-8?B?cFBGdUZxRTRqa0VmbWJlTkJUZ0VCTUEzb01GZXM5SmQxZ3lDWnREK3hsMnA3?=
 =?utf-8?B?S2VTTGNKZVM0cXRLRVNOTStTUGI0eUllM1UvUmxwU0U3YSs3WnFmeFhWNDE2?=
 =?utf-8?B?L3d3Zm9GVVFObjJ3UVdKUE5YdzJ5NHUrWVpTcnViWWtySnRnWkxPZkw1TDJM?=
 =?utf-8?B?SjRrbzloWnh5ayszS0kyVXFscU54QkIyTkhUZHpKZXAxZ09tQUtSdnE2RkU4?=
 =?utf-8?B?VGJRWjJSN0VCNEhjTUFrekpCZVdnaHFhYlZ6WU0ydDc5RG9WTTJsMTNzWDY0?=
 =?utf-8?B?amZjVFV1QjdvMnVMQUhjZkQzcHo3VCtKVW5qZDNtVTJHV2VzemJ4SEVPdGJL?=
 =?utf-8?B?NzVITElCMWRaOWlFMVR2bWRqSW1JNHAxcnpvbnp3MUNVQ1AzaWtTZDFXQjNo?=
 =?utf-8?B?Z1ExWEJHQk5mVkZrNU10QUIvTnZ0amJkeTAzZlp5TzNEa3k1dHVraXE2SGdx?=
 =?utf-8?B?MHRnblI3WEVZUWpVR1l0ellaVWxCcHV2VlRucE1YNUU5bEtVYkhmcXU1TDFu?=
 =?utf-8?B?SHFMbE5lUzhBWjFxNzBLOXg0Y3dvV3RuczNsSUxkSVhJRWZMWEh5dGoyRHB6?=
 =?utf-8?B?YnYzTmlLc0xuT2t4QkFuSHZ2b0x0UnVXbWdkME5KMmFNaElxakwvUVhkVW03?=
 =?utf-8?B?Rm04T2V1ZlJzRE5OZEVRQ2ZlZ0t1ZUtzb3dab3hiekVTOE1CZnNzN3I1WHR2?=
 =?utf-8?B?akMzQW90R2hyMzRlRkZWUW1qdjNSUGliVVI5Y0p1eVJDdWsyU2tlNmVFK3Ri?=
 =?utf-8?B?LythR09DMjlrVXp0ZDJicTkxMTJ5cWwwU1JKQnFrZXBnSUludk1nZjdXTmow?=
 =?utf-8?B?dEhkcUtaOGZwaGY1bEhoUTRYSUVKRlZhMFk3bDRRRlU2N3hDZjR3UXNPK1Fr?=
 =?utf-8?B?eUFqMVdQMkcvc1I5ZkF1UlhGWVliMUdZZm9tbEhYc1NhTFEybkFFQ2Q5Nk9I?=
 =?utf-8?B?Z2JIeHF3N1gvdlc3Z3ZsTHhvRXRIMThDRWNkeVFtWE1NRW50Rnc5OXdOa1BR?=
 =?utf-8?B?MGFIaVdhWmUwdUFlS01mYW5PRC9SMXNaa1hWZUR2WHJZY2szRGxpSHBpZ3l5?=
 =?utf-8?B?M1lkM2tGV1dwTEdmREIwR3VZM0dBTURhQ2JPWHE4aVU2QzFiTTU2VFdZbGJG?=
 =?utf-8?B?d0tNZXNnc0xLalFzMGpGYkpORDVIcGdiKzFqampabHNaWFgwdWFtSkhZT2pR?=
 =?utf-8?B?dVFJTzRtK1RYUlB4c1Z1TFpIemJMK2hNYithWU5FUS9UQzF5dVFid292R2hY?=
 =?utf-8?B?cVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0455B87A2A3D594FAB4FA300ADD07640@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d34bee3-c12f-4037-90a0-08dc8b9563f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 10:41:32.2650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XLYeetdnRC+op4HJGeWX8YdaAqH52xaLS354PLH8BuYVrMA6jlumb1KFtILNQT8QMZIVxluTGK8nIFuY9uGKEncXht5+ndO2DzSH30ZHEkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
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

T24gV2VkLCAyMDI0LTA2LTEyIGF0IDE2OjM2ICswNTMwLCBKZWV2YW4gQiB3cm90ZToKPiBBZGQg
Y2hlY2tzIHdlYXRoZXIgZWFybHkgdHJhbnNwb3J0IGlmIHN1cHBvcnRlZCB0aGVuCj4gd2UgY2hl
Y2sgaWYgZWFybHkgdHJhc3BvcnQgaXMgd29ya2luZy4KCkdlbmVyYWxseSB0aGlzIHBhdGNoIGxv
b2tzIG9rIHRvIG1lLiBJJ20gbm90IHN1cmUgaWYgYmV0dGVyIGFwcHJvYWNoCndvdWxkIGJlIHRv
IG1vZGlmeSBwc3JfZW5hYmxlIHRvIGFjY2VwdCBQUl9NT0RFX1NFTF9GRVRDSF9FVCBhbmQKUFNS
X01PREVfMl9FVC4gV2hlbiBQUl9NT0RFX1NFTF9GRVRDSCBvciBQU1JfTU9ERV8yIGlzIGdpdmVu
IHRoZW4gaXQKd291bGQgc2V0IHRoZSBFYXJseSBUcmFuc3BvcnQgZGlzYWJsZSBiaXQgKDB4MjAp
LiBUaGlzIGlzIGhvdyBJIHdhcwpkb2luZyBpdCBmb3IgUGFuZWwgUmVwbGF5L1BTUiBoZXJlOgoK
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzU5ODUzNy8/c2VyaWVzPTEz
Mzg2NiZyZXY9MgoKV2hhdCBkbyB5b3UgdGhpbms/CgpCUiwKCkpvdW5pIEjDtmdhbmRlcgoKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPgo+IC0tLQo+IMKg
dGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYyB8IDE4ICsrKysrKysrKysrKysrKysrLQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYyBiL3Rlc3RzL2ludGVsL2ttc19wc3IyX3Nm
LmMKPiBpbmRleCA0YzNlMzRhYTAuLmU2MTJiODI2NiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pbnRl
bC9rbXNfcHNyMl9zZi5jCj4gKysrIGIvdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYwo+IEBAIC0x
NjgsNiArMTY4LDcgQEAgdHlwZWRlZiBzdHJ1Y3Qgewo+IMKgwqDCoMKgwqDCoMKgwqBpZ3RfcGxh
bmVfdCAqdGVzdF9wbGFuZTsKPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBiaWdfZmJfdGVzdDsKPiDC
oMKgwqDCoMKgwqDCoMKgYm9vbCBmYmNfZmxhZzsKPiArwqDCoMKgwqDCoMKgwqBib29sIGV0X2Zs
YWc7Cj4gwqDCoMKgwqDCoMKgwqDCoGNhaXJvX3QgKmNyOwo+IMKgwqDCoMKgwqDCoMKgwqB1aW50
MzJfdCBzY3JlZW5fY2hhbmdlczsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IGN1cl94LCBjdXJfeTsK
PiBAQCAtMTg0LDExICsxODUsMjMgQEAgc3RhdGljIGJvb2wKPiBzZXRfc2VsX2ZldGNoX21vZGVf
Zm9yX291dHB1dChkYXRhX3QgKmRhdGEpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoGJvb2wgc3Vw
cG9ydGVkID0gZmFsc2U7Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBkYXRhLT5ldF9mbGFnID0gZmFs
c2U7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAocHNyX3Npbmtfc3VwcG9ydChkYXRhLT5kcm1f
ZmQsIGRhdGEtPmRlYnVnZnNfZmQsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgUFJfTU9ERV9TRUxfRkVUQ0gsCj4gZGF0YS0+b3V0cHV0KSkgewo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gUFJfTU9ERV9TRUxfRkVUQ0hfRVQsIGRhdGEt
Pm91dHB1dCkpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3VwcG9ydGVkID0g
dHJ1ZTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGF0YS0+cHNyX21vZGUgPSBQ
Ul9NT0RFX1NFTF9GRVRDSDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGF0YS0+
ZXRfZmxhZyA9IHRydWU7Cj4gK8KgwqDCoMKgwqDCoMKgfSBlbHNlIGlmIChwc3Jfc2lua19zdXBw
b3J0KGRhdGEtPmRybV9mZCwgZGF0YS0+ZGVidWdmc19mZCwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQUl9NT0RFX1NFTF9GCj4gRVRDSCwg
ZGF0YS0+b3V0cHV0KSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3VwcG9y
dGVkID0gdHJ1ZTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRhdGEtPnBzcl9t
b2RlID0gUFJfTU9ERV9TRUxfRkVUQ0g7Cj4gwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSBpZiAocHNy
X3Npbmtfc3VwcG9ydChkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVnZnNfZmQsCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUFNSX01PREVfMl9F
VAo+ICwgZGF0YS0+b3V0cHV0KSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBz
dXBwb3J0ZWQgPSB0cnVlOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkYXRhLT5w
c3JfbW9kZSA9IFBTUl9NT0RFXzI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRh
dGEtPmV0X2ZsYWcgPSB0cnVlOwo+ICvCoMKgwqDCoMKgwqDCoH0gZWxzZcKgwqBpZiAocHNyX3Np
bmtfc3VwcG9ydChkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVnZnNfZmQsCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBTUl9NT0RFXzIs
Cj4gZGF0YS0+b3V0cHV0KSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Vw
cG9ydGVkID0gdHJ1ZTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRhdGEtPnBz
cl9tb2RlID0gUFNSX01PREVfMjsKPiBAQCAtOTE2LDYgKzkyOSw5IEBAIHN0YXRpYyB2b2lkIHJ1
bihkYXRhX3QgKmRhdGEpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfYXNz
ZXJ0X2YoaW50ZWxfZmJjX3dhaXRfdW50aWxfZW5hYmxlZChkYXRhLQo+ID5kcm1fZmQsCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRh
dGEtCj4gPnBpcGUpLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAiRkJDIHN0aWxsCj4gZGlzYWJsZWRcbiIpOwo+ICvCoMKgwqDCoMKg
wqDCoGlmIChkYXRhLT5ldF9mbGFnKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
Z3RfYXNzZXJ0X2YoZWFybHlfdHJhbnNwb3J0X2NoZWNrKGRhdGEtPmRlYnVnZnNfZmQpLAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkVh
cmx5IFRyYXNwb3J0IERpc2JhbGVkXG4iKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBkYXRhLT5z
Y3JlZW5fY2hhbmdlcyA9IDA7Cj4gwqAKCg==
