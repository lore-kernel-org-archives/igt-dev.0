Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7711C79F82
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 19:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0A110E161;
	Tue,  8 Sep 2026 19:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abihCO0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4528110E161
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 19:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788895045; x=1820431045;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jQ8folifAtN1170CaozpVAB5j4C3ZgojQ5u5AJnSKmw=;
 b=abihCO0V4rkJqz7bZE/Zi5xr2RGJRgV2mV+yKWTPfiojDxp8K8u48kTP
 Ws6ICsT9Pp5sTDapZAulj96UST5h+PcxkpA/+RGLdYf+a9uELa/R0qYY5
 1rgp14L7fanQxxaaFnqJ6CKHvEo3DaZy7CpSgFdwUq0Tm49D809eIWlkT
 9kT7HRPDXf4JDlLaLZ0RVPoZn0hckJSbD8JZyGKe0bgMac+QDlr2Ikvo1
 8QQG5wFdrNJVmL6m1yeSmovqPUtjaQZHsYngHsOp3xjsqyjJZHh5tIlXY
 Opt/c2x6jEHrDGsia8BZEaujS8Hq4e6PFf7qY7hbFLOuKqzFopClQ9/4/ Q==;
X-CSE-ConnectionGUID: 0Ng/J7hJRM+ecPBaaMGeuA==
X-CSE-MsgGUID: w944OUIhTIKn9W2SJRubkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="76869040"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="76869040"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 12:17:24 -0700
X-CSE-ConnectionGUID: SF88pPveQ4y0AlsuLqI7JQ==
X-CSE-MsgGUID: LwcqoXYYRGqPmZ3DjYXLDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="266777656"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 12:17:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 12:17:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 12:17:24 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 12:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=queSwnq+1JoRLE/iFV01/Kyl1ig+FDxe2i2ujrGlszF7NRot5h11ocZeqlgpQqEJu5C7YvdaXIQFfms5vnL6j56+nP7Q0OTfXsSp0y15HYwKUQ+XczH1vsHND5sOPsrL7nudSTiRLBukozehFzXS46VYpt9khmHutAQXDlW0I9+b2IgB6BcXY6SlRCntvH4UGsre8+25TB/3437rFdFWS6CRTjDIaeOJyPJfDffUVrWAb7WRnmX/ow/f/5aRrJZQymKB6oGjMDj+YYkR4s65QEhv+apSD4axKwTDqQSw3BsTH91BwUdKpnD32nuL8pL3lIiFHfbhZyyyfpsWIA4vhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ghics5yhWCdFs0SHuvqNsyVGWZq8B0aE0nO+7QauRQ=;
 b=yh1sqcm5PsywsMhkxIyZZrifOdZambD+ImuKkulvAGREB1sAYT0jV4WC50xJvB1Cr5O4cznW31H/4kHnwWjC+V19rH0bgDLUZWOGLL10K3F9C5FpoiNsh8kgEOGSKe5LcbcCgSLNZ8OqjiQK1bJM6tQi+e8tRsCjfUNPx/dSIiHVQ/4E3dtqtab9reaLc94su4UwUJMF3X+WwHVSh7SMJZAfh8mO2WpALRUheobU+Hit5gdDwzzYHytfbUsa9iaRy7sb5iBwS0XHo4BD8nFGsFI7d17KhQV6Q6Lj8Q7qOPcvdmIbWuDFR5ig/ZDZafQ8H/Zfat+S56B8AlXo/zyZpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DS4PPF11A2D5672.namprd11.prod.outlook.com (2603:10b6:f:fc02::b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 19:17:21 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 19:17:21 +0000
Message-ID: <d68b5a97-f833-4d50-a6ac-937049f6334b@intel.com>
Date: Wed, 9 Sep 2026 00:47:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 7/8] tests/intel/kms_color_pipeline: move
 driver-specific test to intel's folder
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kernel-dev@igalia.com>, "Chaitanya Kumar
 Borah" <chaitanya.kumar.borah@intel.com>, Alex Hung <alex.hung@amd.com>,
 "John Harrison" <John.Harrison@Igalia.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>, Xaver Hugl
 <xaver.hugl@kde.org>, "Harry Wentland" <harry.wentland@amd.com>, Uma Shankar
 <uma.shankar@intel.com>
References: <20260902180016.303482-1-mwen@igalia.com>
 <20260902180016.303482-8-mwen@igalia.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260902180016.303482-8-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::9) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DS4PPF11A2D5672:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d66852-9218-4ee8-08a9-08df0dddce5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|23010399003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DD+hhadILDkdnMIsM+vV89O98CbA8tnWoxvk7hVBkSTGDenwEerwszxkWqeam73TFmqH7PJnZUjjUcs+G51+uVkCG/eWoFYkLiVqi25iY5IXMeW8mf6aEBIZVql2KIuRdtBEuX4g0OYq4OuOjCHhhOyVd837ftYzOd8Eoou2bfSssJBjpRhpwsNsS1xASRY3mIBAZ1oy95we/B0ByklR+YtGQgwvPM0LA7xC1Z8RaATGpZwKBFzalj3zbLbjoaQfJi0njeJk1Uv1jwz1Ssf09pu2KGRyVqZGwiuKoG2dpqI6Nfnpe/cvybJ009vWe9ab1u9Z8Ntf8F0rPUGUl8SwnkeCweKRA3ytuYj5KDPjkz438sJMgwhGyPMdXlBZQ8VWes8/F0epuS1nGR1xuQKOfvvoznpsMNL0Co2Oru1KK4gOfxa1EFHVtmRCjhzUlYvmr925kBEBAB1i0AQbsPgoxzwbrn/35UQxwh4gw7vwCeJj2YeHRRiWRL8lCxdYsChIwoxlLmdRFL8sidWJ3C+fBMjliXFSbXcG+tTK4oxmEA4ZUITGufP/T8NOAv3YaGIX5rFTDIoW88XDjQlI2X3a+wtb9skaUOjSNbTwRifrIcMRq8tr6zRvipdw0vB+2pMgqTtH1eAA4Vdk8x+rS6VGflQbaJdOWpsNbFlJKhmLUzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFNxREY3SXNvWHRJQ0hRaHB5d2pRZEVqQzJ6cDFnRUVvUEpBclk3K1lVZTFJ?=
 =?utf-8?B?S09HZTN4d090aDk1eTZQY1Y0T25DSC9TbHcwMmdoUVZ1dnJWS2l4VlpuYk5q?=
 =?utf-8?B?ek5ISENFWU02V3VPN3JpOGZjeTdRZmJpUzRJaElzNVJlb2J4dzh0MzdzazE3?=
 =?utf-8?B?VTlFLzMwR2I2akd0ZWxjZ3RKeVZYMjhGaDFjM05zWVFWb2RDd3poa1pCLzZq?=
 =?utf-8?B?cWt1UzVwd3dnUlhCd3BCMFFmdHplWTF5bXpIY1lUbEFIMFg4TVFsUXBLNWhj?=
 =?utf-8?B?WURtQVFjRzY2L0hwM1Nudk5udUVrMU50ekNsRkFSUlkyVzRQOHpaekF5OXJm?=
 =?utf-8?B?QUtDbm1oUHZxbVp0MHVtTmFuc1A2M0ovZzZWbGJvNHpKYzZEaThPWnVYV2hR?=
 =?utf-8?B?cEtTd2x2a1Z2RW5qUVhYTnZ0YXFSY0Z0N25sbXNYRDlLNm9xRWluWkFBbVFU?=
 =?utf-8?B?UDkxWHlQeFQ1OWpYQVF3NTQ0NjBmQ0tsMkZLeFBmY1hybHdXcU9yMkhWSXIy?=
 =?utf-8?B?R1Z0QnpPcVVCaTVHY0RmRXpXQ3Q4dUNSUjNpV3RleUtGd3p6Z0ppT3RwMkh6?=
 =?utf-8?B?VnJkWHFTZHJXdUlLWVhvV2tYWnF6SlhrUWlWQ1ZvbjNJbjRZSFIyNC9HaTMz?=
 =?utf-8?B?bHJQdVFoazVyZjBxWTFYeHJoZU85WENZL1Zkd0h3dDFZL0tmWUhhQmJYVHcr?=
 =?utf-8?B?V1FjY2QrcFo0OWNjUDNGLzNLSUJSbUs0aERZWlVoRVk4ZE8vT3FudTFMK2lX?=
 =?utf-8?B?RGNDcnNoWkFEKy90Wi9XZVhnRzJvN2t1VjhYMGJQVk5wV1RrWm5Pc1RNeVdB?=
 =?utf-8?B?bnhnbVhJZ3dVSGsxbkxCb2FSZ21ZaUVWUFBwUmJDSWJkYW13TGd1anBqNmJV?=
 =?utf-8?B?bmtwZmRmT1RDcW5TU0Y1OGhPRTZEM1lqdlM5U1lja2FMOW8zL25YYWdpWUJD?=
 =?utf-8?B?eEZLWUcvWnlEdUlVbWlVaERRTzZJYnZxeGhXblJEVWlmTEYyWlBaZlc4MVI1?=
 =?utf-8?B?YXdQMW5WcWtacjdOeTc3VUd4NklHZkEwSjQzYXhRbW8raWhuclJMMXNCNEpC?=
 =?utf-8?B?eEphQTQxVG5EUXU3bUV1bkVNbkRPVG54YW1hMjVGS242dFozMk5tTkxrODZH?=
 =?utf-8?B?eHF4eGVPZEthZDI2VnJ4RTJmNENmSnI3R1pHVXkvblJiRmJ4cXl4RU1oSG1y?=
 =?utf-8?B?aTR6NUpuUitEYjU5cXFhOHNWS2JJWWMxU3dQM2ZHczkwdm9BSG5JTDh5alpD?=
 =?utf-8?B?UmVVYnFNR2dJa0lLYUVRcm1vUUs4OXZaMzJPSG1sQ0dGMUVlR0dxeFFjVkZQ?=
 =?utf-8?B?L3kvaFNoZGRPcHhsblZVZjBYRkJRUTcwc2VpcDRMRjFpeng5WU0wSkxRb3pF?=
 =?utf-8?B?YVpXbVlaajBBRzkvWlBieHFnTXRMR2k0emVsT2k5V3IrOEhqM3Evc2hEZjFI?=
 =?utf-8?B?ZWpLRXdvenlrRXZSSkgxL2o2L1hUcVdqT05VNFJVczg4cnpUTTJoeStPblkx?=
 =?utf-8?B?dDcvQ2tiZW45WEUvMkVXTUl6Z3pPRmxCNFMxd2pXZUpRazBkNnBXWWRrM2hQ?=
 =?utf-8?B?aGtWZUlKRnVZTVphN1JXQzhuWEJJSUREam43d0czNWtGTWFkMlVBYUhiYUFD?=
 =?utf-8?B?LzBTQW91M3FNa1BJSWJyOTJLcS9PYTA1cjBPd1V5cTU2T3NiRWdYcWZNaUdN?=
 =?utf-8?B?OXp6TGxyQkxGNldCVVRPZW0xRllGS3NpUktYR25NZGMrTHpFZUhhdXdRNHhS?=
 =?utf-8?B?NndnTmJDTG9MK1hQNzZmWnNLR21BZnlnWEozR2dpSG0yM0pJQWt4dkJZbVk3?=
 =?utf-8?B?ckZRTGpHQytuazAxTGc0K0djYjkzbGlrWWwzVEcvaitIZjNxM25EaWhZak1R?=
 =?utf-8?B?dXc2OGY4aCtQUXZ2dTRrWGQ1dXgxaE9NaVovcTZtd1RVUUF6QlEwTjdzenAx?=
 =?utf-8?B?ZERqQUNvL2lKbCs5SjVxNkI2amYvZkVlTGE2WWFPZXVhSTVaaEF0WjVBSnNs?=
 =?utf-8?B?dm4zUnZiSEdoWE1vNkJqV0J3V09MZ3NsdjJHYTlsUUpjbkZBeWp5R0k3Lzdy?=
 =?utf-8?B?T21SRjBHNmcxU05COUI5Q2lGR2ZwY2J6a01kaFQ5UHNreE1YRUM2WSs3aUZP?=
 =?utf-8?B?T0xKZ09JejhlNno3TWo1UVJoTTJkaW13Um9iNHV2dkVnVWRaRGJLVHl4aHRM?=
 =?utf-8?B?WWtNUnpHcmhsTUlOaTVBSFYwZDRidS95TU5KSlMwS1oyM054QUM5dzkvSmJV?=
 =?utf-8?B?cnZzeFFaZ3hhem9PMVVQbytJZ1BtU1FlUHE4MVdjSjQrUEMvZnVxQ09uZ2FV?=
 =?utf-8?B?d2pubEovc1gxU2htNXB3cWdFT3U0ZmlxWnRaK2hYeUhCdE5ldjRhbXRoQWsz?=
 =?utf-8?Q?ydoC3Tzr5m72ZXDc=3D?=
X-Exchange-RoutingPolicyChecked: SEJ2S1X/sdIEP8rF6O2JtqPDCBToRm5W8p+4Jw/nxygPoiUmEIuRJYxf1SouX4prMeDYkqejhqaOUr1+i6YUSfaJgJhoddtOGBWuc/RNr9wavyQyygSznHbNsMNQ5yHZy/LoRY9CBqriiyUenaLWKJtJd1XxA/OPqHjkUuUFIVy04Rj/p6TsGx8uWeXa+iNViIIadcgZw8MA//Wd2AgUUntw1xaDMC5Yo4S55qDs804UChx0ufZcDhzP+MNaI4XNCQq0plbXDLo1mGAxylB4TXaXlnBVhLGUp3fpHXSZs9sU0Dge90Wo6N1mNg410HvD4Bxyl40+bjS/RqH5CBJXcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d66852-9218-4ee8-08a9-08df0dddce5e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 19:17:21.2642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6vzgq0qKBOXup128enbo1oTGBpVAc+pYMy3nJJxTeIXrUUbP+IzrDDoCgrAorYC93jYo3GPZ9r8un74B2fe8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF11A2D5672
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

Hi Melissa

On 02-09-2026 11:28 pm, Melissa Wen wrote:
> As stated in test docs, the kms_color_pipeline isn't driver-agnostic. It
> validates color transformations using CRC, which is less accurate than
> comparing writeback buffers, but the i915 and xe drivers require CRC
> validation when the writeback connector is not supported: kms_colorop
> tests don't run when writeback is not supported. Since other drivers
> that support colorops also support writeback, this CRC option is
> currently only required by Intel; therefore, move kms_color_pipeline
> test to the Intel folder and only open Intel's drivers (not any).
>
> If the CRC-based colorop test is useful for some other driver, the
> required generalizations and switch to the common folder should be made.

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   tests/{ => intel}/kms_color_pipeline.c | 2 +-
>   tests/meson.build                      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename tests/{ => intel}/kms_color_pipeline.c (99%)
>
> diff --git a/tests/kms_color_pipeline.c b/tests/intel/kms_color_pipeline.c
> similarity index 99%
> rename from tests/kms_color_pipeline.c
> rename to tests/intel/kms_color_pipeline.c
> index f71416ce1..3d41b811b 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/intel/kms_color_pipeline.c
> @@ -353,7 +353,7 @@ int igt_main()
>   	data_t data = {};
>   
>   	igt_fixture() {
> -		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   
>   		/*
>   		 * Plane color pipeline support requires atomic modesetting.
> diff --git a/tests/meson.build b/tests/meson.build
> index 1ac89bab7..c1a436420 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -25,7 +25,6 @@ test_progs = [
>   	'kms_atomic_transition',
>   	'kms_bw',
>   	'kms_color',
> -	'kms_color_pipeline',
>   	'kms_concurrent',
>   	'kms_colorop',
>   	'kms_content_protection',
> @@ -250,6 +249,7 @@ intel_kms_progs = [
>   	'kms_busy',
>   	'kms_ccs',
>   	'kms_cdclk',
> +	'kms_color_pipeline',
>   	'kms_dirtyfb',
>   	'kms_dp_link_training',
>           'kms_dp_linktrain_fallback',
