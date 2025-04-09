Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5BFC36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 16:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDB510E1A5;
	Wed,  9 Apr 2025 16:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L95Q0tUH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719B810E1A5
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 16:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744216600; x=1775752600;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tBmZMITqf8LjvHX5D/GV/xVKuELgdv0vWP4FfmO2B+o=;
 b=L95Q0tUHEb+Oc1UfT2E4GduXMFZBZrQBEQ0tgtwTusAi3ZwEZdW8BNeD
 01xozTje6koKnji4KF4BleEzAJCaUA9U4+F14rwcult2ex6j9ydvWqg8a
 pYwqXL1Jwgdk+54VlE4GJuHDKvos6d66Wf0wHFXSOZKVBwUpdSkMRD6TX
 Nz2ibr2u7isD7jbCMq5K6bh7fzPtWvUj5T5MwczfF7qKLquCxQH5hfO4T
 zpn/3dyqx1sYicT2dqqIkQpAk5+k+64FlfP/5D45f67bPWRQPXR4S/4p4
 4xrd8cZ+t0UCKLWvAEIcPwHhGjEXPU7n9eocK7OqOdpTFBpv9Uy/7EWhB g==;
X-CSE-ConnectionGUID: UUFxyguIQTeKl7hlQnMh2A==
X-CSE-MsgGUID: 86syvesOREODJTT1BJKRIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45794691"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="45794691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 09:36:39 -0700
X-CSE-ConnectionGUID: rMkr8Yr5QQaAoXXTFeyS8w==
X-CSE-MsgGUID: uZS09WV7QmKFAjz8/aRacg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="129191102"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 09:36:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 09:36:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 09:36:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 09:36:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwK2jPKP1SbgTsMxeccbRyzyAmbnpDNwYHXX//t8zCwQFp7vzT08uIav6iXLAqotry/+AzFKbZnVBQe61SvgBENbrGRY7KYJt5aylg8+4zVv8ZebmSuwxGQ4MjC1nRS/4a0HHLL0BALCXG4pX9xF2oHCkqy1zbtel3yJsbdgHCIrfrO/EtnNmQFpqG1FVQQJal3vFCvWUz6qxSyeA2VJduKNpfJ8MpQOeN6vjGyLl0dKkffjjZP3MtmHEAzjx5XdX/vyrSIqRt/4dL2Tf+JOqyuqSsMB2vW+/rw4C7+McSFBKLXhUrwq8qD6gzuQgu7jV6FUzJYXuQtb5TS0joFqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMherRg/G7wAzQvNT7nJRWwOO4qnrt6vgXujbmLqfy8=;
 b=p+zwK2nbXHex3SvMUe0wemrtCRNUFGn8G9XZWke0XGNjHSQrwiQJp9xxzoT+KXZO+QJY5aQpVwXEGtC9mdumL6UD1tBfcchZm4lXoqZM1BPxTWnZqwjq1zIypJa0FIguTyKxgYYGmXRTBzMIhLWXsuhbf/vvtnvGt4Af1FFj7bK9L5qVlYcoJGWf0E5xYJkywVH4+dEpnxBJxIMi59pw7urBsxXabDTn2d3MID2mfa4eARnufl7WEIrL6QLUOvt1E5FkxZnnPaLwe/bKvW11V+f8X3EGQ8qqXcHb1Tx8oKsJuNjdRtnGpuuyPJVIrn2DVNM2Eu5HJb6LNgTgH1wF9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CH3PR11MB8704.namprd11.prod.outlook.com (2603:10b6:610:1c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 16:36:08 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 16:36:08 +0000
Date: Wed, 9 Apr 2025 16:36:02 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v6 1/5] lib/igt_device_scan: Add support for the
 device filter
Message-ID: <663fr4dgx7qgpffmgax7utqghxby3ocssgdg6dq6v72lp3lqt3@oh77x6dkwbk4>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250404132421.1920451-1-soham.purkait@intel.com>
 <20250404132421.1920451-2-soham.purkait@intel.com>
 <c7etefnkdppkdkklkwmtyvviiibtw4mo3a5726fpxkd47mb4vg@k7b5urxbuqfh>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <c7etefnkdppkdkklkwmtyvviiibtw4mo3a5726fpxkd47mb4vg@k7b5urxbuqfh>
X-ClientProxiedBy: VI1P190CA0037.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::12) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CH3PR11MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da808eb-ff65-4fe2-cbba-08dd7784a173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTlmaXBBMDF4WjVQM2lTTUJRMVVnWmMrV3I2SHlZc1NtRTRvWFlqV1YrRXJ1?=
 =?utf-8?B?eE52YzlhdVNzS0tvOTBRNEg2d0FoZ3ZWR1B5Njc4b3B4Vkc1dWtqV2hMZFZI?=
 =?utf-8?B?RUlCc0Y2Zm5YVCtNaENHMWh0ZzFjVCt2eGtYTHhBT3VxK3BySm1NUEVkTU5t?=
 =?utf-8?B?alVDS245UEgxK3NPMktoMEU1SnRJZFp2NVN2VDNFaW1RS1R6bkFITFFHbklp?=
 =?utf-8?B?dGJlWmFNcTJSTUwvcWkyeHcyRS95VE8rMDAvRFlJNjZoY2NXNEV4ZElydG9p?=
 =?utf-8?B?RTV1czRhaWpNYjRxSHM3dzY1MFRSbWZobnB3VENLMWE5bzdIMnVuZUtaV1VP?=
 =?utf-8?B?bklEaUcvNTFPSitobWZrMVRIYXd6YmpEWVU4blhiajZpQ0h3T1l4elFjbzI1?=
 =?utf-8?B?YWN2K295NE5XTy9ncW1ybFl3SHFMNGRoOCtZTWpJSHRGOFdkd0VvdU1NZ0Fv?=
 =?utf-8?B?YXkxYytnZjRmUVRBS21MMjQrTXdka01UcUJlNkFHWndkUzVVRFhvTUJ1dkUv?=
 =?utf-8?B?V2hsNXp2NDUyYW8yVW50cnhXK1ViSkgwNXQyZ0dnVkVleGJwN0JCNVBQalhO?=
 =?utf-8?B?OERTbG9EVUt0ZlhrSEtQdUJ3U2tVSlRQd3FpazRYU0grTVlSSmRjOFlaaHpm?=
 =?utf-8?B?cURGdzJqRytnRk1YOENNMnlYWkx0L2lmVW15MWRzZkVLSXpyR3VwUXhFSEE5?=
 =?utf-8?B?UlduUmpwN3Y5cWh2QzF4NVQzKzRpaFpjcFZvL1RUUFZqcUUrRzFUb0kybUc1?=
 =?utf-8?B?eFVZYytsSlFTNnlqc21FMlJITTVtckJNQmpUd3JOUGgrei9yQXpaY2NuaW00?=
 =?utf-8?B?d2lydWNrSjNTV2Z2Rm92TkVUWnp4YUh1M3VWbkd0UnRLSDN4TXIzOE1IR1VN?=
 =?utf-8?B?eEplY1V4OTJic3JXZk5ZbUFqcVEySm95SGpTODMxZEVQYzVtcGoxVFdnKzdG?=
 =?utf-8?B?RmlhbGt0QU9YeVQzeXJDbWEzQWhRaGZSb3NtQzN4eHJpQXhYc21vRW5kV09N?=
 =?utf-8?B?eUZyUUIyUlNScjJPWHk4WWd0UEhvNEV6OHdvSHYyK25ya1dQZU5HM1N6bXVl?=
 =?utf-8?B?R3hPdkV2cnJ1bExsdlV0K3l4SlBHUlo4Uzc0MWtDSURMSlVkMDlnKzFVVzBO?=
 =?utf-8?B?a0pWYjYxWC8yeWNOY0I5cFhLYktPMFJ0UnVaRTJzbkt4MmcvTU1uRUFwTkd6?=
 =?utf-8?B?ZW0yNDFVOXhJVGZELzVST2FKQnpsOFFIQk5QY1g1dUxaYWVwMDhYNUNOUnRI?=
 =?utf-8?B?RzVIaVZTUDBUN1ZlSCs1OXZXUzNnejl5R0hsOVlnMW5SMDFPVUlBT05UdTRh?=
 =?utf-8?B?ajZiUkFZQTBzZDBNVkZmdFM2cEtrV0NUZnNId05JZU9XWkZwcTAyRjNLeVd6?=
 =?utf-8?B?S3hwWkRGcDVIanZjb1VVRDI4eDY3MzdCeW9hRWxrWDZ3TUpJUlRqUGVNY1A1?=
 =?utf-8?B?OGZDOTBObU5lOFRWTmNPc1BlVW55SHIyc0RKeUUrQlROU3VWSU11SkZUdWNI?=
 =?utf-8?B?UmNlT0g4Z0c3MzNSWklpeDVCeXZtWUxQcml3OElHTjJQNDhVeEVLNSt2N2wr?=
 =?utf-8?B?aXpYSTNDUDJCM2s5aDFSRDRESHRmNWdlVDlUdjdWQ1ViVmpGSi9Bb0NFcDNP?=
 =?utf-8?B?WXNuaENEVVhlbUYra1VNdVJjZ1dqam9vQjhFanlrWXlZMkNpWDZlMi9PeTM1?=
 =?utf-8?B?RUxIYjRVTXlINERKaFluWktGNUJmc255MXlvcWRYYU9PUkZtTk9VeHhUc0Zr?=
 =?utf-8?B?U1BkUVNnQzAxU1Ira0IzREdRYm4xRDFMS0dDMG8yYm04US9FOTViUEorWG03?=
 =?utf-8?B?WCt3NDBaY3A1TWFZYXVuVlB2WjlhdlhFUTRISHJUeXBYQkZUZGtpRWlvQnpI?=
 =?utf-8?Q?ijsdTyQ17rphg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlBTZ01iczduQkl0cDJXN3RycllhZ2Z6VkI3bFNlZ3hRQno4SVhnMk44L2li?=
 =?utf-8?B?MmJ4R2s5N1JEazduQWdYU1pzV1lWNXBhRHptSjJNemlCR2NBSHVDMzZ3Ni9C?=
 =?utf-8?B?eWFNQ2lZN0JCaGNQaE5jWnd3SUh3RmZtVzl6Q25vTHp4dUROQmlid3cwTzhT?=
 =?utf-8?B?MVk3aGtoK3hDLzQrWDAvUU53TGtMTFdFNVZFSXRwUUxDQytOMitOaGlIRW12?=
 =?utf-8?B?bDBidkR0ODd0cGhpRzdlV0JYV3RTZTA1aGl4YkNHQmxkQVAxTGJmSDlaNkxY?=
 =?utf-8?B?WG1TNm5JQ0UwUFJZMm5BYnowdHcwODlGS2JXODRNQ0hUaE1ocUoxdkoyRHhV?=
 =?utf-8?B?cnFLODBLQ1FNNjAwT082VWcwLzJiWTFRdTVOZ1kzSmcrOWdlRmZEbUJib2sz?=
 =?utf-8?B?MlJrMlFKQ0ZtWFNUNDRlZkdTVC83cFhsUExmb2gxdiszVXA2eHh3VVFCclhR?=
 =?utf-8?B?bDNpcU56dHVnSm9TQ0VadXAyVlgxT3kvRGZ5OEk5c3dlS3Vtbis0QWthUElS?=
 =?utf-8?B?aEE3SkFnbHd6a0RLT2dSUWwza3NnQnB3Y3JLcHZvVHdhU1JvR0dpRmNOTkVj?=
 =?utf-8?B?NEVTR2RDL3FlQTFZclRwTFdwdmUwZjVKYk1aUDZCYUZ4LzBVRzRGeEZZWEUx?=
 =?utf-8?B?cnRzZERIT2xFR01YV2toQUFTTkFQalFDRnVBOHRaUGtmZWpxZFpXSk5WZU02?=
 =?utf-8?B?QWk1NzFLYjhIQ0s2MDdOUkZLcURubEkrQkdzV1FhYWlNRFpXY3hONENSSjlS?=
 =?utf-8?B?THFJSUg1SzhRbWF6MTYxalVESnlCZDRURmgrcGgxSDVva1dBUU50Y3grbFVj?=
 =?utf-8?B?djJqUUE3VWpCYmNMZnJkM25NYmFpUzY4OThhYng5Q1NQQis1aGFLY2h3WWRN?=
 =?utf-8?B?S1VIWmNiMVVQSHlDYmp3WktGaVFFQkVXYWxHT2lpdlF4b3ZrOVdGSUdVRkN2?=
 =?utf-8?B?RkQ3UmdycFgyUjh2U0VkWmFPeGFWdjBFNWhNckxiQVdUdWREQ3QrMzVnZlNE?=
 =?utf-8?B?b0wxVWlnN2trVURGenNNUkxtTFNpa2dodzNud1pWcU9obFp1UDViUGRnSVBD?=
 =?utf-8?B?MmlLUHNsMmdZYzJzNmxEUzdRT3BxTjBZdXlVWnNWTmpMdHFLRHlkRVh1Y0Qr?=
 =?utf-8?B?ZTA3UWZsenc4bVBLbkJrMHV6TzdIT2paT1BNK2RWNlEyS3B1ZW9ZbHRDb2FL?=
 =?utf-8?B?OVJIRmhVdWlTV25RbHhGRTY2MnIvZlRmRlZxOVIrbVdWSUNvSEg2ckk5WFdW?=
 =?utf-8?B?WUg1UnU0YkkycEx3NWN4U0EwY0ZsNTAwaVNyajNab2VYbytzT3doUzB3T3kv?=
 =?utf-8?B?cFZzVjkrcS9xclluRnRRdlJrQ0l0TE93cGVEak1MMnJ2T2lrb0tsekJvTTdI?=
 =?utf-8?B?alpWbUc1M1ZRaHMrMUw3MFpDMkY0U01JVGpYTlhOd3ljMFVWd2FGVUZuVkNx?=
 =?utf-8?B?Z2JDSldzclJGblIrVFVJN1FVaHhLSW53blZqNStWSGRtejFRSGlpUHBHQzFl?=
 =?utf-8?B?cFhjMDVmMjlsYTBDNnJjWkVCdi82MlNCaXhVYWFvWjBXNHFtOFVLREh0bElB?=
 =?utf-8?B?cDlIVGFjdUlQaFFycitOSHRjaEtWNkpDM1FLeE9pN25zV241RENjVzB1eURH?=
 =?utf-8?B?WW1zSDZGR0ZDT2pRb1RzckJDcUJsRmtTL09YOGFyYWVPZ0NGRjlIczJya29p?=
 =?utf-8?B?N1RMZENPMXVzNWR5TlBvOFZ6OEVyOGloSVdZZTdzdng0ZFZ1aitudjZma243?=
 =?utf-8?B?T1JyZ2FhOHNRZ3JZdWhaTDk2U2lxdWJScEx3c25pdVB0aGdsUUtpVitUZHRQ?=
 =?utf-8?B?M1lBdGMvUUZUZHdDQVFTSTRZWHVXbnloSHdjL2xKR1J3TVd3ZmdoVUF2ckcz?=
 =?utf-8?B?UUxFMzFXUVNUdEZnczc3amtmTmlRSmw5UngyYUR3WWkrU2JXekphNkpHN3Bv?=
 =?utf-8?B?REFZL29jYldtRVlyR0FNWmJkUkE3WWNCUnczZng3WXFna0E2VElhcGhhZkNQ?=
 =?utf-8?B?MjV2VnMvMzd0dCtuS2dSSTg1ZVl5LzAyOHVmNjNaMU8rS0NWN3lyZStNZHR4?=
 =?utf-8?B?TUw4b3JWTnhlaGlSaWdjSG1wU0dpeU5rcWZUbktjWDA3Yno5eHFFRGp5WDRM?=
 =?utf-8?B?SDRmY1lOaDdnbGRkOHhsMDI4TDQwdXpsOENlcHk3ckxaakp1cTdGSHJiMU9O?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da808eb-ff65-4fe2-cbba-08dd7784a173
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 16:36:08.7831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkMOvlGaOBZZQ6arBZfWDmSuVfqGy7UiYlSwwYLAjJj748gzpJlq0V3RloTDtmV3XMfUbZUBDF8iPR0EyuvHNUpR74Sm5FVuviXztKWdy2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8704
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

On 2025-04-09 at 16:02:00 +0000, Krzysztof Karas wrote:
> Hi Soham,
> 
> >      Add support for the device filter based on
> > driver string, device type (integrated or discrete)
> > and card number.
> > 
> > v5 : Add device filter to filter out
> >      matching devices.           (Zbigniew)
> > 
> > v6 : Move device filter with Separate 
> >      commit.                     (Zbigniew)
> > 
> > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
I forgot one thing I wanted to ask about the new filter:
"device:[driver=name][,device=type][,card=%d]"
It looks like 'device' is the same as for sriov filter (where we
have device=%04x), but here 'type' is a bit misleading I think.
Could you change that to device=%04x to match the other filter?
After that my r-b is still applicable, because other parts of
this patch look good to me.

Adding a type filter however, could be another field for future:
we could add discrecte/integrated card selection. Treat this
as food for thought rather than a request :)

Best Regards,
Krzysztof
> 
> The patch looks good:
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> 
> Best Regards,
> Krzysztof
