Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F34D5B87C
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 07:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C6810E726;
	Tue, 16 Dec 2025 07:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcR/8FcB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D5010E726
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 07:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765871874; x=1797407874;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OPhY9vi8CEOwbskiD3FUNyTy56ZVQ6+/7m41OpH9EuY=;
 b=IcR/8FcBqXDlxAHod+DFy+eVcpMEYgAFPildu3G/LKxFoKP+bsOIR39e
 R+NOZDr7RAbTR/G9/6B0iibc1ZYBF21OFphz9WHIeAmH+kXJOjzJE0F2C
 3agRLnjoYvptq8cKCV4gpA10DkUh10qSA8Y16xoemysMYLa2eCjMR3KX8
 omcQpplQOW3F5dckWYa+bgrpoYW/dCuZ4XGxzDt8yypwU6NO7VzOrEw7W
 guUdmAqYZO9ksv6Xjtynsz6qCwPlaDG69O0HZraKhrbULKhRHLt/8DOh5
 D79XG3XubppNe3uhrMN4rg2q0JJuhQeNKs73xE/0AzCk32/shrSQ/Q5Hu A==;
X-CSE-ConnectionGUID: iG3SP+jARruQi1EaZWq1hw==
X-CSE-MsgGUID: OfAjy2tOTUqsA1HWou0Jdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79239747"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="79239747"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:57:54 -0800
X-CSE-ConnectionGUID: D9hKW1PkTCuat2LyeTsh2A==
X-CSE-MsgGUID: G8hMeW7zQkeK/LdxTIZ+nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="198001712"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:57:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 23:57:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 23:57:52 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 23:57:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQ4Gib6FL+lklfaBdFyH3BolCYqRJvSnjS0Obi9Bm7s/DxHXzciYL3eNfU0Nir49YZ3rlGaby5jY8fbfNVohfdt0UfzypFXvkNurBQHLNhxlhcMbjtDvK9Xf8kbCJXhFqFNHyDOrEFbqxetG9dfF7oSwRmDMo2AN/Gd66HzLlLMaAPrACKmJ8TFENmRsmP29elCfvFWv7GbhUinnxETSHcn7Iv+6ZexF/qp+bf5yV4XL9/Ezx2RtB5Q8JGG67yy89dmPFihY8eac9XOP2Yx4MKkKBXSU+1uaCXYqDy0vUtjutNRhlVzzGft50iYLW1O/EbzblMCEZ7VtLRWaFvTJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8Q9W4RZluKrtx5LLbIJzKdP43L8zHBpPEbMdrvQX+U=;
 b=BgHpu2KsLXWA5JWUuh4BD1KaXpMvAB3e3UNs8kh1uyVbKFOYsKTKkCIdIyxTi4OfYvRUwgFLtA0IVCaQ7NYTlADPFshWQRZfT6or79m+aX8MuB4tZqx+TptxX5tG8tZtfdZ0B9lQ+gLAKfCaxTrDM70+BB780pgcqRPv8GbtFXz1BQYQD3940/a3klFQrUbR0FE1vLXYffDXVm7jrJNctr74V9b6I8875rICAPGOJKTs2ku/cL7VCHCWsgnAeomAiHCoi6JgxJDqM7Fo/FRqx3AmWL0QFZt3X86JCB7aT3XWzrHKJgEtXvaItVQjjcnMOYckOf34TRgEN+1F9YYDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DS0PR11MB7831.namprd11.prod.outlook.com (2603:10b6:8:de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:57:50 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 07:57:50 +0000
Date: Tue, 16 Dec 2025 07:57:41 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 1/1] docs: fix intel-specific descriptions
Message-ID: <6g7c4k4rsx6vj4vxpp3fvyumekw6r2h3ynmbiiwdgxmw32vqa7@ag7fprwm2ixo>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251212104505.342095-1-pawel.sikora@intel.com>
 <20251212104505.342095-2-pawel.sikora@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251212104505.342095-2-pawel.sikora@intel.com>
X-ClientProxiedBy: LO4P123CA0534.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::19) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DS0PR11MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d37fa2-b402-4362-f83f-08de3c78cf0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUNzWkZyM3ZsL3l5L1JiWHhvVHplQ1hKV01uR3E2NGRVT25RUDlyU1Q3ZWU1?=
 =?utf-8?B?VU5KWTlUVURVNEo4RFF0MFRJZHB5dzZzazRQWkRTK2lwQUxvU01QUWk0NzBx?=
 =?utf-8?B?TWdqTkcwVVZ2MXFFU084N09tS3BaZ0FJS2I5S2lxcFI2VWRvQzVlRmVCNDZR?=
 =?utf-8?B?ellCN3pzc29BaFJNY1pvR0lFWFY1eDUwUXRQWEYyWENibTdPdGlYQklVS1F4?=
 =?utf-8?B?M3hpck9DTnVBRkVzYVJqZnY5Zmx6ODFFMzROQ21rbU0wL2oxWDVSWHRid0I4?=
 =?utf-8?B?K1RVRFl2cWpGRzA0NzJWV3RvRjlsV1BlVnh1VjFnVytIWWRhelgxMStld3Ny?=
 =?utf-8?B?NFRzMnduNFNjVWgyT0JhM2pPNjNHU1hONlNsMkMyRXJsYzczUTdya1laSXBL?=
 =?utf-8?B?RnR0Nm1lQVl4ZG85QmZPQ3E5RWhUNFhFTDUreHVzNFYzdWZ6VE5jZzRTTnVZ?=
 =?utf-8?B?bmlTNW9YbUxmTHVUMWc3anhnTFB3UjEyaG1lZzZrRXR0azFwMnlXenFmRzRs?=
 =?utf-8?B?emRQTTRFckRsMFlBR3JUNjJjZWRCSzEwOHpOVFdoYU05K3J4c0pmNW80c3dl?=
 =?utf-8?B?RGhiT1F1SFg4Zm4zRFhXNjVyWHhQVVdzcUhzNEg3ZHo4UEJwL2x6NU1BY2VL?=
 =?utf-8?B?Z2wyazgxWWdmeWdSanF1ektJV2dTTEpqeTVnV0tUTUNmMWYwVFNqZ0N6UktE?=
 =?utf-8?B?MkozL25CQS9NQis5ODk2emYxbnpUdlF6OG1tU0taZXc1SHVoYlNSODBTUVpU?=
 =?utf-8?B?THBMZGlzM0xLMmplMlpKWGRzWEZ4eGorMjJGVnpkdE5JT2c5LzUwUHIvNDgr?=
 =?utf-8?B?VGZsMmh6QVlrU0JCTEVUaXk1QUQra1pNMlVyR0MvU0RUQndSQW9zVlE0VTI3?=
 =?utf-8?B?SHA5MHdJWlFNaWFXL1lCYXJoM0xIOUpZMzhUNlJWRHB0aGo1TXZGK2g0ZlJ2?=
 =?utf-8?B?aFZJM0h2c1gvMWJBUzRJYmNZZW5UMDh1TDVIam9IYXhWN0UwVktxY2s5bUFM?=
 =?utf-8?B?b0FGOXdYZ0gxa25ick1tc0s0aFhqaXZxNVJlSUFFQkt0Nm5scml5OFBpTzNN?=
 =?utf-8?B?QnhtVUZTY2E1UHBONW8yc1prM1pYd2NxQjZGOEtjdFRRQmE3Rko2Q0NjVllp?=
 =?utf-8?B?WmliYXRiQ3g5NXhRNlUxdytOMEswa290MHQ0eVdTb25Ja09jVG9YLzlNcmN6?=
 =?utf-8?B?bC9STjBMVkVCa1FweXNIWHlqeU1taHpnNC9xSzZ0UnZoQk5KTGpXb05TZFZD?=
 =?utf-8?B?TTdHZGN4cE9ZQjJwelUrR1VaWVNZY291UzBtQlc1QVpRSEZSTHpQSlZPNW03?=
 =?utf-8?B?VE0razRzb2t0VC9EcVQ5WWFGK25Rakl6QkVoMm5jMDZZK2h5cGZIckZvRUFC?=
 =?utf-8?B?M04wUlJ6cnVMUXBHdE4ycFdibVZIK3RUK0hGVE1henQ2dUZBbTdrNEoyRnFE?=
 =?utf-8?B?UXE1UW1xOUs2bmVMZjgrZWdJVzNUK2lDS0pMY3hBbDV4eWdDakFNQWZLdXBO?=
 =?utf-8?B?LzRLNFRodjhaVmRxeVJBazBqUzBHWHpXR1F3RERsaFB6STk4anJYMHE1ZDY2?=
 =?utf-8?B?V2wwUnNVdWtqUDBvdmtLTHVVK3ZoYk9QbDNHUXNxOW84MmJOTDJSUngyZmUw?=
 =?utf-8?B?OHhEQTh6UDZNeENvT1BleEltOEZMNTNuMW1Fa2dnMDlLN2R2em1lZ1ZLb0xq?=
 =?utf-8?B?Y3d0ZjVtcnJ5b0U1Z1ZObnVFb2lSNjR1WTBvT3Fla1hjQTZESXB6OVorOWhK?=
 =?utf-8?B?ekJ2NmluREpzSlBNUHNrdDV2Q29EN3hadmlhbWQvUWxtTjZ4a3BwaDM0SVMx?=
 =?utf-8?B?NWhpdUsrRTJOQUNncGVrcVd2V2RLUVl3djE5dGF6YWVjNnY1SzJkREd0SXVh?=
 =?utf-8?B?SkJpZTNXb3pScFh1THNycWpETTZpenlnRTVXZ3dmS0c4WUl3YnYrNTJ6Zklj?=
 =?utf-8?Q?950OtvZE3ZGGAqrpQoOo4LUM9onnudXy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eENOSy9CblkwT2lNL1lZTXhrd3NiTHFMZVFjd3E1bWxHM2NFQnE3S1lWVTI1?=
 =?utf-8?B?Ry9mbWR0L2ExUjJwRTQ4bmxldkNUWHNIdVN3OVd6WlZYeW9KYzNTUEdzR2dn?=
 =?utf-8?B?Ri9qS1k5SGdkOVA2R3diVm1EbzNKYXpCMlphQUxyWHNzYkdJSTcybnp3OGRX?=
 =?utf-8?B?MnB5VUc1aHlZOU8yM0U1WHpiMEFEL1dRYWRNbFEycFhUSFA3RXVlUnB5cVdH?=
 =?utf-8?B?VS9GWEp2MWwvNk5mbFhFZ3huQ2tVN3lrMVZBcVhmVTN0a2RzYWhBaEJqTEta?=
 =?utf-8?B?eVp4enpubVRwTmhQTkJscTh6WjFKeUp6TnV3MkRiaGhQeFBNRGRzNGczSTRZ?=
 =?utf-8?B?MFBySW1zVFlxWGRkYWQ1OVRNV0JMMzFCd2tkRmZMRktoNG9id2x2UkpNaUVa?=
 =?utf-8?B?UEZzZFd1Q2xWcnpOVlVja1VIdEpzR3dMUVlZQ3IydTFGUWNKUFpvVXFSMkdW?=
 =?utf-8?B?alZIU2QxbnZuVlo1L2Y3cFEwbjU4bnAvQ3ZxYlUyeFU1WkVVSVM5YVF5Y3M2?=
 =?utf-8?B?MTV5N0tqNzhKMU5LNWV3VjBPcU5jRm8wQTJ0NkVYVWsxcDNDZVBNUmNpTCs0?=
 =?utf-8?B?cWRFV0lMNmY0YjEzYXNuVlBUN1BFS2VvR25pVzA3ekcweEM5d0xBdm9aVFJM?=
 =?utf-8?B?djB2bHdGeWdtY3lDT3hTU3FMQVBXZGZVTGVjU3FhYkJBYTJMbTNmbm4zWXo4?=
 =?utf-8?B?dXkxSmJyOTdGWXNldlV5Q0RoQW5jb29GanNjbnFSYlVlYnpxMHdDd0RWSWlh?=
 =?utf-8?B?d21ZZG81S25DVzVKaTBHWTZhdzVvZU5jdU1OOUlLUjYweXkzK0RJblNWeFNZ?=
 =?utf-8?B?eThFZVpWb3ZFSzlWV3VlaGxvakhlZEN1NXFHb0RyZjRoeGVFNG90UlcvbHVx?=
 =?utf-8?B?YnZLOUZTekZ4di96MHM4UFN2UjFWYTRwS0lNaDNkVHg2bmxiUUFYa2JTS3BJ?=
 =?utf-8?B?WG9FT25NSjEvTm1DMlh2ZGNrNmpoYjgyT2hkTGpLQW5uSXY0dldYTDR5eU5y?=
 =?utf-8?B?TS9aNjB0WFVxRVhvSHNYbUZib21WTEdNMDdTYmpFd1QrVDJLVG1LR1RnaXBq?=
 =?utf-8?B?N21ROExxNHF5dUZOUkpXVncxVExsME9tem9HeWE2RDVjTlZMb2UrS0UwcmJJ?=
 =?utf-8?B?TlVTbGJmR1Iwb2NWa01DQm5VeFZ2Tmh2VEpjdW12YXAvSjdnbFlzTnc3ZFdK?=
 =?utf-8?B?WE80enNPWmdvczRtbHdVTFNYMjY3UysxMEFVRkVJQ2x3ZkJ4ZFI2NVNZcE9i?=
 =?utf-8?B?Q2thVmlRb2dSbUJicDdhRDVmUHNCbjlhTlhQb3NpajRNTnBCbHFYRGdXSXcr?=
 =?utf-8?B?SmFqeG13NTloKzZ0T1cyZktDd0FYeEx1NHQ4L0hBZjByYVFjUXdRbHNYTFg3?=
 =?utf-8?B?RTlpRmRraHNRQk0xVlpsWDIzTTlkNmZTZTBLOGZOV0xWL2ZZVWdHRjM2Rm84?=
 =?utf-8?B?RnlCbVRGYlpFWG1oSlhJb0o1ZnJlRGEwUWx1VEpzYi9ZL0xUNDVtUnFDUlFR?=
 =?utf-8?B?OVR0aVpaZ2xBbGEyVGdPRGM2aVpFNUYwdkVYdGRZQytPZlBub2FrZnAvNlZP?=
 =?utf-8?B?MEN5Y3FVL2g1bFdPbnlEbjRJSTU4WWN5d1poVmdQaDV0ZmpZSVhoMUQ0UlFx?=
 =?utf-8?B?eWJQdWh6bVBzZy8xcHAvcTF6VnI0aHVURXlMWHk3YzFrdmJJOHB2bjJnUEFY?=
 =?utf-8?B?WHBOTlljK0VqdnJaVGxlUmZUNVA5ZjhkTzU2dDVxZ3hVMjVyQmlDOWp1QlVm?=
 =?utf-8?B?UHRpK1NQQUFmbVRHaGZhOFZUbG0vN2M1ZWRIclQyVGdoRnFIWXlFTUJsMU16?=
 =?utf-8?B?RVNyRDZyWXU0MDUvdElZZjBJdWpPbHFiMjZvdUQxeXVUZlRtM0pIaTNQVU00?=
 =?utf-8?B?dnIzTlBBOEFZeFlyZGp0UjRmdUVVYVZiSUVPcngzSWtLTld3S0dpbFozdThq?=
 =?utf-8?B?dHpadkRQaW4wamV3dkM3ZUg1Y0dBQVRKcDVzMjBFaTVHcHhma0JwRGwvbmd3?=
 =?utf-8?B?Qm5PemJxZHpZK2k1Y0x1eEtTcXMyV0QzVlhIRTNGbTErZm5jQ3pjOVJNanFt?=
 =?utf-8?B?elBEK1VsMml3dHFkV2lvaUdORUJtTTVINHEwTzNYT1BLQXJQT2ZhVzJkZmhR?=
 =?utf-8?B?VDYxaXRsOENZOWZOek15K2JIdzVjMjgyRWxqa1JUa2xSdEdiU2RIYUtta3pU?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d37fa2-b402-4362-f83f-08de3c78cf0d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:57:50.4649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fbGICO5TVzG37QLuHfMZOv7jQLo2s5CvwKfXKXjtPpexx3uI0eR/puvqnaNctGSIB3x/oXjm4KbhElFzAqohmUrziytryW1S5qy8TbGt/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7831
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

Hi Pawel,

[...]

> -Although IGT is Intel-focused, basic support exists for other platforms:
> -
> -- **AMD (AMDGPU):** Some display and KMS tests run; feature support may vary.
> -- **NVIDIA (nouveau):** Partial functionality; manual testing encouraged.
> -- **VirtIO-GPU / QEMU / GVT-g:** Useful for automation and limited pipeline testing.
> -- **ARM SoCs (e.g., Mali, Vivante):** Experimental – not all tests apply.
> +Basic support exists for other platforms:
"other platforms" -> "platforms", otherwise you are missing
"main platforms" and at the same time you are trying to get rid
of the main focus on Intel GPUs in this doc change.

> +
> +- Intel (i915 and xe)
> +- AMD (amdgpu)
> +- NVIDIA (nouveau)
> +- Broadcom (v3d and vc4)
> +- Qualcomm (msm)
> +- Arm (Panfrost)
> +- Panthor
> +- Virtual GPUs (e.g., virtio_gpu in QEMU/KVM/AVD or vmwgfx)
> +- Virtual display (vkms)
>  
>  :material-account-group-outline: Community contributions are welcome to expand non-Intel
>  support!
> -- 
> 2.51.0
> 

-- 
Best Regards,
Krzysztof
