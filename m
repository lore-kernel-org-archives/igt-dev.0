Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21305C54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 05:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A402010E054;
	Mon, 26 May 2025 05:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLoKlr58";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F23210E054
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 05:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748237908; x=1779773908;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pg5u8G/2/ILsTaWRCI4TCUTukRRmJoMBSDVpxNm4y78=;
 b=YLoKlr58qJFiFAUpjIFXUbScEBex4jqy5hQBIow9shEyTTPCKLjDILWS
 hovTO0n9evUSEQp5jD8FkmqtLEe4tZHkrUOli84EAh8O6tjRSadz7epow
 bndqxhl+sOi+4gFbLkzx/tp7HcEWYdq/dfY4574+Babb7SFMw/jaGckEg
 ONng9CNf/xLfP4Mk0/jIjShjzvzkNIeumXy9MMdVATAA4EVWw3e6UtWQe
 bUG/8KqK88YVJEjIh1o0J9DoMtq3PHsUmraW9OEqk8y9pEPE4zlgQo+0g
 YoQL2Ugi3lHGHJ7Uac9CZ54Efzf18kU36yPDPxaU+SctVctkrgHRzu7BH A==;
X-CSE-ConnectionGUID: FV+mx8jOSkOgTD594eVBsg==
X-CSE-MsgGUID: to45LljPQCq8GeIsAcH5qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50310145"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="50310145"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 22:38:27 -0700
X-CSE-ConnectionGUID: jy116UFKRhGjGT50ylpo3Q==
X-CSE-MsgGUID: H6VCfcm8S1yKUP7KPD2YEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142133502"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 22:38:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 25 May 2025 22:38:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 25 May 2025 22:38:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.81) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Sun, 25 May 2025 22:38:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l48CQ4JabVxARYxhZp8JuM2Gl/Z6LaQs31AiFSUws9e+IZd46zvZHxHIXh6vfnzASN7xU28N1fFx8J7s0BalSZ48BA1qK7suMVfWnGY6A8HOpRSifRHsAXPzYz8fT/Fypi5hs1/Xz89pnoXlePstx+rTauAFayb1qqFTofK0JlI3oW7GOKZTVyXDOh+T+V0jy+6u15EPt1VLwP3tjtPjLsPR+kQNsKrSXjTrTt0sh5kqaOvIoVcg+m+e2idcw3CPBkZeFm/g2/nRRSArs0BobVRaqJQ749Yh9bYBKxC+AKr1pu1UNtTXi8gNRStfzVSkyodTeUUQWjmgOU09AjX/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg5u8G/2/ILsTaWRCI4TCUTukRRmJoMBSDVpxNm4y78=;
 b=NmBpyQVurpUrdOp7tk2fA36MZDbeNq1+7fUa+gRwjI5/AV3c6cVLuIQ3tSM0F2w20TB9K9jNiVnWqHCqc2VDTqaNowZOF3SC54LpO8oLTeqafCMILB+Vb/ftC1VbQQSjBJJ2R7YOzODxa0w9n6HkrOG7vvNniwpKidwz1Nc/LzcK4A9RhIfebjZM35TPZd9M3UXcaAHHX1QV2PoTa4w8y6CEEw98y4i2QwB9uD73md+uwZZFZVDBHLKe+GsOetHU7yiMUvnwcRiCK0ouskY1SpNZWFXDHHJ5BmOk0ulr6UG333fU3pbH8zVAfJPbj/cTAlvGtLaJXQpKda6kyL/8cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.23; Mon, 26 May
 2025 05:37:44 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 05:37:44 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzelak, Michal" <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] lib/igt_psr: Skip the test when PSR is
 disabled
Thread-Topic: [PATCH i-g-t v1 1/2] lib/igt_psr: Skip the test when PSR is
 disabled
Thread-Index: AQHbxAE+U4yCFL8fiUCAYMMGRkwDNbPkeAFA
Date: Mon, 26 May 2025 05:37:43 +0000
Message-ID: <DM4PR11MB6312170FB25617B0A4A490AF9065A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250513121918.2758842-1-michal.grzelak@intel.com>
 <20250513121918.2758842-2-michal.grzelak@intel.com>
In-Reply-To: <20250513121918.2758842-2-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB7145:EE_
x-ms-office365-filtering-correlation-id: 0cc5ddff-e383-4e25-655f-08dd9c177058
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ZTYzdVhpa3RqNjJzRTY2M21KUHkySDY1UHp5bmpRVDN1ckNnYTVCcGRPMURX?=
 =?utf-8?B?MkgydzJnbDNRYitxN2RNZGU5NlRvWEh5blpmT05FWVl6V2Yxb2dvdkI1aXRz?=
 =?utf-8?B?MHpucGVZZmQxQ2g2NEtxQS9SbjZSMEJjTW1pSmZiZnJGZ21XbGVIdm5YYXJq?=
 =?utf-8?B?K2NRKzd1SzdodkR5dWxOeDFHdmdsSmFXMDRZSFhvaXJwWlVKVE5oakVpQWcw?=
 =?utf-8?B?OXdSa0NNeWlhaEVhc21zS0ovd1hzNG5EU041bzFZZ2w0ZUZTWm1XTVpUMmd2?=
 =?utf-8?B?TmMxVUhJM2Z2OEFFaVVhNXN4YmhQTTRvTVB6RVNSTlZHamNUcmtlL1hCU2s0?=
 =?utf-8?B?b2RyQ3hDY3RvL3d2MVQ5TTA4aXQyY3RJYzBUOHMyemhWclI5WDhsYjBSS1Fa?=
 =?utf-8?B?a00vbWxpT0xSaHdIUmQzYWtuZEFER2x4NnNYZnpRMG5GZXdzSkZCNnlVVlY5?=
 =?utf-8?B?MmF0QWtQbHUxREIxT3l6dmFxOWJTZ2Vycm41bGszbkh2NzMzUHE2bUZVMHF0?=
 =?utf-8?B?VnZ2dld2eDg4QlFBWGZuM2tXQXg4ZXRhSWFtOTh1WktIUU5GNG5hZTBRbHpr?=
 =?utf-8?B?N2IzQVA0UU1QVkkxSXl0WmpPTFNUZStRYzlYUTZlam9uUmJkTytUWnE5bDlU?=
 =?utf-8?B?LzR1b2t4R1JXNmpvT1Jvc1VaVFM5Yml2WEJlaEFyNnhwRXFZNVNVdDREUlR0?=
 =?utf-8?B?TUdFN1NlS2M2UUxOZ1p6SEE4bFRvR01KRVZCbndyT0UrYmZRMExNYkpIOGxa?=
 =?utf-8?B?Tm9FR0RaUFFGc3RzUDl1dG5vSzJ6WHI4UzYyRlFxa09iVnlUVjJjTitwT2JV?=
 =?utf-8?B?ZDNVOHFISjAza09VZUx4SmZKWDc4Tis0NXNWOHZhRDlVdHpqazBCRkZXTThD?=
 =?utf-8?B?OThzT3FDMVNWUGtZV0llWUQxaFBZblRCS01UeU9HOWV6bk9TelE0LzlzK25F?=
 =?utf-8?B?aENlYlpVODdKWThETmJKQmNUM1I1ekU5a3djMUFLalhaSC9NQmdLNGtGdGNz?=
 =?utf-8?B?ckd6T0E4WlA5aHQ4MGMwSGNLZGJCeE5NMmdpT3diUmx1Y3BTVUdicm53VFE4?=
 =?utf-8?B?c0g4MElpQ3lIQ0FoSnRGdnoyWHVzODZBbGxwZXJqWmhZY01FQjU3bHd2ZHIw?=
 =?utf-8?B?WXA3a1FMdE5KaythSnl0S2h4NUw2b2ZVODQ4T25RbDNOTlF0b0NpdC9HVExm?=
 =?utf-8?B?cWdwRU1DWkVqUTc1aWtYd0xDWlhmWEg4UXBrUUpoV2tjaUw3VW54eXJXWjRS?=
 =?utf-8?B?c3RmSlFpdTdvdzRmSjl4dlVSanh2a3dndGhGeXZ5RWZyM0xyYWw2d0V4SU5x?=
 =?utf-8?B?Mk5RWXdGdFU5TXZXaG1EYTFXRFkwZ2lDUmNkd2JxRXpOajUvUzkxbFV6ME9Q?=
 =?utf-8?B?SUozT0JnS1dYVnFoRjRoblBocmMzcEJpZFBVeXMxODNNV0NqcGRLVTRPc3dn?=
 =?utf-8?B?cFd2YWpSZnppQWNEWDBOS2FjbjhmR0lVRU9pWlE3MmdPREM4L1pjLzhIOFRq?=
 =?utf-8?B?aHE2M2sxL2k1S3FiVG1BcURIWHpLa21GaitmRzFPdERkNTJKb0UyU0ZyWlVq?=
 =?utf-8?B?UVhyVmtabEEyMFpUNmRFVFdodXlWKyt1ZnhRN0ZjcXJ0dVpHdEdKQ0RWSG0v?=
 =?utf-8?B?OWRvakZ4WTd3b3NsN1dNcnpaUVdpZmVva0RtU0UrTlkvWFk1QXZ2R0dONDVv?=
 =?utf-8?B?a2d5SW8rMG5WR0NXUzJ2ZUw1bnFEdXUweUNheGlpb3BoOGRHR053U2pnS2Uy?=
 =?utf-8?B?QitVVGNDN3JBSXgyd0cyT0U2dSsra3hxOVIzNVZRRVhtRXJQTk5TOFhUSGlk?=
 =?utf-8?B?YzZXZkdkWVE0THduWkdGY0VaWCtsRGpqdGVISkRkWGQ2T0JJZm9YQkZ5WlFL?=
 =?utf-8?B?UWZodkZTSzVqcng1cnptNmMyNzhSRlN5b0grbkVPbjJrNE5xNTdMMDBQT1Y4?=
 =?utf-8?B?bWs3akhtTE5HaThtS3BoTmlma0VZbGxMK3lxNTdBaVpPaWNIV0doYnVRdWJj?=
 =?utf-8?Q?2+G1aAa2BeMEZoJl7UAKenywFZoOGE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qks1T1pyd3ZSelBzc2Z2bVh5eTFNTjhScTFqU1lyTUZFK1NIaGJaUjgrK3hV?=
 =?utf-8?B?am5wS3BsbFhEM014OFdaMzZoUHgxd29WZEd4U215ZDJRcnN5TzZJSk9IMk5P?=
 =?utf-8?B?R2psRk0vZUhWYzU3MktTOU1pR1FxOGFoL2xmU2hWVTIvb1hVK240TGZpcDR6?=
 =?utf-8?B?VVZYa254QmNzemJJYThQMTZqYm1hVHdzdDA3aFJld0hoM1NCaUxNUnFKai9Z?=
 =?utf-8?B?N3dOUzY2UmZTWWtOS0ZiMkFGL09MZDk2STlnZDE0Sy8wdUhWNGlZVksxRnlC?=
 =?utf-8?B?cHNNNVM3VmRkTWJyYWFncEhpWFRCY0RUaTVLTGtLMEpTQUpZTlpwVTZKRkF1?=
 =?utf-8?B?TCsrN1B3eWo2eXNPc0VqcUJJNVhPVWs1Y0V5b290Q0R4dEd6Q1o5eUw1aFds?=
 =?utf-8?B?Lys1M1ZLamszdGRJclF6NHV4WlIvNmZKT3F4eEtvZk91Wnk2RERVN3NXNEpn?=
 =?utf-8?B?VXdEeWRlRHpOQ0dTUVFzMk90Z0VjNElvc2c0OFUrQTJ1eHN1ZzFsNm5OZHJ1?=
 =?utf-8?B?WXNHcFYySUV5aWZuRHVPcHl2NFZkVTRBZzBibnlKWlBaZlZ5UGpBSnR2OFhn?=
 =?utf-8?B?aU1pdnVzRVovb0tySEhmLytoMkYzeFF0V1ZXYTlGUWIxVFdqak51cm9Da2lM?=
 =?utf-8?B?TUFydjR6aitlbTRoMUlrRjJDVW93UXlndHE1S1VJV0g2bnU1ek50d3lFQWg4?=
 =?utf-8?B?OXZRWTByREl2bjJkT3dGWE5QZjFOVHYxMU16V1hyL3RPa1MxOWlmK3hkQWg0?=
 =?utf-8?B?WEZxRlhqMkNOZVdueDNVaWxIRW4yNDR4N2ZEK2xxdTJiUkhBVEg4YTNJVlpM?=
 =?utf-8?B?QWN3L3Njc0FEODhsR3h2c0NPQWVRaW5ZMGZwVjVucWVGcUhFU3ZJNjhMRGc2?=
 =?utf-8?B?aXNOWWt5NEFPVTFpS3p6dk1ZVlQvQTZ1cVphczU5NGpjaDVlcVk3c1dSQUZT?=
 =?utf-8?B?SXBSRmU2L0xuY2NhU2FpWFI1eTFpK3JobkJBUU0waW9LaHRiMC94bkdoaXpt?=
 =?utf-8?B?WnV4TDZvZElqc3k4NTF5bmt3N1JCQmw5dVdJOUpqaTBnUmZ4ckFyR1R0V2w4?=
 =?utf-8?B?N1BjblNCUkZkYlZSTFNERDA0K3lIa2FBVitBVFFYTjRFL09qMm8vYUFHeVp2?=
 =?utf-8?B?YW8zcERzY3J0Q3htbDU1QmhxYi9DV1IycjU2Z3pHbDlob25YR2puWGFQQ0Qr?=
 =?utf-8?B?T0tkQno0QlFpRmRZeE83ZEhHdTV6M0pvdDBZVTNZazNraHlzQVh4Q2h3Tjcw?=
 =?utf-8?B?SGc2eGRrV1IwZ2ZIRW8yemdabkdOYmpabTVBZFJNWmdNWHhSSW9zMldlT1Qy?=
 =?utf-8?B?eVZibzYxV3BxWWpIemc0NUNOL0hDTFdEQi8xVjFsTFJoQXd5NFN0VjZybFlF?=
 =?utf-8?B?MkdwWTdxSGM4YUFDbWh3cE00NWw2dVNudlhiQWNCTUJjcWtQK1kycVlDNk5X?=
 =?utf-8?B?L2dwa0IrL0xpOEJIYjkyRjVDQ3d6STV0NE5TQ3NwNFhaL0FZcGc0K0RFVURC?=
 =?utf-8?B?Y0pXa0drY055NXNVU1Nkd0NIUEl1SWFOclJ0MDdjemkvbUR3U0ZBOVJOblJw?=
 =?utf-8?B?blIvMHJaczFYZGtaY1ltWHVlN2dkOWtvN0t1THlJSzl5aVhBYmtOQ3d2THhw?=
 =?utf-8?B?WTJsMHEzb3Nmb2J6M3ViWnQ2anIzLzh3cGVGeVZwelZEZE5HTnFvVzZ2b0Zv?=
 =?utf-8?B?Y3RvUGlpNFd3TGdodTBHREVyQ25ncTh2amVRUTZmK1AzMFFITEh4TXNwRk01?=
 =?utf-8?B?c1dZUUpPNFJ2ZXF4OVM1MDdodFdiaXUxL0F3b3ZEcldhcDI0Z3dWTi9Dbk55?=
 =?utf-8?B?eDM2dFpSakVMbmIwNWE3SmNqWHZrYUV3ZnA4dWxmSm1OZlJOUCtubk9FRUJE?=
 =?utf-8?B?NWJhQzRFUlhIOWdwa1ZvRjg1akFCbjBpQnpFZFhmbHo0QXA1bjVVSFhyZFIz?=
 =?utf-8?B?ZXpSMkRzQlVZbW9lUmNHbzc0dmdDWE5XWlN2TWZmQ3VhVURhUk5xUUYxcEpF?=
 =?utf-8?B?SEs1NEJZOFFDb0dPaXJOVjhVSUpWL2owd05kTU5jcGpsR21NbEduelp4U3Q3?=
 =?utf-8?B?cy8rY0o3UHRCYm0vd2FWN0NjV0M1SHZ2WHlucmRQRTBtQkpPRHR0bHNmOEVx?=
 =?utf-8?Q?PY5A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc5ddff-e383-4e25-655f-08dd9c177058
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 05:37:43.9306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7r7dmF/ZtPddLhdlHiektBMI0Gnmr0NtGXWbA6AydLc+Si1erWxwPlymCZr3DWzWFMM2aWOQkgmkPQw2Ig2gBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTWljaGFsDQo+IEdyemVs
YWsNCj4gU2VudDogVHVlc2RheSwgTWF5IDEzLCAyMDI1IDU6NDkgUE0NCj4gVG86IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBHcnplbGFrLCBNaWNoYWwgPG1pY2hhbC5ncnpl
bGFrQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYxIDEvMl0gbGliL2lndF9w
c3I6IFNraXAgdGhlIHRlc3Qgd2hlbiBQU1IgaXMgZGlzYWJsZWQNCj4gDQo+IElmIFBTUiBzZXR1
cCB0aW1pbmcgaXMgbm90IG1ldCwgdGhlbiBQU1Igd2lsbCBzdGF5IGRpc2FibGVkIGFuZCB0ZXN0
IHdpbGwgZmFpbA0KPiBhbnl3YXkuIFNraXAgdGhlIHRlc3QgdXBvbiBmaW5kaW5nIHRoYXQgc2V0
dXAgdGltaW5nIHdhcyBub3QgbWV0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBHcnpl
bGFrIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGliL2lndF9wc3IuYyB8
IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jIGluZGV4
IDNkOGYxOTQ5Yi4uZjM1MDUxZWJjIDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X3Bzci5jDQo+ICsr
KyBiL2xpYi9pZ3RfcHNyLmMNCj4gQEAgLTM4LDcgKzM4LDcgQEAgYm9vbCBwc3JfZGlzYWJsZWRf
Y2hlY2soaW50IGRlYnVnZnNfZmQpDQo+ICAJaWd0X2RlYnVnZnNfc2ltcGxlX3JlYWQoZGVidWdm
c19mZCwgImk5MTVfZWRwX3Bzcl9zdGF0dXMiLCBidWYsDQo+ICAJCQkJc2l6ZW9mKGJ1ZikpOw0K
PiANCj4gLQlyZXR1cm4gc3Ryc3RyKGJ1ZiwgIlBTUiBtb2RlOiBkaXNhYmxlZFxuIik7DQpMZXRz
IG5vdCBjaGFuZ2UgdGhlIGZvcm1hdCBoZXJlLiBXZSBjYW4gc3RpbGwga2VlcCBpdCBhcyBQU1Ig
bW9kZSA6IGRpc2FibGVkL2VuYWJsZWQNCj4gKwlyZXR1cm4gc3Ryc3RyKGJ1ZiwgIlBTUiBkaXNh
YmxlZDoiKTsNCj4gIH0NCj4gDQo+ICBib29sIHNlbGVjdGl2ZV9mZXRjaF9jaGVjayhpbnQgZGVi
dWdmc19mZCwgaWd0X291dHB1dF90ICpvdXRwdXQpIEBAIC0xMjIsNg0KPiArMTIyLDggQEAgc3Rh
dGljIGJvb2wgcHNyX2FjdGl2ZV9jaGVjayhpbnQgZGVidWdmc19mZCwgZW51bSBwc3JfbW9kZSBt
b2RlLA0KPiBpZ3Rfb3V0cHV0X3QgKm8NCj4gDQo+ICAJaWd0X3NraXBfb24oc3Ryc3RyKGJ1Ziwg
IlBTUiBzaW5rIG5vdCByZWxpYWJsZTogeWVzIikpOw0KPiANCj4gKwlpZ3Rfc2tpcF9vbihzdHJz
dHIoYnVmLCAiUFNSIHNldHVwIHRpbWluZyBub3QgbWV0IikpOw0KPiArDQoNCkkgdGhpbmsgaW5z
dGVhZCBvZiBwcmludGluZyBsaWtlIHRoaXMuIEl0IGNhbiBiZTogIFBTUiBzaW5rIG5vdCByZWxp
YWJsZTogeWVzIChzZXR1cCB0aW1pbmcgbm90IG1ldCkNCg0KVGhhbmtzIA0KSmVldmFuIEIgDQo+
ICAJYWN0aXZlID0gc3Ryc3RyKGJ1Ziwgc3RhdGUpIHx8DQo+ICAJCSAoYyAmJiAoYy0+Y29ubmVj
dG9yX3R5cGUgPT0NCj4gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0KSAmJg0KPiAgCQkg
IHN0cnN0cihidWYsICJTVV9TVEFOREJZIikpOw0KPiAtLQ0KPiAyLjQ1LjINCg0K
