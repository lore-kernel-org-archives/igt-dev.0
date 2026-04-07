Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B00FB5179
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 05:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A36A10E222;
	Tue,  7 Apr 2026 05:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmN20rKD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C130610E222
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 05:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775539805; x=1807075805;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2udbnj93wbmqI6sXzFGKbe+cGzDxx91UTZEHAqKJk+k=;
 b=nmN20rKDSNB+I4dyACS+kqj4T52UeyLqAchkX26jDM8pN1Xth0AnBxsM
 QXKWxXWedizC89vnsk8AwB9YEUak8sE+GzFHqp4oD4oySUj9XkLZNhK28
 KQDVC4TtvIcBquqqmFZl+ST9lLxai1Nx2y/HYquy5kq3bpVK2e+jIOaIm
 fElIJ54s1b8EfgkKR/Qzm/Yfk9Tl8MT2I3GTn7NTZMFGbp8IAfrvHT5Fx
 olsVZL2E0ZL4oPMXbaj52rzOUe9gBYT1KfcGJtnyhs9NbumI2ubyms/6W
 5zQyhm9O4dFmcv2Q/zxtC6nGDCerl7CNW90eKwt8lxB0ZuWmtx07PFxD4 Q==;
X-CSE-ConnectionGUID: YrRdppo8TLCCKapO1lQJKQ==
X-CSE-MsgGUID: kAjleB9STVeuqfqfjREIkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76683959"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76683959"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:30:05 -0700
X-CSE-ConnectionGUID: of4SMOxMQ9WFZCve2juQVA==
X-CSE-MsgGUID: BOp/YX4CThmhHZij98OWFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="258520422"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:30:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 22:30:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 22:30:05 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 22:30:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cq7nojLYahDl+tNjH/clcG8d1CtXgfetxAhgySWT1ESvB6ibwCYJCBFogCMDR7LbUEEZFOhWUqfvZFXGSztfx7dc8OTNepvOr6CTfxR2XUmT/gYCn+aTjLY5rKR9bDv21E55bMHgEYS16yOV7pOLp8J9dBMnv95OLwFx9rMIHXqJL3rOiekzaqxdWXBi1udMQMxTKkafTu2oMAyvTGstOYPS7hbVOhBf43fyzpe+2ZpN03timBMVjZtdem3gBnM8+iR7QG2oSir9c/bNdXJS6DTcSkDQRpiMcgGIdFpQ7+kXbJC9jccQ3Gdq+U4Yv14SZsjU8atSRTBqFIkWM4znBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xs+5f9Ydr793V0MwwovBTCc5WoRBIfOfNwaRTg2oYQo=;
 b=cDC1Iii+38hyCVlN2kjzhfRzBiIGetakmPADpNPdfcIO5Ehdsz5edYfK5uwzAp1xNy5mx8++TjgiX4JfMVrR58nK/VVZc/9F/h3RTqQ7cBdkuKPC4Jf01yVSM/lxOhSp+9fLumeux2qtNiwKBsfRzMf68WIhRmDfZXXqxHbHt6COjFmbkek23kYBOt1V/6QC8rjW6Vj5tUElWiqBvM4pibi0tCBrXmwyfy4f2xtHUq6IJWONnaGcB3eCu1bGmQ9Lfz7dWWIAd62xqqRorn8I3ZEtPwSY8XrbfRiVK/V2+BUy0aTKi0GOMNDoaJ/rr4aDZ22vg/Nu117efzwN2hiEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH0PR11MB5063.namprd11.prod.outlook.com (2603:10b6:510:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 05:30:00 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 05:30:00 +0000
Message-ID: <753ee211-bb5e-4883-85b7-d7e97a5f20dd@intel.com>
Date: Tue, 7 Apr 2026 10:59:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 6/9] tests/intel/xe_madvise: Add
 dontneed-before-exec subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-7-arvind.yadav@intel.com>
 <a0303680-5405-46d4-8cd6-32c96f9e2720@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <a0303680-5405-46d4-8cd6-32c96f9e2720@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0142.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::17) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH0PR11MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: d2472ec0-d0ea-4bf9-3e9d-08de9466b62f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: LuOuUDfeMXplOHCDhnE/o7tzkLTflPIyRNUgHWuQPhDIzDzGCQowiDcPBcJDwtnFhbsiFQWy319gNQ1VaBetoILHy5ndkPlS6SFlUWThoIQWTiQ6HTl4WMAdSzJWubOB6nOZ/xhcHLScvtZsZArpXqSjaDAAGHNslHyXQLUy7gW1lvQ7OKXQpk9e2ijqUZ6bL+2z5eGLDcLKVYX98brCl1G8bSdlkYILNNygLYG9+C5nBbJLEdH83zo1+3nCRPiTMLApbq02JTXF1M7tozbs29ic1OeNFwSVdN8BPhtx1Z1DqX4fS1Odtj7PmcSEmg41pjgUry2wBqLNuH1eHYHCFysbD9Fy90Du/CqGB3yXUxhOY6FKw+zjH839DOdGelRjGPB1Tno1hpUoL7J4R5BuMXGg9eQ68FCJ5IXbaYlz8YxxE6DIXuGiUHVizPXrlrHcEiAQO/aCl/8AeFtWzINm8HH90NrBeE3rKI9N7VKzVSMCudmUvi7FSWOFJHJ0gQOI6d+5nghj87VZbshxABoJNpiNI4vEW5iYs1U4D2DjfdIs4gf7I8SV00uDName+KBoP8QVMQeOSh5VkNmf1nCbzYgIgAdc7npv8exWYwUhU+ivQIPJ0I1/jtRXAshT6wnFovS0aBCAXJVqGrPB34MU1dO/QC9l5v61r2NFxsjKlrjFZP50Nl5IbK4v9LzOaVYlupSST2jZOKIQvmeB0RJAVnMM9c8PsImKMxoXBh7hP34=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STg5T1NWOUlBT0FDZnJ4RmpFOUZwZ2g1WEhpYTJxWDFlMlNRZ0tWS0hBU0Vp?=
 =?utf-8?B?Y2l6R0F0WFNyRVhkL2ZyNHUwcmxENm1GSXNzVTh2RS9RdXorRWRoTUZOYk9Y?=
 =?utf-8?B?R2dPQ0YxRmxXSHRhS2N6TkZyeGpVeG9tc3lZK2JTZ1YvOSs5WW1XTGh4OERY?=
 =?utf-8?B?a3FxRXlYUFYxd25wWk5NbEkxYVlBRXN0NDBLTjE0QUVIMEZvMG5rZWgyQ2ZM?=
 =?utf-8?B?S0dGSzdVYTBLMFBEMGh1aDdKajdLY3pEdTB1cHgraHp0Vnl5TXJrV3E2NGE0?=
 =?utf-8?B?bkVMdlpySElSTSsvQVpUd2daQmRKTS9tM2htS1paT2I4U0pramFqWXN4SUtx?=
 =?utf-8?B?VjV5MFlpYzhiMC8zSEtQOWU5a2dtZEN4ZzZkQThwd2o5b3BmZ0E1SzNFa0p1?=
 =?utf-8?B?dllxYW03Vm1MSGhYOHNKQlB2eklBNENoYjh3ZUcrOCs1bVBFMW5jeGVoSXNS?=
 =?utf-8?B?cFpWOWQ2ZjhXWTUvTlMrVzNSaE1hdXhEajdFc095a3Y2TU9CbEowcnR1Vkpx?=
 =?utf-8?B?WlcyemtRN0RFcVlnNkgxMk9oc0ZEaVp5MmpLcFJ0YXJjK094NGczZHVSVWlI?=
 =?utf-8?B?VnFoenRRRWowTGM1K2VoWFFIbnFHTW9wY2V3ZnFBUHJ2NXB3SDJhYUNRNkVK?=
 =?utf-8?B?WHZvRzJCVDBWc0pDSUJ6aW02VjdTajB5V2c5ZDVMY1MxQlpxL053aFlDSU4v?=
 =?utf-8?B?UWVIVVE5VzlUWnp6bXBPY05SdjkrUWRqVlZwS2RKbjkyMmVYU2dGUzBGOGhM?=
 =?utf-8?B?K0ZTYlQwSXRUODI2OVpsOWFRNmtueFQyd1d5ejcwOW1SRUtvMkREbmUrNkY4?=
 =?utf-8?B?ZDRKZHZseUR2b3RYMXVkM1gwZzRPSGw2MldtZkdKMkNFVGh6TXFhN2pkUkEr?=
 =?utf-8?B?WkJXQmQ3WUdZL29TTXVZVkhlTkp4ZzROK0lrTFBNRys5K1VvWlpVNDUwOUY2?=
 =?utf-8?B?OC8rRTEwNHY1RnRVQUhqRlJxVjd5ZE1jYjNkaEF1YTFTZ1ZLTVN2NGEwZEFR?=
 =?utf-8?B?YU95bGFGMk01YVZTY1VBZnVFTGVUVzFndTZiTVdrWXdOWHpzSDJTV2JsK3hz?=
 =?utf-8?B?Z1ZPVnFsVlphVURKTVN6WEo3azFNSld4VGVva1VOZUFLZGtoMFlGTlhLaGdl?=
 =?utf-8?B?UmNXN05TNlpvcTJrZDVRdFhMa1psam5pQzBxMlI5NWVPaXY3QWdUNktkcmNE?=
 =?utf-8?B?RjBOVHBIdno4bFV0SnNzcmRQN25MU3ZlQ0xjWDI2bXovMitPNW9SQVJwTEtG?=
 =?utf-8?B?YldDZ1AvVGczdjJYSXExZE9ZVW5NcGI4NXVZc0YyV2NmRGNuZDlESTRWVVNl?=
 =?utf-8?B?YnhFUXpZbDVYWjFzWmhuQmxtWnNkMGdqSkxDL1dvVUxtTXJ4dFhLYkxDU2JX?=
 =?utf-8?B?dVgwVU1SSFR6aVcrbmZjODNsdC90NVpDUWtZakkvMklvMStaTndyYVAxOFlx?=
 =?utf-8?B?ejJ1dFJBQmp0aElFaG1zaE02eFVWcGRNK1ptYlB4M0VEajJiNWtDdU9KZDd6?=
 =?utf-8?B?amE1NEl3NDJySGozMG9kZ05JRDgrNGx5VmZodndlN2l0eWk3ak1RMmVCTEdJ?=
 =?utf-8?B?WWpQdmhiQ1ZBMkg5dk92N1ZLUXdJM2J4TFM1d1VqSlNFWWs3TjEzeU5TTHp2?=
 =?utf-8?B?eXIrZklUU1dhT1E3eFJUQTlENXZGM01mdm5URllyd3E0enJTalpmekdIVUh3?=
 =?utf-8?B?L21NMkYxUUVDMEg5ZzJraWxCWGdsTndDd2ROTEdqMDBSUFBPMGRXSVZxUmhk?=
 =?utf-8?B?K09vbHcxZHBnQjVaRmRzbExMUSsrSFJrNW1jNmtDRks5cFJjRGtDeUNNdUdQ?=
 =?utf-8?B?WXVTTXplbHhIbmlBaGg0ck45WlVpb0hFOEU5UGtJK0NDdFIvWDNqaG1GQlZO?=
 =?utf-8?B?TG1WR1JDRGlnenBadmtkeFZNWExwaTVVY2RCVGxuMnhoSjVXNndwUTJTUjcz?=
 =?utf-8?B?dzBQNk5VSU51QitFY0RONzJueUIrWjhYVmFxUGZmZ1JxUnBYczNLclovQXpz?=
 =?utf-8?B?OGx4RWtVbWQ3a0JXR2w0RWEwRlVmZ2NtTXVBbi9iZFJaMHRiOFpHd0tsMFBT?=
 =?utf-8?B?Qjk4Q04xaHM0Sjh3VGZKSXZ5RlZOOFFQc3gwemcrTGxGNWQySHgxQWowNHpx?=
 =?utf-8?B?QmkyNCtSVW1xOGs4T1h0enM2WkFmU21hRU1xUlRvYzN5SElSdWpoYThKU0s1?=
 =?utf-8?B?cDAyV25lM2lVQ2xuQ2U0dnJNM0JWcC9NNTBSUXltNGFnUU9GVnFpTDQ5anli?=
 =?utf-8?B?aHliU2htS1dxSE5WYkZrc0M0M0xhMk5pQTUxSlN1VVUyUHhpQWVqd0hyMVlw?=
 =?utf-8?B?MVVoNXFqWVFhYlFHTWVtRXFvVGovZUJ5U2RrclR2LzNFWjhYYnIwdz09?=
X-Exchange-RoutingPolicyChecked: rckevxxnJEaSzV6zKTulbmzB43vJabb920vuECqX9ZC4vb6Ls+rnjJ3k5lxfvSz97CgIwSAYHOuKVI1TlDCU94dopq7dB1Y7s4j2gTZ4Q6BwvV/q0VKK6dz/aRiaRlIbftVPCS6o4q3p7mLUOUL8lp9vrY1sTbx1jWLkdHqdwPgzL5ygqt0yxqpNEQP3Z97MvsJ0ItqgzWq0d1GY4ywlqfMSSu5ySK7uV3Efx2DsxytKV62ijG+Y1I0wz4ZzIoesohcm3tydu8qs7ZqsmvSFAv6FD7wmy59UYDoRCsde7sG4c416aig73Ks2wuTKPHgLyWnW50vCGF6p47UxpMzR+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2472ec0-d0ea-4bf9-3e9d-08de9466b62f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 05:30:00.1553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpKJsxNlhk4cspHd/0ktDZcfnJq8okih/AwwMNOvTKmw1AqlY7VTG6h5W4PNBhNe4uy7i/zw1Cd2mTspmxBDFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5063
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


On 06-04-2026 22:18, Sharma, Nishit wrote:
>
> On 3/25/2026 6:14 PM, Arvind Yadav wrote:
>> This test validates GPU execution behavior when a data BO is purged
>> before submission. The test creates a batch that writes to a data BO,
>> purges the data BO (while keeping the batch BO valid to avoid GPU
>> reset), then submits for execution. With VM_CREATE_FLAG_SCRATCH_PAGE,
>> the GPU write may succeed by landing on scratch memory instead of the
>> purged BO, demonstrating graceful handling of purged memory during
>> GPU operations.
>>
>> v4:
>>    - Added proper resource cleanup before calling igt_skip(). (Nishit)
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 148 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 148 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
>> index 9a157de1d..d126db9ed 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -27,7 +27,11 @@ static bool xe_has_purgeable_support(int fd)
>>     /* Purgeable test constants */
>>   #define PURGEABLE_ADDR        0x1a0000
>> +#define PURGEABLE_BATCH_ADDR    0x3c0000
>>   #define PURGEABLE_BO_SIZE    4096
>> +#define PURGEABLE_FENCE_VAL    0xbeef
>> +#define PURGEABLE_TEST_PATTERN    0xc0ffee
>> +#define PURGEABLE_DEAD_PATTERN    0xdead
>>     /**
>>    * trigger_memory_pressure - Fill VRAM/RAM + 50% to force purgeable 
>> reclaim
>> @@ -206,6 +210,62 @@ static void test_purged_mmap_blocked(int fd)
>>       xe_vm_destroy(fd, vm);
>>   }
>>   +/**
>> + * purgeable_setup_batch_and_data - Setup VM with batch and data BOs 
>> for GPU exec
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bind_engine: Output bind engine handle
>> + * @batch_bo: Output batch BO handle
>> + * @data_bo: Output data BO handle
>> + * @batch: Output batch buffer pointer
>> + * @data: Output data buffer pointer
>> + * @batch_addr: Batch virtual address
>> + * @data_addr: Data virtual address
>> + * @batch_size: Batch buffer size
>> + * @data_size: Data buffer size
>> + *
>> + * Helper to create VM, bind engine, batch and data BOs, and bind them.
>> + */
>> +static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
>> +                       uint32_t *bind_engine,
>> +                       uint32_t *batch_bo,
>> +                       uint32_t *data_bo,
>> +                       uint32_t **batch,
>> +                       uint32_t **data,
>> +                       uint64_t batch_addr,
>> +                       uint64_t data_addr,
>> +                       size_t batch_size,
>> +                       size_t data_size)
>> +{
>> +    struct drm_xe_sync sync = {
>> +        .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +        .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +        .timeline_value = PURGEABLE_FENCE_VAL,
>> +    };
>> +    uint64_t vm_sync = 0;
>> +
>> +    *vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
>> +    *bind_engine = xe_bind_exec_queue_create(fd, *vm, 0);
>> +
>> +    /* Create and bind batch BO */
>> +    *batch_bo = xe_bo_create(fd, *vm, batch_size, 
>> vram_if_possible(fd, 0),
>> +                 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +    *batch = xe_bo_map(fd, *batch_bo, batch_size);
>> +
>> +    sync.addr = to_user_pointer(&vm_sync);
>> +    xe_vm_bind_async(fd, *vm, *bind_engine, *batch_bo, 0, 
>> batch_addr, batch_size, &sync, 1);
>> +    xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
>> +
>> +    /* Create and bind data BO */
>> +    *data_bo = xe_bo_create(fd, *vm, data_size, vram_if_possible(fd, 
>> 0),
>> +                DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +    *data = xe_bo_map(fd, *data_bo, data_size);
>> +
>> +    vm_sync = 0;
>> +    xe_vm_bind_async(fd, *vm, *bind_engine, *data_bo, 0, data_addr, 
>> data_size, &sync, 1);
>> +    xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
>> +}
>> +
>>   /**
>>    * SUBTEST: dontneed-before-mmap
>>    * Description: Mark BO as DONTNEED before mmap, verify mmap() 
>> fails with -EBUSY
>> @@ -302,6 +362,88 @@ static void test_dontneed_after_mmap(int fd)
>>       xe_vm_destroy(fd, vm);
>>   }
>>   +/**
>> + * SUBTEST: dontneed-before-exec
>> + * Description: Mark BO as DONTNEED before GPU exec, verify GPU 
>> behavior with SCRATCH_PAGE
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_exec(int fd, struct 
>> drm_xe_engine_class_instance *hwe)
>> +{
>> +    uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>> +    uint64_t data_addr = PURGEABLE_ADDR;
>> +    uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>> +    size_t data_size = PURGEABLE_BO_SIZE;
>> +    size_t batch_size = PURGEABLE_BO_SIZE;
>> +    struct drm_xe_sync sync[1] = {
>> +        { .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +          .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +          .timeline_value = PURGEABLE_FENCE_VAL },
>> +    };
>> +    struct drm_xe_exec exec = {
>> +        .num_batch_buffer = 1,
>> +        .num_syncs = 1,
>> +        .syncs = to_user_pointer(sync),
>> +    };
>> +    uint32_t *data, *batch;
>> +    uint64_t vm_sync = 0;
>> +    int b, ret;
>> +
>> +    purgeable_setup_batch_and_data(fd, &vm, &bind_engine, &batch_bo,
>> +                       &bo, &batch, &data, batch_addr,
>> +                       data_addr, batch_size, data_size);
>> +
>> +    /* Prepare batch */
>> +    b = 0;
>> +    batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +    batch[b++] = data_addr;
>> +    batch[b++] = data_addr >> 32;
>> +    batch[b++] = PURGEABLE_DEAD_PATTERN;
>> +    batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +    /* Phase 1: Purge data BO, batch BO still valid */
>> +    if (!purgeable_mark_and_verify_purged(fd, vm, data_addr, 
>> data_size)) {
> Same comment as in patch-4/9.


Fixed — purgeable_mark_and_verify_purged() now handles retained == 0 
from DONTNEED as already-purged success

>> +        munmap(data, data_size);
>> +        munmap(batch, batch_size);
>> +        gem_close(fd, bo);
>> +        gem_close(fd, batch_bo);
>> +        xe_exec_queue_destroy(fd, bind_engine);
>> +        xe_vm_destroy(fd, vm);
>> +        igt_skip("Unable to induce purge on this platform/config");
>> +    }
>> +
>> +    exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>> +    exec.exec_queue_id = exec_queue;
>> +    exec.address = batch_addr;
>> +
>> +    vm_sync = 0;
>> +    sync[0].addr = to_user_pointer(&vm_sync);
>> +
>> +    /*
>> +     * VM has SCRATCH_PAGE — exec may succeed with the GPU write
>> +     * landing on scratch instead of the purged data BO.
>> +     */
>> +    ret = __xe_exec(fd, &exec);
> You can use xe_exec(fd, &exec) which is internally calling __xe_exec() 
> and after use xe_wait_fence()


We can't use xe_exec() here,  the data BO has been purged, so exec may 
legitimately fail. xe_exec() asserts success internally, which would 
cause a false test failure. We need __xe_exec() to handle both outcomes: 
success (GPU write lands on scratch page) or failure (exec rejected for 
purged BO).


Thanks,
Arvind

>> +    if (ret == 0) {
>> +        int64_t timeout = NSEC_PER_SEC;
>> +
>> +        __xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL,
>> +                 exec_queue, &timeout);
>> +    }
>> +
>> +    /*
>> +     * Don't purge the batch BO — GPU would fetch zeroed scratch
>> +     * instructions and trigger an engine reset.
>> +     */
>> +
>> +    munmap(data, data_size);
>> +    munmap(batch, batch_size);
>> +    gem_close(fd, bo);
>> +    gem_close(fd, batch_bo);
>> +    xe_exec_queue_destroy(fd, bind_engine);
>> +    xe_exec_queue_destroy(fd, exec_queue);
>> +    xe_vm_destroy(fd, vm);
>> +}
>> +
>>   int igt_main()
>>   {
>>       struct drm_xe_engine_class_instance *hwe;
>> @@ -332,6 +474,12 @@ int igt_main()
>>               break;
>>           }
>>   +    igt_subtest("dontneed-before-exec")
>> +        xe_for_each_engine(fd, hwe) {
>> +            test_dontneed_before_exec(fd, hwe);
>> +            break;
>> +        }
>> +
>>       igt_fixture() {
>>           xe_device_put(fd);
>>           drm_close_driver(fd);
