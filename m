Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A5EC04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 07:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2EE10E109;
	Mon, 20 May 2024 07:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmunlAUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D21610E48C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 07:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716191678; x=1747727678;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jOmEU2bpwlsbOcxylciaPti47r/kJo6X/Wa12QiJz3Q=;
 b=nmunlAUPbwlOLptLt1sBnPD5CvehcknDO+R2DVPwSA5q7aSswXRqSqLS
 xs1ippWrSUq1Zy+VRlzPSOYZRs7rrjclUQuv6K166P2DlxdYd6vcEQMkm
 OWgOOwktiAzfMol8YyRorUWG5ERwGKf8Ay5a7pOSUYFSY3Ma1I1WAREMh
 tYy6iN/kovmMadPKBXClQN9nUTs8k/O89wmaGomUdD6cm0/eDkxtWnJ8t
 tLAR8IJcWlK3xzUQ2K22+wnuIqBy4pDpYcPMbLNJL76/ensxKAa226z35
 oMb6Vf0rCCEljqXasCGMQlH5ovXgQQ8Azju7b5EWp14WNXQLTJD3HlqfL w==;
X-CSE-ConnectionGUID: lB7FMJHxScuNxQWIvp4CaQ==
X-CSE-MsgGUID: O/CcZwfiTH2BHh9Dpyc2Fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="34818113"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="34818113"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 00:54:38 -0700
X-CSE-ConnectionGUID: WXnDwQvzRaiU25Mb58gerA==
X-CSE-MsgGUID: hPVkQj0fS76hiUa0VCv34g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="63674482"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 00:54:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 00:54:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 00:54:37 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 00:54:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaXEU/1+KmRpQcK0miefDXwFiVItJLghwWZAKrIxpRLCBUrjEAhafBZ3/6TjjQekNX5iP8sqhQ63YrbF0YAYisdegORnyMib77OPwOaJi92lPuB68PVwK1peZen8KzwzSTdcb5BULlHn9C7FRhGwbYMPBmK9DLjflitQS2O1RZ7K23spNAvLVhmXapNsZfymVD+FulPgN0qKRgH6w7uxetoVcOwnxsbJqx/x3tJ1dRqJZBqYL7wbChDmRUVjx2PNEmXPNMDOvtMDfGGaPaRCrJitHOhveJlXOu4v/Nxp/d9a88cWQCiQZEVyRhQsFWDvZG5iOdzmcT6LCOVSD5SJLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfSZAs6vn+WZb1FElFgAs3R+VWKfc2kdz7fazshP+zQ=;
 b=WXIXs02KzOivKDciunkIJ3xj+Kov9hIMOkbD60yPZgPYL4LAgVrPcctXiQ69JmxC0NKXmP4q0o0ds3uN4n7tWqzWJe1yd4inTvhd5SdvclrIdolg+zzE/EugGHv6iTGRGl0MaUVRb4GtYvHwQt30jZkqntl6jrNNu6d5x7c9oncU1jzpP3qGCnSOFHYkX5qI+6t/7GB+ftDkZO/yN+QMdynzztMDmw8rPSeIkHakE/ZjAD/PGcxoSddy7IUXt9XNINXU5PK4MXk8bYCL4UoO7uTRxRpVDq3BQKTsGmkoimbKd9Pua0S3I7f7ehWl8+WpQp8TBjgm0UeKjuStd4M61g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 IA0PR11MB7791.namprd11.prod.outlook.com (2603:10b6:208:401::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 07:54:34 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 07:54:34 +0000
Message-ID: <6ca5030f-005f-446d-a49a-be08cc8e6e0f@intel.com>
Date: Mon, 20 May 2024 13:24:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless modeset
 to a virtual LRR mode
To: Manasi Navare <navaremanasi@chromium.org>, "Saarinen, Jani"
 <jani.saarinen@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Drew
 Davenport" <ddavenport@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
References: <20240424201344.783935-1-navaremanasi@chromium.org>
 <64cef3df-1610-4d53-a44c-905220e09b76@intel.com>
 <CAE72mNmRsA-KcZ61F6d4Pg5_OQnpifO7AmivE2AkhN_0WT=eTw@mail.gmail.com>
 <682dccc4-c788-4bfd-b8ef-b24d60b488d6@intel.com>
 <DM8PR11MB565517E06CDBA9B389BA86BCE0162@DM8PR11MB5655.namprd11.prod.outlook.com>
 <CAE72mNkYFsViPR18xcT=WZyjNrMSJ6Gq14MUbMzUVHarDfDb6Q@mail.gmail.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <CAE72mNkYFsViPR18xcT=WZyjNrMSJ6Gq14MUbMzUVHarDfDb6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::34) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|IA0PR11MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ee15cd-4167-4217-e8d1-08dc78a216da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEtUd0p4TjFCajZURThuOUMvRFF1UmJxeEV5TGM4N1ZMRDcwRHBjYWc4bEFs?=
 =?utf-8?B?TFN3UDY4NzJUSGlZeHJXU0FXejB5U0NqT2ZMb0hHM2dkdktuMGxCbk1JVGtS?=
 =?utf-8?B?bDdJakhiQnM1OFVreHp3cHNSK1BuN09vWXRQZVN4WUhibzdLekkxZzF0L3pt?=
 =?utf-8?B?WU9TZjQyeVIzdWI0RGNHTGUxSGdxdW9FelkrVDNOUEN5bUlLLzVuemplUUEw?=
 =?utf-8?B?SU5CK0NWQiswYU1TaldXN2drby93cUh4NWJ1dHVqVWNLd3hTRGo3RmNZZVBp?=
 =?utf-8?B?NG03ZVNkbmR1QjUyUWFROHRkYlNPalJCYjQ0MGNSMkhuY3RBaVBmVTBKTzhM?=
 =?utf-8?B?K2I2OEJ2VGY4dTE3VHpmdjU1d3ZRbnA1Qm4rM3lpenhjVlc0VVhsQWZWOW5m?=
 =?utf-8?B?ZUVSVkY2QTZoMm9sdjB6TWpIekZXOGNmdnpvL3NHY09uWlEzb2JYU2d1SmI2?=
 =?utf-8?B?Q0toVTd1RzgvRXI0QUZlOFpMdjNxSHRBOVlFQTBLR1ZOMHdQQ1h4UmJMOXkr?=
 =?utf-8?B?ODQydGMzV1gxejQ0SzZubGwrUG9wU2NlcHNIT3JYaXo5NGVHdWNSRFNPaVBY?=
 =?utf-8?B?Y1lJVTN4aE9qSk9BNldTb1RyYmlkeVdGbi84dlhYMGlvZCtKTUhDcURXcVky?=
 =?utf-8?B?ODJ3VzlsT0VGL3cxU0YwM2cvQ3h0bEMvYTRaejY1Q3JzVWNvKzdiMll4WlpX?=
 =?utf-8?B?WTQvMFVmWVZIZmtuQnMxVXFsQzJMQWppMW1MNWZiQWVIL0JpbFRqaEVvM2NB?=
 =?utf-8?B?Sm55WmQ0eXlQc3VFbDJFR2xQampXenNQelpZK1IzS01yUlppWDdGUHFUS0t4?=
 =?utf-8?B?TTZteVZ3TU9TbE5mTWlRdUN5c0J2bzB1YTJlZXdwNmNCN09sQnZ6QkNzbXdK?=
 =?utf-8?B?NjNxZFFGOVJwNE80STByYml4dGxMOEN1OFRUY09wNmM3L2NVYlQxRU1Razh5?=
 =?utf-8?B?cUlqd3h5TVRuZGpHTUZpYXQ5cHZOVTc2b2s0cS9KaU43eGFyMDFUS0NpM0tX?=
 =?utf-8?B?NGlWWnhEV1BiM1pjeW56SDN6c2dMYjB4SFpqTFplNTNwMXZqdjU3bFNrc0ZY?=
 =?utf-8?B?NVVsbTJsYlMyTEpObnZ5d252SWI1MEtXUkVWOThqYTZ1UzNXQ2lpa2hycklV?=
 =?utf-8?B?MnplbWxKZzRnQm9jSklrd1dMQzVKemNpZnhKTzBXanlTb3NPc2NhWEpyczhE?=
 =?utf-8?B?ZTV5eTEza0I4bzNMMWFCcGoxNGdCNFJXNkdlNDRibEF1bnhqRVRKdllCMXg4?=
 =?utf-8?B?djluM2tOOXB6V2UwVzJXMW5KOVVLNXJiQlpiRTNITVBmR3dyVVFkQVVvWEQy?=
 =?utf-8?B?blVnN1NabkNRNzZQekZMUldGa1M5bXdGNWpyeDNySkY4YlEyTjZqVXJJVDh5?=
 =?utf-8?B?RzUreEFvNGpiSHZaYzRXZlpLUG9PSmJMMmZqOVhxbUlCOUxkZ29SMjNlYUI4?=
 =?utf-8?B?dElHVDQ1bW5mRFowR2tnM0R4SjZtMDN4L05rbkhDdUpYNUF1bzRoYXlTN3V4?=
 =?utf-8?B?TEU4dG4zQ3EvQ3ovTlFZSU9obTFBOTFiZGx5ZlA0cGpUMkhnbzZ6WEJIeGZh?=
 =?utf-8?B?STladE5PM0gvVE5oV0UwNER5RlVmMS95ZnpaWUtKbUhsT0d1UTlYdG1jUXJY?=
 =?utf-8?Q?fl1I7/RHmxBUKOr9th0kG9H2FQUY1NQatgbkYjxtJqLk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmNTTjl6eHpQOU5oWGFzL3VudXFSVTJWVi9ET3czMmVmV1VHdW5ibGhyNVhO?=
 =?utf-8?B?SUNzdkJXNEhrOXpFbml4Qnd2OW5XWVNiYks0RzF0SWpQejNhWE1xUkR6ODJJ?=
 =?utf-8?B?eGxXZjg4YjVUYkJKVzBDZzZwcFlNK1poWTVhVXZtV09NYW1icGdlR2NHUFNn?=
 =?utf-8?B?eTZkV3dEWTNYdU4rdXFSRm5OQmI1c1BmNXp4dTFZQjRvMmpNYloya3BERkRT?=
 =?utf-8?B?ai9lSUxnUGY0UXZqOUZDMjZFSTZSa2pJWFNWTk9WR3hCZ051Y3RpUkF0dGFW?=
 =?utf-8?B?SERQUlNHQ29RK3A1VDFNbGExVExLSlR5WWQ2cXJ1UlVhZEljU1JLbVlEQjZu?=
 =?utf-8?B?d3NJdkZrN2RNd09oT3ZsNGM4c2RZZjQvNER4VWU5NmlaM2VjYVdrN1pLZjJv?=
 =?utf-8?B?VGQ3aERwZDNrelJIUWZGVkJEbGRiTUZJMHVtT3lMQWlwL2c3S0JabUZPL1B4?=
 =?utf-8?B?bVNUb09sbTNNTTNsSlN6amxtdGd2OGNiNnBaQ0p0NThkenYxb0gwN1VwMWpn?=
 =?utf-8?B?bzc5VmEvTHV6OXlhOW5VcEFIdVY1SWxyWksyRlVnQ3l0TzJGeUF3NW9JRmtv?=
 =?utf-8?B?akhaamhsTTRmRDlrL0prNVd3di80OVI3b3F2ZmoxWFlwUGduM2VDcU8rVTRq?=
 =?utf-8?B?dEdNUEdCYXhlMXM4SlZDR3kzRCsxVmhIdTkvN0lxT2NKdUZDVHpJSE9FRE1z?=
 =?utf-8?B?aW1wSkltcGpuYXhyd3hreEtqYXFSUkZHVE55dkJyUk5SbS9EWEgvUGZzRWkr?=
 =?utf-8?B?UUtoRWJKcTRVdW90UXpmZlJvZzEwdEk1b3lYTEdOSnE3WTIyUlR0eHozTS9L?=
 =?utf-8?B?T1JVVFFnYXhiVGVqRVN4K3ZHei8wcjV2VlEzZUJRczZmOFdHYXRueHBBOXBR?=
 =?utf-8?B?V0l3OXg1YnpFcVROTnc3dGlvK0Z2WlZFSTVBeGVuaGh5RlhmOUNiR0FOTC9q?=
 =?utf-8?B?aTBLQjNGempFZGNhQ0hoSEp5SFU1eXFkM2dMY1dVbnErcjlVSzVPNTQzREQ5?=
 =?utf-8?B?ZTVCUmFQRUIyc1hwNG5BSFd5Q2NGeW9wUTJYeTRyZjMvMFhlMG1qRVlqbjMw?=
 =?utf-8?B?TUdLVVRDRm41WWMrZ2F2Z0RyRHhmZEVmcklRZTFCMkg3eVlyR0E4cE11bW9I?=
 =?utf-8?B?eXU5dnQ2Zkk0MDlONk1rVnhCM2xVcDZxRjM1c2Z2Z2lEZUZlRlNVMHFPSHlr?=
 =?utf-8?B?UHNBT3hYVXYvb1ZFZUhxUHpqbjU4SVhRK0krQ3NlQmZ5VTAva2ZBMmoyaHRv?=
 =?utf-8?B?dXBkQTBuZmw3RkVlTElkMVF6S0FSRmN1U1lyOHIzOWNvRTlVdFdEbC9NS0U0?=
 =?utf-8?B?WFA2SHJPbzg1bjdEMWljS0dUaDg4d2xlWUxOWkpmVGpPZHQ1eXhQcVpGOWlQ?=
 =?utf-8?B?bUdDNEhoNHV4aUZZVGVtc0dSSnluQkI0MDc0bHVTcEJPN0pBRUZmM2RMcDZv?=
 =?utf-8?B?c1UvMnQzTjNlVGh0eHZEajJMMzdRREF0OU1hNlZ3VTd6VFYxUVJPeWtUWHVN?=
 =?utf-8?B?WkIxMC9qT3NzTHVWVlFNVy9zMHVKS0U0ZFA4MjRnWm55a3NKNE5RZEVOSk9j?=
 =?utf-8?B?Nk5EQTg4YWVLT1hBeEJyOEZabW50Qks5aTExNGRvRDN6bktHMWd4S2lSN3Yw?=
 =?utf-8?B?cWxhZGV2d0oxR0RLSzNkTVl4VWR0T29sMFdCV1hNYXU0eTVJV3k4dXdqbklj?=
 =?utf-8?B?by9ZSzVGS29VVjRpZVpXdFV3OElic0ZrK1RNZ3lmclZJOXFrOG9FTnlhMkE3?=
 =?utf-8?B?SXA1QUFNeTE1dWhwRnF6aCtRUVQ2eTZnTkptZHlMY1g4RnhHdHVHemdaWmRw?=
 =?utf-8?B?UTJhNk1WSHdKVlFwc0d0Q0oxcFlHbGQ4b3RDVWtEK3grNVhIWk5rdGIydmxK?=
 =?utf-8?B?T0FaS21UdnpQVFR6M3lFN2lOSUxBbXY5OTBNUjlocXNEallqellSdjBtZFlQ?=
 =?utf-8?B?eWZObVc4ZENjZWdjd24vRWx4Z0szSUVQR3dtdkI5RHRYNEFVTERESHZOQTBO?=
 =?utf-8?B?YmYraFNuT0dwZTJPTWZ0SUpBTE1GR0dmLzVRbEtBR3VQcm5GWHVlaGc3NElQ?=
 =?utf-8?B?d2UxVUhyWFR6STJRRGJGMVlhaDVhODc1bGoyOEVJcEJwaXd2UXBNTFMyQ01a?=
 =?utf-8?B?bVlzYm1ac3ZpVXlybk9oV01xMUVhTkdGQUo1ZTByVmlYSEMzUkM5SjJWZmZI?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ee15cd-4167-4217-e8d1-08dc78a216da
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 07:54:34.4102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99mCVvsX0RugVmtn7kHMeC3XLsicqR1je6FFhrS0L2uwrL0eHyxjCAKhhnoyrf0BY46ElMwyXxXJZGzxljpyTOjvokr+gNsBM2sQIvwgfk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7791
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

Hi Manasi,

Sorry for replying late, I was in vacation.

On 27-04-2024 12:54 am, Manasi Navare wrote:
> Hi Bhanu, Jani,
> 
> I do see that even the other vrr tests : seamless-rr-switch-vrr /drrs/
> basic-fastset are getting skipped on BAT, so its not related to this
> test. I am able to run it here locally and test.
> Could you please take a look and see why all of these would be
> skipped? Seems unrelated to this change.

In case of seamless-rr-switch-(vrr|drrs), these skips are expected, as 
we don't have any valid config. These tests are eDP specific & panel 
should have the modes with different refresh rates & clocks with same 
resolution.

In case of seamless-rr-switch-virtual, it is a connector agnostic test, 
it should run on one of the BAT machines.

Can you please review the helper low_rr_mode_with_same_res() once, as 
you are using this one to pick the low RR mode?

> 
> Regards
> Manasi
> 
> On Fri, Apr 26, 2024 at 12:48 AM Saarinen, Jani <jani.saarinen@intel.com> wrote:
>>
>> Hi,
>>> -----Original Message-----
>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Modem,
>>> Bhanuprakash
>>> Sent: Friday, 26 April 2024 6.44
>>> To: Manasi Navare <navaremanasi@chromium.org>
>>> Cc: igt-dev@lists.freedesktop.org; Drew Davenport
>>> <ddavenport@chromium.org>; Ville Syrjälä <ville.syrjala@linux.intel.com>;
>>> Sean Paul <seanpaul@chromium.org>
>>> Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless
>>> modeset to a virtual LRR mode
>>>
>>> Hi Manasi,
>>>
>>> On 25-04-2024 08:50 pm, Manasi Navare wrote:
>>>> Hi Bhanu,
>>>>
>>>> Thanks for the review.
>>>> This is not specific to edp, it applies to all connectors.
>>>>
>>>> If the BAT results look okay and I have your r-b, could we get this merged?
>> Did you look those.
>>
>>>
>>> Looks, BAT results are not OK to me.
>> Right. To me looks so too.
>>
>>>
>>> The newly added test is getting skip on VRR configs:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-
>>> all.html?testfilter=kms_vrr&hosts=bat-adlp-6%7Cbat-adlp-9%7Cbat-rpls-
>>> 4%7Cbat-adls-6
>>>
>>> - Bhanu
>>>
>>>>
>>>> Regards
>>>> Manasi
>>>>
>>>> On Thu, Apr 25, 2024 at 12:39 AM Modem, Bhanuprakash
>>>> <bhanuprakash.modem@intel.com> wrote:
>>>>>
>>>>> Hi Manasi,
>>>>>
>>>>> On 25-04-2024 01:43 am, Manasi Navare wrote:
>>>>>> This subtest validates LRR fastset functionality by testing seamless
>>>>>> switching without full modeset to any of the virtual LRR mode within VRR
>>> range.
>>>>>> Here we start from highest refresh rate mode and then switch to
>>>>>> virtual LRR modes in the steps of 10Hz within the VRR range.
>>>>>>
>>>>>> This is used to test the LRR fastset functionality of the driver.
>>>>>>
>>>>>> v5:
>>>>>> - Pass a reference to flip_and_measure (bhanu)
>>>>>> - Add a new line between between declaration and code logic
>>>>>>
>>>>>> v4:
>>>>>> - Change the test name to align with drrs/vrr tests (Bhanu)
>>>>>> - Fix some build warnings due to rebase
>>>>>> - Use a local virtual_mode variable
>>>>>>
>>>>>> v3:
>>>>>> - Fix build error due to rebase (Manasi)
>>>>>>
>>>>>> Cc: Drew Davenport <ddavenport@chromium.org>
>>>>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>>> Cc: Sean Paul <seanpaul@chromium.org>
>>>>>> Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
>>>>>> ---
>>>>>>     tests/kms_vrr.c | 73
>>> ++++++++++++++++++++++++++++++++++++++++++++++---
>>>>>>     1 file changed, 69 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index
>>>>>> 15c62b34b..7f64d6806 100644
>>>>>> --- a/tests/kms_vrr.c
>>>>>> +++ b/tests/kms_vrr.c
>>>>>> @@ -66,6 +66,11 @@
>>>>>>      * Description: Test to switch RR seamlessly without modeset.
>>>>>>      * Functionality: adaptive_sync, drrs
>>>>>>      *
>>>>>> + * SUBTEST: seamless-rr-switch-virtual
>>>>>> + * Description: Test to create a Virtual Mode in VRR range and switch to
>>> it
>>>>>> + *           without a full modeset.
>>>>>> + * Functionality: LRR
>>>>>> + *
>>>>>>      * SUBTEST: max-min
>>>>>>      * Description: Oscillates between highest and lowest refresh each
>>> frame for
>>>>>>      *              manual flicker profiling
>>>>>> @@ -89,9 +94,10 @@ enum {
>>>>>>         TEST_FLIPLINE = 1 << 3,
>>>>>>         TEST_SEAMLESS_VRR = 1 << 4,
>>>>>>         TEST_SEAMLESS_DRRS = 1 << 5,
>>>>>> -     TEST_FASTSET = 1 << 6,
>>>>>> -     TEST_MAXMIN = 1 << 7,
>>>>>> -     TEST_NEGATIVE = 1 << 8,
>>>>>> +     TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
>>>>>> +     TEST_FASTSET = 1 << 7,
>>>>>> +     TEST_MAXMIN = 1 << 8,
>>>>>> +     TEST_NEGATIVE = 1 << 9,
>>>>>>     };
>>>>>>
>>>>>>     enum {
>>>>>> @@ -214,6 +220,18 @@ low_rr_mode_with_same_res(igt_output_t
>>> *output, unsigned int vrr_min)
>>>>>>         return mode;
>>>>>>     }
>>>>>>
>>>>>> +static drmModeModeInfo
>>>>>> +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int
>>>>>> +virtual_refresh_rate) {
>>>>>> +     drmModeModeInfo mode = *igt_output_get_mode(output);
>>>>>> +     uint64_t clock_hz = mode.clock * 1000;
>>>>>> +
>>>>>> +     mode.vtotal = clock_hz / (mode.htotal * virtual_refresh_rate);
>>>>>> +     mode.vrefresh = virtual_refresh_rate;
>>>>>> +
>>>>>> +     return mode;
>>>>>> +}
>>>>>> +
>>>>>>     /* Read min and max vrr range from the connector debugfs. */
>>>>>>     static range_t
>>>>>>     get_vrr_range(data_t *data, igt_output_t *output) @@ -641,6
>>>>>> +659,49 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe,
>>> igt_output_t *output, uint3
>>>>>>                      vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
>>>>>>     }
>>>>>>
>>>>>> +static void
>>>>>> +test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe,
>>>>>> +igt_output_t *output, uint32_t flags) {
>>>>>> +     uint32_t result;
>>>>>> +     unsigned int vrefresh;
>>>>>> +     uint64_t rate[] = {0};
>>>>>> +
>>>>>> +     igt_info("Use HIGH_RR Mode as default\n");
>>>>>> +     kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>>>>>> +
>>>>>> +     prepare_test(data, output, pipe);
>>>>>> +     rate[0] =
>>>>>> + rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
>>>>>> +
>>>>>> +     /*
>>>>>> +      * Sink with DRR and VRR can be in downclock mode so
>>>>>> +      * switch to highest refresh rate mode.
>>>>>> +      */
>>>>>> +     igt_output_override_mode(output, &data-
>>>> switch_modes[HIGH_RR_MODE]);
>>>>>> +     igt_assert(igt_display_try_commit_atomic(&data->display,
>>>>>> + DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
>>>>>> +
>>>>>> +     result = flip_and_measure(data, output, pipe, rate, 1,
>>> TEST_DURATION_NS);
>>>>>> +     igt_assert_f(result > 75,
>>>>>> +                  "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not
>>> reached, result was %u%%\n",
>>>>>> +                  data->switch_modes[HIGH_RR_MODE].vrefresh,
>>>>>> + rate[0], result);
>>>>>> +
>>>>>> +     /* Switch to Virtual RR */
>>>>>> +     for (vrefresh = data->range.min + 10; vrefresh < data->range.max;
>>> vrefresh += 10) {
>>>>>> +             drmModeModeInfo virtual_mode =
>>>>>> + virtual_rr_vrr_range_mode(output, vrefresh);
>>>>>> +
>>>>>> +             igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n",
>>> vrefresh);
>>>>>> +             kmstest_dump_mode(&virtual_mode);
>>>>>> +
>>>>>> +             igt_output_override_mode(output, &virtual_mode);
>>>>>> +
>>>>>> + igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL)
>>>>>> + == 0);
>>>>>> +
>>>>>> +             rate[0] = rate_from_refresh(vrefresh);
>>>>>> +             result = flip_and_measure(data, output, pipe, rate, 1,
>>> TEST_DURATION_NS);
>>>>>> +             igt_assert_f(result > 75,
>>>>>> +                          "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not
>>> reached, result was %u%%\n",
>>>>>> +                          vrefresh, rate[0], result);
>>>>>> +     }
>>>>>> +}
>>>>>> +
>>>>>>     static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t
>>> *output)
>>>>>>     {
>>>>>>         if (vrr_capable(output))
>>>>>> @@ -686,7 +747,7 @@ static bool output_constraint(data_t *data,
>>> igt_output_t *output, uint32_t flags
>>>>>>         igt_output_override_mode(output,
>>>>>> &data->switch_modes[HIGH_RR_MODE]);
>>>>>>
>>>>>>         /* Search for a low refresh rate mode. */
>>>>>> -     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
>>>>>> +     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS |
>>>>>> + TEST_SEAMLESS_VIRTUAL_RR)))
>>>>>
>>>>> Does this virtual RR applicable to eDP only or supports other
>>>>> connector types too? If it is eDP specific [*], then we must add a check for
>>> that.
>>>>>
>>>>> [*]:
>>>>> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_vrr.c#n
>>>>> 660
>>>>>
>>>>> With above comment addressed, this patch is
>>>>> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>>
>>>>> - Bhanu
>>>>>
>>>>>>                 return true;
>>>>>>
>>>>>>         data->switch_modes[LOW_RR_MODE] =
>>>>>> low_rr_mode_with_same_res(output, data->range.min); @@ -841,6
>>> +902,10 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>>>>>>                              "between flip timestamps converges to the requested
>>> rate");
>>>>>>                 igt_subtest_with_dynamic("flip-basic-fastset")
>>>>>>                         run_vrr_test(&data, test_basic,
>>>>>> TEST_FASTSET);
>>>>>> +
>>>>>> +             igt_describe("Test to switch to any custom virtual mode in VRR
>>> range without modeset.");
>>>>>> +             igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>>>>>> +                     run_vrr_test(&data,
>>>>>> + test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>>>>>>         }
>>>>>>
>>>>>>         igt_fixture {
