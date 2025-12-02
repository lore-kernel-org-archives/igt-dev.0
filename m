Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243FFCFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 09:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D5C10E59E;
	Tue,  2 Dec 2025 09:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUCXtXiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2630B10E59E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764667331; x=1796203331;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=+paRB7TDwaV5c+zJE+Oq2cyh80IM1oO5QgCo54Px03Q=;
 b=BUCXtXiW6hqW3vWOqnnxiuCSJIUXb8DEBTvpDJMIgZdaSujGe02Q3NcB
 2Ol0cphvHzKg+rDVG36iuWkRRk6e+fowjD9iTwjJqhK+8i7sMlXZqwrsv
 FqagT5mZn8UOzDf5Xb2+bxcLjwSY6mqAICH8lt7gjz+EJKvR+N5VR+sMz
 306T6T/YSffZWrWW7txt5fm87xb2iBTT/zBtZhErDEGbDCb91a7BZDfzX
 G1uYP2PvEAyH09RP4xUssERAHk7zRRRbLFCE++cbxLw2zCjrv8ff14t1T
 pLbilIYj9ialnDEXx+YxKtgJ8Nzf3LFOdbfEd+RC+k97C6/hU/OeZnmDT A==;
X-CSE-ConnectionGUID: Ut3s4hyGRcGrnGMe3U5ZDQ==
X-CSE-MsgGUID: mw5ivhKKRg+PwuHJ33dUNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84022148"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="84022148"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 01:22:11 -0800
X-CSE-ConnectionGUID: qIgDjbsPTxSSrDC7jt3lPg==
X-CSE-MsgGUID: MQXBFXIYSLu3hqz8gTbG4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193621621"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 01:22:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 01:22:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 01:22:10 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.50)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 01:22:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NayiiiTIQu8ZRyiy3D5mCdesPY6dfzlGrb80zuCSzI6w+9S98dV2vn1z5fej2MQgqAnev/AVC0tNDAe2ne60c6ZKkCFTAA0GNE1Y8EB3Ym78ZZpUCrhjFoYAAhmRqxgcUfSUPKDUDhivIXWUvUUEWdMAoOz3ReuD+xdLh1+FR1C92jSCsIi3v4QdkWpg/WA5F7vI3GBzDOYt1nSu3c31ZBNKb0eZmhNYTP8bzcdPdjj6gthPevxTGFgEY3hFaS0l8pgGzfyrApgB873EXAnRIBGESrTUL0BkdJiG+zkygpSX3Du+/NGq6TKrfywfXK/b4LpLzNE6pd+SHbFteRlrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+paRB7TDwaV5c+zJE+Oq2cyh80IM1oO5QgCo54Px03Q=;
 b=R2I2vrb9sIoMmjOsv450zjK40s23WfewXXbqkFl2I6isr5GHjJChPCUG+kp7ZPMMts5d/HhtwqqjdpqAMrwFZeNZlTIvTWK6xURk7gaU2XX+z2qFBXoOmm6xd/QoxgwWO0HO9kF5VG3EDBg48VIUhr2Cpo3dzW+RCcCgT+43G7FUUU5ZtUTSSopUQr5zgs2sBYhDB6hfmEEKr3oLd2quA85BRSuTmjmj44dQ+Xm8/nwfEaCvQMUAtyGAdDUQj2F4qlrcisaSsQxtLR4H35dtbaIaTR2BSt8TtEiDKgz74mIWZVRh0Jm4/j1pF+uFjiEhh/vaY1aZ39M3ER9gtOpLiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DM3PPF777B3455C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 09:22:03 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 09:22:02 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>
Subject: Re: [PATCH i-g-t v9 10/10] tests/intel/xe_multi-gpusvm: Add SVM
 multi-GPU migration test
Thread-Topic: [PATCH i-g-t v9 10/10] tests/intel/xe_multi-gpusvm: Add SVM
 multi-GPU migration test
Thread-Index: AQHcYqEwFFWDg3W13kObrfrEgeQyuLUOFPaA
Date: Tue, 2 Dec 2025 09:22:02 +0000
Message-ID: <8c146e91276542829baecfbf267baffe823445f1.camel@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251201090201.326595-1-nishit.sharma@intel.com>
 <20251201090201.326595-11-nishit.sharma@intel.com>
In-Reply-To: <20251201090201.326595-11-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DM3PPF777B3455C:EE_
x-ms-office365-filtering-correlation-id: f0280c33-51fa-455b-4423-08de31844104
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TWNsTGFIbUg2RDRrTFZpVVh6aTZUYkY0ZGNPZkRRMUMrREtLOGpXZy9sYzQ2?=
 =?utf-8?B?Mm9jN1FFTFJmSkxQVVlzTU9MYThubkV0S0tUQUY1b3p5cVhkd0pGSUR4KzNI?=
 =?utf-8?B?eFlhM0tNV0tIS0FHNm82eURFbDhUL2NzazhWbUdadlkzTUdTc1R2OUlubFZI?=
 =?utf-8?B?WW5NVHlSa01rYUJtQ0E2RVBkS0VUQm5wRU90OFA2VERkUnlocVkrM1FDQ0cr?=
 =?utf-8?B?Ly9weVhhVS9OdVk3ZVU3TnRlSUw2M3hYT1VBTnZlZ2s4ZktLVWpXUXJRNHJT?=
 =?utf-8?B?cHRpM2p6MmR6dkxWTHkwS2tuY0wvQnBDbnZnUmVKSFZRK0g1b1VQcm9EYlZ2?=
 =?utf-8?B?dnI5S3NYOTVnRnEzTkJxeERQQWYxZkZDYmo3R1lYSXZqTXRWZVorajgvcmY4?=
 =?utf-8?B?SjAxMEx6QSt2T3dsMFZlcGNoalh1Y0ErdFdhZUo0YWVuRUtRMmpZaDdXNFI5?=
 =?utf-8?B?TlF4SGJBclZjN1pGV3llMGc2TGpxNkNzaVlZRGs3MzFkUC9yUTFqeE5UL05p?=
 =?utf-8?B?YWpSU2prVjhyZzNaSXVNUHphT1F3UjFFWFFIaTlQanVJL0hnOGNBbDY2S2RF?=
 =?utf-8?B?UFI0VU1lK1NRWUVVc091eUl0Z2FpSnJKekpXekg0bDdyQlI2QkNYd2pyVFpi?=
 =?utf-8?B?REhWTmxXWTRvQ3VaeExkRnZSTVhpVlpsd0hFd3poWHI2dVFrVFRxZUVkYVhG?=
 =?utf-8?B?SmplUVZ5YWRmTjU0Yi9jd21uM0ZhVEQ0R3JhVTh0dVpXa3UrMmNZdzl0TjBS?=
 =?utf-8?B?M3lpSlJLaFEzU1hjYVhzMzRacFVEMHNhUVFyUVByVjlCWlFuVTZCUGtZV05Y?=
 =?utf-8?B?UURodEtER2NGNVQxUGY4TEtZVkpRam8vajNWZldaTU1NbGdCUTI1RTYzbFhW?=
 =?utf-8?B?U3JCZ1l6d2dUcU9BWG9LcmZoRmh6eHY4dkppTXNUSSt5dytIWXJFUXJwc1Bt?=
 =?utf-8?B?cy9qaVdTRWU5YWtmWFYvYlpqUVFuSmhodEFPeGx5Nzh3SGxtRGx1ZXNJdTU0?=
 =?utf-8?B?SDFvbmYxTk1lK2VWdUdHZjVwSkh3RHY3SmF1Y0oveFJ1OXdOMVgwTlJhWkYx?=
 =?utf-8?B?a25lRnE3dTFvc1MzbUZmOXQ3R3RQUjR3SUFCT0t0clFjSDhiMW1PZlZJVHpa?=
 =?utf-8?B?Mmt3YU13OXB1cGJVSnJsMHZOaG5VeUc5ZVhuZ3oxSmtBZHBGNk5zS0ptbVd1?=
 =?utf-8?B?M0lKQ2VxbWhHUlJqRDVLVXUzS1BJYWpkK0ZJZjh4UG5mSkNyczcrZ29JWnFo?=
 =?utf-8?B?QkxVUWVTVUlTWTdrMnA3N0hDS2srTG11NElSU1dEQUNNdzZlVUtHUjJwNEtp?=
 =?utf-8?B?V3JuTVZGMmdJajhEWkczRkxrOEdWc1lJZGd5OGRyR1RZMGR2YmV3RWQ3N0Vn?=
 =?utf-8?B?SGhzUnR6czdiZWxsTjJYdkZpOGJiNTZuOWpqU2lTU2VCMW1NNUNiUkZlcmF0?=
 =?utf-8?B?OXpLTVJTRU1OQ0lYYXpMRkRsU2gwQjR6dklHSEdCV04xWXlSSjJrOW5pQjZ4?=
 =?utf-8?B?T2c5TnBEL29TTVpKamVSdlVhUjZKaitKMlo1cjNvc2NHVnZRb29qcERaUmZU?=
 =?utf-8?B?b2w4elYydFI5YWM3dS94b2xuVTJOSm1aSU82ZlZOYzFJS1RRZU5EaTNiVnhI?=
 =?utf-8?B?K0Rzb2pRZDBjWXBBRUpmTHZEblVWL1lra2R2enhkNzNsc2RXS0w2aGxTd1lK?=
 =?utf-8?B?L1VtdnRlby91andnalMxNnZGbitHaWg0WDNESlpSQlRRVHBqYThRbXFFNUNO?=
 =?utf-8?B?RE5tc1RIR3c0MlJlUlBFL0xkMWk4QnNEZ1FIdGpjNktZczVNUHNYR2syOEpW?=
 =?utf-8?B?M2JmWE5FbjFseVVINHZwdVRSMC8xemhOTmQycWRTdHRrTks0Qmx0SmplZngy?=
 =?utf-8?B?bUhoN2VBdUVSZ3NpcnZwL1R4WEpPVld1eS9IcmVoZEFld3hqYWRXM0h5QWdU?=
 =?utf-8?B?cHBhaGxSQ0dsbWZsMjZJR3NYamwxOTZoS1hhMGpBMGh6bnpDd1dCMktGb0ds?=
 =?utf-8?B?YWtiS0J6akYyY24vbG1BR053YXBmcXZhS29pTlJPcFNoQU5sQzU3cjMySGxF?=
 =?utf-8?Q?eHtOKj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?am0wbndtczY3RnBLRWtkaGMxYkFnWHoyb0xaSklwM2ZEYVE0UEV5N1MwdUhm?=
 =?utf-8?B?T1VBckZldVhaNXhiSG9zcWVaUkFOYno1M05PV09pQmVEQUhYYm41V1ZSMFlL?=
 =?utf-8?B?QUpVcnFKWHdoMVMwRjhpZUlGMGpsNnQwelNSSnpYazFQMTNHSzJ5SGJ5TFBB?=
 =?utf-8?B?M210SHcyMlh4dHRYTTNZNk5VM3YyMkkxNTBLdFBtcFFXTVpvL0YzQkdrZ3FK?=
 =?utf-8?B?SStQZ1dPZ2J1TXQ1cWpNZGZCSW1CUlM0ZGpCK01VN1FpUVhzWnpsRGFJalpD?=
 =?utf-8?B?MFZBM042Qzk3WnFRblBGdlBKSDZQemNQMEx1UDJtdS9JUUZzeGZTQnlvclZW?=
 =?utf-8?B?eE5BMHdqVmtxZ2NDcmRQZmJOV1RFUG1scjh2c1diWTg3VXJWckhuRjd5SFA2?=
 =?utf-8?B?U2ZsL0NYcStJZWY1S1RtbzdOY05WeWR3alNhUFc1RnZMZFFmdWp6Y3dpczhs?=
 =?utf-8?B?SzhFcGM5eUVNVVJFR3BBa1owNzI5UWNOS2RlRWxmQ2EvS2liWTJqeTlHSnRw?=
 =?utf-8?B?ZDFBcEtnTEcweDYxUFVQN24xMkxQTmY1MXJ3bVNobHlNNXhaN2UwSU1nZC9r?=
 =?utf-8?B?NnA4S3BRbnhPejBBMFJNVVJ5RDI0M2FIU3BJMGF2OWswMEo4VW4yQ2I1SVRt?=
 =?utf-8?B?Qm5YekVQUkljYUJZNWtrYzg1bHdNRTBXWDNRRDFobHJuVFhDSUVrUTVuc0VI?=
 =?utf-8?B?bU5aNmZ1Q3dyaUZyZkpmZWZ1RHR0ZTJXVmRLY0J5Y0VOMisyR0NzTURreDY2?=
 =?utf-8?B?RVBQVzhQenZRUmROU1lYR1NycGl0SktFQUlnYjFVSHhFWHp0R2J4KzRCcklm?=
 =?utf-8?B?azM1ZDh3TEVib2VHUkpIbHdrMVB2aE15aVdrK1hzOE5wVTZ4a0NaekJvYWE2?=
 =?utf-8?B?UW1CYzRLVVJJbVRSL01QVHhWTmZwdW5yb1VQV3NlanErbEFET3JHb25OK000?=
 =?utf-8?B?UGVpUjA0bWlmNUEyUE10a2N3YWV6TlRPelNDUXFKaWJGUDlZdUZya25ZVk0z?=
 =?utf-8?B?czBpd1lIWlJRWEZSeFMxMHF2MjdxVVVWdVR5ZytWdHhvdHFZOXFtYnFlcXE3?=
 =?utf-8?B?T0dKRGxJcEZjTmlNVXFXeXN1dlpYZms2K2hoeTJaK1h2MGhLcHpNU3MxZFZt?=
 =?utf-8?B?RFlpOU5iUW9lVWhXWmNRd0tKUVNFOTM5K3ZBUGhCZVI2ckM3TFJkUjhPeG0w?=
 =?utf-8?B?WSt2dW1iT05XT2FKdFd4SkFwclpUOExqYnpSVHRva1IvaFo1SEp6dmdXM0xK?=
 =?utf-8?B?YXMzNklNLzlwL1hVdWp2dzJOcm9SWHlHdHR1NUlxcjRNREtqdTM1OVlBMDFv?=
 =?utf-8?B?UTl6RzNocktUeXkzNkFaeWdVN2p4SlVzVnhDMkZzaFRpZldyOXJieS9aeEhP?=
 =?utf-8?B?RW5uWjVNUzl4VklyVHkrTFhRb0JFQlFDM2IraUtTME9pY3F3V09IUm83SFp1?=
 =?utf-8?B?b0xHMFllVzFid245eTRIWnNZTi8xY2drWG9YaFlkamVRTUxCa0ZpWnRnL2tk?=
 =?utf-8?B?SmxtZENvOHROQzJWZ0JlYVZhTzh6Q0x2NFZTUEp1dU9DNzE2QWlBcnBVOG1k?=
 =?utf-8?B?U1pwWnJWZ0l1RVdxc2VwRWo2NTM5V2tWMmxqZk1qc0NkMnczdXVpN01YeERX?=
 =?utf-8?B?SlhZT0dTM0c0blg1bmJNd0d2akFtTnZmeEFWc3VvOWdiL21uOHY0cWVBWld0?=
 =?utf-8?B?ZlJmK3A4UGJwTnpXWHhqUlk3aDRjeGgxUGh3cmV0b3ArODN1WlljcjVnU2Ix?=
 =?utf-8?B?SUhrZ2xTbnlXd20zVllJM09ESVJFV1c3SEJRbi9ScXorMHFxN0RZK1NFL05P?=
 =?utf-8?B?QVNacXRWSVRLcTNldTJQMlNyUmFneFljMEs2Q1psSFh2Q2tZNlczVUgvSk5C?=
 =?utf-8?B?WlR3Znk4YnNTWjFYRmN3UUtlOS9VM3g1eGo3NmtlRDNTMGpNNzRFbHBXc3RT?=
 =?utf-8?B?Um0za2UwUG9oWWwvRW5ZR2pkU2ZSZWx1RS9Nek5kMjFZbGR6bzBDMUdrc3BS?=
 =?utf-8?B?Rjk5cG85MW5FSko4cDRWVlQ2VVdiVDBGdmlHeXFkcmxEQVRoUUpvczE5QXF2?=
 =?utf-8?B?VjEvWEFlOXlOdWpYSGI0SEpiNjRuY3NYUEF6a3UzUU9Kejd6MHYyQ293MXJ4?=
 =?utf-8?B?TDF2cFdTTnpRbncxS3NwNjRZbGFNYnNHUjBOT3d0R3RHcFp5RzJ2NlRTakZR?=
 =?utf-8?Q?4YuxBnVdz3NjpmglZHObWfu+ZIKQWoO5lRfhjTM0K6QF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C707292D87BEBC43ABD40434399EC03F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0280c33-51fa-455b-4423-08de31844104
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 09:22:02.9351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lWMBHKEaCyVvD441aXA3Ina7yMllzY81y8fJzUgQl4t/S4ZWpCVjun6zfFKxrkwxTx1VTlnl6Cjaru4+BVCk6hsDT/BBO0zxKRgAuyBSBVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF777B3455C
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

DQpOaXQ6IFRoZSBwYXRjaCBzdWJqZWN0IGxpbmUgc2F5cyB4ZV9tdWx0aS1ncHVzdm0gaW5zdGVh
ZCBvZg0KeGVfbXVsdGlfZ3B1c3ZtLg0KDQovVGhvbWFzDQoNCg0KT24gTW9uLCAyMDI1LTEyLTAx
IGF0IDA5OjAyICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNvbSB3cm90ZToNCj4gRnJvbTog
TmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+DQo+IA0KPiBUaGlzIHRlc3Qg
YWxsb2NhdGVzIGEgYnVmZmVyIGluIFNWTSwgYWNjZXNzZXMgaXQgZnJvbSBHUFUgMSwgdGhlbiBH
UFUNCj4gMg0KPiBhbmQgdGhlbiB0aGUgQ1BVLiBJdCB2ZXJpZmllcyB0aGF0IHRoZSBidWZmZXIg
bWlncmF0ZXMgY29ycmVjdGx5DQo+IGJldHdlZW4NCj4gZGV2aWNlcyBhbmQgcmVtYWlucyBhY2Nl
c3NpYmxlIGFjcm9zcyBhbGwgYWdlbnRzIGluIGENCj4gbXVsdGktR1BVIGVudmlyb25tZW50Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5j
b20+DQo+IC0tLQ0KPiDCoHRlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jIHwgMTIyDQo+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTIy
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9tdWx0aV9n
cHVzdm0uYw0KPiBiL3Rlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jDQo+IGluZGV4IDY4OGVl
MDc1Ny4uZDdkNmFiMTE2IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVz
dm0uYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYw0KPiBAQCAtMTI3LDYg
KzEyNywxOCBAQA0KPiDCoCAqIERlc2NyaXB0aW9uOg0KPiDCoCAqCU11bHRpLUdQVSBwYWdlIGZh
dWx0IHRlc3Qgd2l0aCBjb25mbGljdGluZyBtYWR2aXNlIHJlZ2lvbnMNCj4gwqAgKg0KPiArICog
U1VCVEVTVDogbWdwdS1taWdyYXRpb24tYmFzaWMNCj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICoJ
VGVzdCBidWZmZXIgbWlncmF0aW9uIGFjcm9zcyBtdWx0aXBsZSBHUFVzIGFuZCBtZW1vcnkNCj4g
ZG9tYWlucw0KPiArICoJVmFsaWRhdGVzIHRoYXQgYSBzaGFyZWQgYnVmZmVyIGNhbiBtaWdyYXRl
IGJldHdlZW4gc3lzdGVtDQo+IG1lbW9yeSwNCj4gKyAqCUdQVTEgVlJBTSwgYW5kIEdQVTIgVlJB
TSB3aGlsZSBtYWludGFpbmluZyBkYXRhIGNvaGVyZW5jeS4NCj4gKyAqDQo+ICsgKiBTVUJURVNU
OiBtZ3B1LW1pZ3JhdGlvbi1wcmVmZXRjaA0KPiArICogRGVzY3JpcHRpb246DQo+ICsgKglUZXN0
IGJ1ZmZlciBtaWdyYXRpb24gYWNyb3NzIG11bHRpcGxlIEdQVXMgd2l0aCBleHBsaWNpdA0KPiBw
cmVmZXRjaCBvcGVyYXRpb25zDQo+ICsgKglTaW1pbGFyIHRvIG1ncHUtbWlncmF0aW9uLWJhc2lj
IGJ1dCB1c2VzDQo+IFhFX1ZNX1BSRUZFVENIX0FTWU5DIHRvIGV4cGxpY2l0bHkNCj4gKyAqCXRy
aWdnZXIgcGFnZSBtaWdyYXRpb24gYmVmb3JlIEdQVSBhY2Nlc3MNCj4gKyAqDQo+IMKgICovDQo+
IMKgDQo+IMKgI2RlZmluZSBNQVhfWEVfUkVHSU9OUwk4DQo+IEBAIC0xNTMsNiArMTY1LDcgQEAN
Cj4gwqAjZGVmaW5lIE1VTFRJR1BVX1BGQVVMVF9PUAkJQklUKDgpDQo+IMKgI2RlZmluZSBNVUxU
SUdQVV9DT05DX0FDQ0VTUwkJQklUKDkpDQo+IMKgI2RlZmluZSBNVUxUSUdQVV9DT05GTElDVAkJ
QklUKDEwKQ0KPiArI2RlZmluZSBNVUxUSUdQVV9NSUdSQVRFCQlCSVQoMTEpDQo+IMKgDQo+IMKg
I2RlZmluZSBJTklUCTINCj4gwqAjZGVmaW5lIFNUT1JFCTMNCj4gQEAgLTIyMCw2ICsyMzMsMTAg
QEAgc3RhdGljIHZvaWQgZ3B1X3NpbXVsdF90ZXN0X3dyYXBwZXIoc3RydWN0DQo+IHhlX3N2bV9n
cHVfaW5mbyAqc3JjLA0KPiDCoAkJCQnCoMKgwqAgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xh
c3NfaW5zdGFuY2UgKmVjaSwNCj4gwqAJCQkJwqDCoMKgIHVuc2lnbmVkIGludCBmbGFncyk7DQo+
IMKgDQo+ICtzdGF0aWMgdm9pZCBncHVfbWlncmF0aW9uX3Rlc3Rfd3JhcHBlcihzdHJ1Y3QgeGVf
c3ZtX2dwdV9pbmZvICpzcmMsDQo+ICsJCQkJwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZV9zdm1fZ3B1
X2luZm8gKmRzdCwNCj4gKwkJCQnCoMKgwqDCoMKgwqAgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVf
Y2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gKwkJCQnCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGZs
YWdzKTsNCj4gwqBzdGF0aWMgdm9pZA0KPiDCoGNvbmZsaWN0aW5nX21hZHZpc2Uoc3RydWN0IHhl
X3N2bV9ncHVfaW5mbyAqZ3B1MSwNCj4gwqAJCcKgwqDCoCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZv
ICpncHUyLA0KPiBAQCAtMTM3NCw2ICsxMzkxLDk1IEBAIGNvbmZsaWN0aW5nX21hZHZpc2Uoc3Ry
dWN0IHhlX3N2bV9ncHVfaW5mbw0KPiAqZ3B1MSwNCj4gwqAJY2xlYW51cF92bV9hbmRfcXVldWUo
Z3B1Miwgdm1bMV0sIGV4ZWNfcXVldWVbMV0pOw0KPiDCoH0NCj4gwqANCj4gK3N0YXRpYyB2b2lk
DQo+ICttdWx0aWdwdV9taWdyYXRlX3Rlc3Qoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MSwN
Cj4gKwkJwqDCoMKgwqDCoCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpncHUyLA0KPiArCQnCoMKg
wqDCoMKgIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+ICsJCcKg
wqDCoMKgwqAgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiArew0KPiArCXVpbnQ2NF90IGFkZHI7DQo+
ICsJdWludDMyX3Qgdm1bMl0sIGV4ZWNfcXVldWVbMl0sIGJhdGNoMV9ib1syXTsNCj4gKwl1aW50
NjRfdCBiYXRjaDFfYWRkclsyXTsNCj4gKwl1aW50NjRfdCAqZGF0YTsNCj4gKwl1aW50MzJfdCB0
ZXN0X3BhdHRlcm5fc3lzLCB0ZXN0X3BhdHRlcm5fZ3B1MSwNCj4gdGVzdF9wYXR0ZXJuX2dwdTI7
DQo+ICsJdm9pZCAqY29weV9kc3Q7DQo+ICsJdWludDMyX3QgZmluYWxfdmFsdWU7DQo+ICsNCj4g
Kwl0ZXN0X3BhdHRlcm5fc3lzID0gMHgxMjM0NTY3ODsNCj4gKwl0ZXN0X3BhdHRlcm5fZ3B1MSA9
IDB4REVBREJFRUY7DQo+ICsJdGVzdF9wYXR0ZXJuX2dwdTIgPSAweENBRkVCQUJFOw0KPiArDQo+
ICsJLyogU2tpcCBpZiBlaXRoZXIgR1BVIGRvZXNuJ3Qgc3VwcG9ydCBmYXVsdHMgKi8NCj4gKwlp
ZiAoIWdwdTEtPnN1cHBvcnRzX2ZhdWx0cyB8fCAhZ3B1Mi0+c3VwcG9ydHNfZmF1bHRzKSB7DQo+
ICsJCWlndF9kZWJ1ZygiQm90aCBHUFVzIG11c3Qgc3VwcG9ydCBwYWdlIGZhdWx0cyBmb3INCj4g
dGhpcyB0ZXN0XG4iKTsNCj4gKwkJcmV0dXJuOw0KPiArCX0NCj4gKw0KPiArCWNyZWF0ZV92bV9h
bmRfcXVldWUoZ3B1MSwgZWNpLCAmdm1bMF0sICZleGVjX3F1ZXVlWzBdKTsNCj4gKwljcmVhdGVf
dm1fYW5kX3F1ZXVlKGdwdTIsIGVjaSwgJnZtWzFdLCAmZXhlY19xdWV1ZVsxXSk7DQo+ICsNCj4g
KwlkYXRhID0gYWxpZ25lZF9hbGxvYyhTWl8yTSwgU1pfNEspOw0KPiArCWlndF9hc3NlcnQoZGF0
YSk7DQo+ICsJbWVtc2V0KGRhdGEsIDAsIFNaXzRLKTsNCj4gKwlhZGRyID0gdG9fdXNlcl9wb2lu
dGVyKGRhdGEpOw0KPiArDQo+ICsJY29weV9kc3QgPSBhbGlnbmVkX2FsbG9jKFNaXzJNLCBTWl80
Syk7DQo+ICsJaWd0X2Fzc2VydChjb3B5X2RzdCk7DQo+ICsNCj4gKwlpZ3RfaW5mbygiPT09IFBo
YXNlIDE6IFN5c3RlbSBNZW1vcnkg4oaSIEdQVTEgVlJBTSA9PT1cbiIpOw0KPiArDQo+ICsJLyog
Q1BVIHdyaXRlcyBpbml0aWFsIHBhdHRlcm4gaW4gc3lzdGVtIG1lbW9yeSAqLw0KPiArCVdSSVRF
X09OQ0UoKih1aW50MzJfdCAqKWRhdGEsIHRlc3RfcGF0dGVybl9zeXMpOw0KPiArCWlndF9pbmZv
KCJDUFUgd3JvdGUgMHgleCB0byBzeXN0ZW0gbWVtb3J5XG4iLA0KPiB0ZXN0X3BhdHRlcm5fc3lz
KTsNCj4gKw0KPiArCS8qIEdQVTEgd3JpdGVzIG5ldyBwYXR0ZXJuIC0gc2hvdWxkIGhhcHBlbiBp
biBHUFUxIFZSQU0gKi8NCj4gKwlzdG9yZV9kd29yZF9iYXRjaF9pbml0KGdwdTEtPmZkLCB2bVsw
XSwgYWRkciwgJmJhdGNoMV9ib1swXSwNCj4gJmJhdGNoMV9hZGRyWzBdLA0KPiArCQkJwqDCoMKg
wqDCoMKgIHRlc3RfcGF0dGVybl9ncHUxKTsNCj4gKw0KPiArCS8qR1BVMTogTWFkdmlzZSBhbmQg
UHJlZmV0Y2ggT3BzIHdpdGggcHJlZmVycmVkIGxvY2F0aW9uDQo+IEdQVTEgVlJBTSAqLw0KPiAr
CWdwdV9tYWR2aXNlX3N5bmMoZ3B1MSwgdm1bMF0sIGV4ZWNfcXVldWVbMF0sIGFkZHIsDQo+ICZi
YXRjaDFfYWRkclswXSwgZmxhZ3MpOw0KPiArDQo+ICsJaWd0X2luZm8oIj09PSBQaGFzZSAyOiBH
UFUxIFZSQU0g4oaSIEdQVTIgVlJBTSA9PT1cbiIpOw0KPiArDQo+ICsJLyogR1BVMjogY29weSBH
UFUxJ3MgdmFsdWUgKi8NCj4gKwlncHVfYmF0Y2hfY3JlYXRlKGdwdTIsIHZtWzFdLCBleGVjX3F1
ZXVlWzFdLCBhZGRyLA0KPiB0b191c2VyX3BvaW50ZXIoY29weV9kc3QpLA0KPiArCQkJICZiYXRj
aDFfYm9bMV0sICZiYXRjaDFfYWRkclsxXSwgZmxhZ3MsDQo+IElOSVQpOw0KPiArDQo+ICsJLypH
UFUyOiBNYWR2aXNlIGFuZCBQcmVmZXRjaCBPcHMgd2l0aCBwcmVmZXJyZWQgbG9jYXRpb24NCj4g
R1BVMiBWUkFNICovDQo+ICsJZ3B1X21hZHZpc2Vfc3luYyhncHUyLCB2bVsxXSwgZXhlY19xdWV1
ZVsxXSwNCj4gdG9fdXNlcl9wb2ludGVyKGNvcHlfZHN0KSwNCj4gKwkJCSAmYmF0Y2gxX2FkZHJb
MV0sIGZsYWdzKTsNCj4gKw0KPiArCS8qIFZlcmlmeSBHUFUxIHdyb3RlIGNvcnJlY3RseSAqLw0K
PiArCWZpbmFsX3ZhbHVlID0gKih1aW50MzJfdCAqKWNvcHlfZHN0Ow0KPiArCS8vaWd0X2Fzc2Vy
dF9lcV91MzIoUkVBRF9PTkNFKCoodWludDMyX3QgKiljb3B5X2RzdCksDQo+IHRlc3RfcGF0dGVy
bl9ncHUxKTsNCj4gKwlpZ3RfYXNzZXJ0X2VxX3UzMihmaW5hbF92YWx1ZSwgdGVzdF9wYXR0ZXJu
X2dwdTEpOw0KPiArDQo+ICsJaWd0X2luZm8oIj09PSBQaGFzZSAzOiBHUFUyIFZSQU0g4oaSIFN5
c3RlbSBNZW1vcnkgPT09XG4iKTsNCj4gKw0KPiArCS8qIEdQVTEgd3JpdGVzIG5ldyBwYXR0ZXJu
IC0gc2hvdWxkIGhhcHBlbiBpbiBHUFUxIFZSQU0gKi8NCj4gKwlzdG9yZV9kd29yZF9iYXRjaF9p
bml0KGdwdTItPmZkLCB2bVsxXSwNCj4gdG9fdXNlcl9wb2ludGVyKGNvcHlfZHN0KSwNCj4gKwkJ
CcKgwqDCoMKgwqDCoCAmYmF0Y2gxX2JvWzFdLCAmYmF0Y2gxX2FkZHJbMV0sDQo+IHRlc3RfcGF0
dGVybl9ncHUyKTsNCj4gKw0KPiArCS8qR1BVMjogTWFkdmlzZSBhbmQgUHJlZmV0Y2ggT3BzIHdp
dGggcHJlZmVycmVkIGxvY2F0aW9uDQo+IEdQVTIgVlJBTSAqLw0KPiArCWdwdV9tYWR2aXNlX3N5
bmMoZ3B1Miwgdm1bMV0sIGV4ZWNfcXVldWVbMV0sDQo+IHRvX3VzZXJfcG9pbnRlcihjb3B5X2Rz
dCksDQo+ICsJCQkgJmJhdGNoMV9hZGRyWzFdLCBmbGFncyk7DQo+ICsNCj4gKwkvKiBDUFUgYWNj
ZXNzIHNob3VsZCBtaWdyYXRlIGJhY2sgdG8gc3lzdGVtIG1lbW9yeSAqLw0KPiArCWlndF9hc3Nl
cnRfZXFfdTMyKFJFQURfT05DRSgqKHVpbnQzMl90ICopY29weV9kc3QpLA0KPiB0ZXN0X3BhdHRl
cm5fZ3B1Mik7DQo+ICsNCj4gKwlpZ3RfaW5mbygiTWlncmF0aW9uIHRlc3QgY29tcGxldGVkIHN1
Y2Nlc3NmdWxseVxuIik7DQo+ICsNCj4gKwltdW5tYXAoKHZvaWQgKiliYXRjaDFfYWRkclswXSwg
QkFUQ0hfU0laRShncHUxLT5mZCkpOw0KPiArCW11bm1hcCgodm9pZCAqKWJhdGNoMV9hZGRyWzFd
LCBCQVRDSF9TSVpFKGdwdTItPmZkKSk7DQo+ICsJYmF0Y2hfZmluaShncHUxLT5mZCwgdm1bMF0s
IGJhdGNoMV9ib1swXSwgYmF0Y2gxX2FkZHJbMF0pOw0KPiArCWJhdGNoX2ZpbmkoZ3B1Mi0+ZmQs
IHZtWzFdLCBiYXRjaDFfYm9bMV0sIGJhdGNoMV9hZGRyWzFdKTsNCj4gKwlmcmVlKGRhdGEpOw0K
PiArCWZyZWUoY29weV9kc3QpOw0KPiArDQo+ICsJY2xlYW51cF92bV9hbmRfcXVldWUoZ3B1MSwg
dm1bMF0sIGV4ZWNfcXVldWVbMF0pOw0KPiArCWNsZWFudXBfdm1fYW5kX3F1ZXVlKGdwdTIsIHZt
WzFdLCBleGVjX3F1ZXVlWzFdKTsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyB2b2lkDQo+IMKgZ3B1
X21lbV9hY2Nlc3Nfd3JhcHBlcihzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpzcmMsDQo+IMKgCQnC
oMKgwqDCoMKgwqAgc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZHN0LA0KPiBAQCAtMTQ0Niw2ICsx
NTUyLDE4IEBAIGdwdV9zaW11bHRfdGVzdF93cmFwcGVyKHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8N
Cj4gKnNyYywNCj4gwqAJbXVsdGlncHVfYWNjZXNzX3Rlc3Qoc3JjLCBkc3QsIGVjaSwgZmxhZ3Mp
Ow0KPiDCoH0NCj4gwqANCj4gK3N0YXRpYyB2b2lkDQo+ICtncHVfbWlncmF0aW9uX3Rlc3Rfd3Jh
cHBlcihzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpzcmMsDQo+ICsJCQnCoMKgIHN0cnVjdCB4ZV9z
dm1fZ3B1X2luZm8gKmRzdCwNCj4gKwkJCcKgwqAgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3Nf
aW5zdGFuY2UgKmVjaSwNCj4gKwkJCcKgwqAgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiArew0KPiAr
CWlndF9hc3NlcnQoc3JjKTsNCj4gKwlpZ3RfYXNzZXJ0KGRzdCk7DQo+ICsNCj4gKwltdWx0aWdw
dV9taWdyYXRlX3Rlc3Qoc3JjLCBkc3QsIGVjaSwgZmxhZ3MpOw0KPiArfQ0KPiArDQo+IMKgc3Rh
dGljIHZvaWQNCj4gwqB0ZXN0X21ncHVfZXhlYyhpbnQgZ3B1X2NudCwgc3RydWN0IHhlX3N2bV9n
cHVfaW5mbyAqZ3B1cywNCj4gwqAJwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1feGVfZW5naW5lX2Ns
YXNzX2luc3RhbmNlICplY2ksDQo+IEBAIC0xNDYzLDYgKzE1ODEsOCBAQCB0ZXN0X21ncHVfZXhl
YyhpbnQgZ3B1X2NudCwgc3RydWN0DQo+IHhlX3N2bV9ncHVfaW5mbyAqZ3B1cywNCj4gwqAJCWZv
cl9lYWNoX2dwdV9wYWlyKGdwdV9jbnQsIGdwdXMsIGVjaSwNCj4gZ3B1X2ZhdWx0X3Rlc3Rfd3Jh
cHBlciwgZmxhZ3MpOw0KPiDCoAlpZiAoZmxhZ3MgJiBNVUxUSUdQVV9DT05DX0FDQ0VTUykNCj4g
wqAJCWZvcl9lYWNoX2dwdV9wYWlyKGdwdV9jbnQsIGdwdXMsIGVjaSwNCj4gZ3B1X3NpbXVsdF90
ZXN0X3dyYXBwZXIsIGZsYWdzKTsNCj4gKwlpZiAoZmxhZ3MgJiBNVUxUSUdQVV9NSUdSQVRFKQ0K
PiArCQlmb3JfZWFjaF9ncHVfcGFpcihncHVfY250LCBncHVzLCBlY2ksDQo+IGdwdV9taWdyYXRp
b25fdGVzdF93cmFwcGVyLCBmbGFncyk7DQo+IMKgfQ0KPiDCoA0KPiDCoHN0cnVjdCBzZWN0aW9u
IHsNCj4gQEAgLTE1MDQsNiArMTYyNCw4IEBAIGlndF9tYWluDQo+IMKgCQl7ICJjb25jdXJyZW50
LWFjY2Vzcy1iYXNpYyIsIE1VTFRJR1BVX0NPTkNfQUNDRVNTIH0sDQo+IMKgCQl7ICJjb25jdXJy
ZW50LWFjY2Vzcy1wcmVmZXRjaCIsIE1VTFRJR1BVX1BSRUZFVENIIHwNCj4gTVVMVElHUFVfQ09O
Q19BQ0NFU1MgfSwNCj4gwqAJCXsgImNvbmN1cnJlbnQtYWNjZXNzLWNvbmZsaWN0IiwgTVVMVElH
UFVfQ09ORkxJQ1QgfA0KPiBNVUxUSUdQVV9DT05DX0FDQ0VTUyB9LA0KPiArCQl7ICJtaWdyYXRp
b24tYmFzaWMiLCBNVUxUSUdQVV9NSUdSQVRFIH0sDQo+ICsJCXsgIm1pZ3JhdGlvbi1wcmVmZXRj
aCIsIE1VTFRJR1BVX1BSRUZFVENIIHwNCj4gTVVMVElHUFVfTUlHUkFURSB9LA0KPiDCoAkJeyBO
VUxMIH0sDQo+IMKgCX07DQo+IMKgDQoNCg==
