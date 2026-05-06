Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C207CD3424
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 06:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE0710E4F6;
	Wed,  6 May 2026 06:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UtYDiwOe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B2710E4F6
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 06:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778050655; x=1809586655;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=DYI2kLEzE0CwIHegmevVcx/iGnWaCtJeayBhNVehO4Q=;
 b=UtYDiwOeQvLjICR61kZQv+SfLzx5HLXmB+Ce7nqLzgbtsfQmns76VNsc
 jeFyu6WgVYJefZMyU1Ojxwj4RCQJ6ZrDDOXmunC43//bbB7Q9rqotf1VB
 FbGkgISljnhVbO4Y5BxS9I2yhOoe4BeQmIhgZ93qZnHKLu1bhTySUmlEJ
 nMAblwA68Hf9zNUasTEEy0BuoRDszqKiLwKLgYXdmzYwoKleGQu1L9ECO
 UUcCn9M2JWSQM54ohXxtYHkD3pqvjBx0rmEKVYIqqLnl8YrsD6Sti2LFJ
 AIiYku1CGQO78Y80YKAuVwVz/Xfz7Ortu9GX1n8cE3GtNlkRYSOTuTfiR A==;
X-CSE-ConnectionGUID: EQKEvphUQVCEE26NJ0gobA==
X-CSE-MsgGUID: P4FgupEPRhm7On1ZNhhvHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89552665"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208,217";a="89552665"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 23:57:15 -0700
X-CSE-ConnectionGUID: OV63qSgJQxKODalSA7qt+w==
X-CSE-MsgGUID: 4CzDLb1lRBaf/mlYG20Few==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
 d="scan'208,217";a="266408488"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 23:57:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 23:57:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 23:57:14 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 23:57:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l64AZpczWKKdimk6zpw3IGfVfvCY6OG0/AjlQ0mls9c8oFIusgxN18muiHSDMwoSnCKnggUCMHqmrw1c9WGM4K7jpXAbDZmNwr8i93hgcS3uEttON6t3oMdWyUB/n5UOfT8OcZCh4NJGjZsZRfG55qu6NTSlODhZrBz0uUhpAOxhP/9cTxoVP0EZqzYOqYHDs61dfI8mOz+tUiuukEjSEyQ8M5ROr7dkWUK3IqTo6UHy3Ab9vG20tJA8fn4V8ZYqteFQGAkLAgp63FSzNtOU6GuYcuz1XlqlQ61XykPJR2rQ/bjsagvowCnUhkOIajbX5YI7CIY93jHOwFEz3Pd9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mxh4HTwqBjPJUdqza15JLhiYlS2wIwDJkQQefJk2gA=;
 b=kLyf00L/idrXLBzGLjzHQ+Ccg1SwxKABK89tgQvh73yGgRM52cf/yhb6MHGzBkt4RjU4jB0PeyX6HZigoOpDXjcoHDE2JxrXUQHFKadutD2SJYrxQcOtcWlnB5jgfstrK3hvRrMZW39v+sKf1F/g6ah0I6qgxSlQWRNrTdc43YL6TFtknVVaHeOSu9/3tUxPYBmoQVNXZOCAp4dmSPvP3VroKPdYS23p9kUbD+VFEP8yLczj8QDLmt0aKU0BSkTbFtWSDH05P5zuZtTMyLsPnt6iJ3KvhZKXQ2NXW9IMSVLrP/H3K5MouMkrVlUYRXiulKEPkh5D+1OVtR9B0eYALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 06:57:12 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 06:57:12 +0000
Content-Type: multipart/alternative;
 boundary="------------aPrpbV3ZHbcZq0D8tzkqBffl"
Message-ID: <0753cd82-9c7b-46ec-a9ab-08d980f4d2b7@intel.com>
Date: Wed, 6 May 2026 12:27:04 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/inte?=
 =?UTF-8?Q?l/kms=5Fcdclk=3A_Skip_non-4K_outputs_instead_of_skipping_the_test?=
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>
References: <20260501103634.2360004-1-swati2.sharma@intel.com>
 <177763428205.31645.8753156816482328458@5ab824fced77>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <177763428205.31645.8753156816482328458@5ab824fced77>
X-ClientProxiedBy: MA5P287CA0049.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::12) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c85f26a-7655-4dd1-d69a-08deab3cb2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: Ve3GdjU84U3FaHs9/JOvf0Q9RD199AhcvrgRyh03x5ZqFuPZsKbxRJPNeUHmxuGKE5aMyj5vuscEDVhwS9Tdgy8O+l7FIDgDia3+0ReogbZmyWO8xk+8gUOJs5VCjXZs6NNyI3Ix3JAUU//4W1qoI9UEpysgph/OyTGgCC+qRb0kVQcTBHqb09zsIcrjZ0y7H25KuKsXX3DUs+CJUTZTXRPI+Ab4w167798Bk8nhddBxQ2Q3zaXwyj4zPjJ2BBOFeVHtUapo1ndkIv+rq4a01FpyIPscYItvYGzELXT4Pf8rAreg8EevS85pnQzR788RWzgCJ/g6yZzGLkh/rrq9MGHjsQW5KlMXb9gnMGr3aRy7ZoCK9R8bj57YNhsyvVavPZwjYEYg6TI/t0jwl5lxVqhniLEgN54ucWsuD0vUncgSEufQQb5BMBpwIzpL86j2xmykThJTZmTOtf7dpAp80ScXH79NxWPoVarcHcTH3LjvKstATZwD8gSNuZs5P04F6SbomBOheUMLGQJzyYT8AFKhkJ3+zx8dZNPVyV/RffgiM7nrcqy1/JZqIjXwHm9IK+uuamAqJA6aDmNRQhUBRd6JA8JIJxIxVlu/EwC5wIWMWv0t9W+he4yebkzG8ztwCFVUOx1YJZneIbtW/4RMrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2VOcnFvbVVYZVFtSDRjUTIyMTFqcTJqdjVJQ2lrMldEem5aUGFGTFIxMlYx?=
 =?utf-8?B?akl2MDdCa1dxY3FwdCtOaldyVHJTK0ZPZ3NUMU4rZnNHV0IyNEpCWTRKdlFC?=
 =?utf-8?B?ekdjM25jQkdUMkd6U241VzMxM0g3SVBiaktXbjVzWXVYak5saGk4VlZZOU9Z?=
 =?utf-8?B?M0hxZjRHQkNPNlZXS2RESitMc1FINmRuOGJMTkN5MWlzemJLVDBhcHhSVWJJ?=
 =?utf-8?B?dFNTYUNnS3MxTHFvTGFvZVV2UGFwMzdpbW4wNnFnRHJ1S0FyVnY0QkNyR3BW?=
 =?utf-8?B?OWV0aE01cHZndEliUytRWFc1Ky91TkdFRTdaZjdpM1VuRnBzdUlqbWluL3Nl?=
 =?utf-8?B?dGhNKzQrL2doNVgyTmJod1l6aHFIaDFPZFQyRHVZVGlTUE81cSs5RGRyTjdW?=
 =?utf-8?B?WGczb1NNT0g1Ti9VOG1qaDhCdndNNG12TUV6QktNVTFOMHkxYjg5MUxSblN1?=
 =?utf-8?B?dHBLdW16VVJicFptY0Fad3ZCRDVDS2ZKSWdxeFB6OFozV0NhenFKWlRVUWQ5?=
 =?utf-8?B?RFlLZjF3ZGVoSWg3b0FRQWNDZlVOYjNZUlFOSkk5WWVhTlErcSs0cVJoWERX?=
 =?utf-8?B?dTNDRkNHL0xDS1N6aGY2MCszcXo1MDZZdzVUUnBmcFJmdnVza1FyMDFxZ0Zt?=
 =?utf-8?B?WUZ0enorZExSMDFJcGNSL1JTZk4zcFZmWGkrOTZVc2NQTzdFdFpURDhUcVhL?=
 =?utf-8?B?U3BQSm9RR1duYS9oZFY5SU11NlhVK1pyNlVDcDB6SFN3cTlOTTRBM1ZEdkRE?=
 =?utf-8?B?Ymx2ZGRzaGlRSXBWNjhZUDlKSjlOMlg3M1hQd21DaTVxS0svbktwTVRvVXlz?=
 =?utf-8?B?VEFkMUJNOEtFTkh2TDR0dmJHQXF4RXRGWWZvM3FGaUNMMnNZR3FCSWIxTVNB?=
 =?utf-8?B?eEt3TnFtZ0tQdUdZcGZucE9ndC9zcEc5N2NkMGVKUnBmVUk4WGRINTJPRzBu?=
 =?utf-8?B?NkR4WDE5SmROeHl0WVN1dVpFRi9JKy9LN3pSbWFUeVRWVVdPOGtYOXByREdL?=
 =?utf-8?B?amp5dm5QSTFmbWJONzFiTWordkpuTW5UdHB1V3ByZ1h2RTRSVVBObk1VUU5T?=
 =?utf-8?B?N0VDTGxja2NISWdtUDVJZU8vTkdjOS94Q2wvYlpXL0s4R2NadDdOV25rMC9I?=
 =?utf-8?B?Y1BORXpzS1lRM0xKcTRrTTY3ZUE2ZEpnQlZUT2tha0FCNVRrcW9ROFYyalVN?=
 =?utf-8?B?YS9VUGFEQmp5ODY2VHdOL0JuNDZmV1BXeVJjckVqcGZzZXRtTXAxakEybDVE?=
 =?utf-8?B?VEx4VDVjSXYvS1ZjQWdGNkh0WGdqSGc1MWlIZXV6QTdkLzBPdFlQSjZYa3Z5?=
 =?utf-8?B?MktnaCtHNjl5V1BoTDFOUjFEMDVISStvenpPNUR1TVhjb3o0R0tSUzJtU1pP?=
 =?utf-8?B?cVdiR0liWUFUT21FNk5uL0tIZDVlOHBLTjNNa3lhSUZINExiTzVXbFF0YW1J?=
 =?utf-8?B?ZmtYRW9oVjUvdTlQZk10dXljbzhPSElTKzVJdUNIcmNOMUg2VzBRU01XL1Q5?=
 =?utf-8?B?MnpmSUhieUUwNVYwbE9ndjRlWXlSb1VBZlRManVMaFltVDdwZ2hsSXFWUS9K?=
 =?utf-8?B?V1FndkUwZHJPTmVHUGVjRm84RFdDcm1NNzQxVFVDV0JKY2ZjTlI0MzhGVGp6?=
 =?utf-8?B?dXU1Wm9wT1JRQjkrUk1CMGtVT3I3eVU2SzZvRXhwR3hFaE9qSkpvbnhsWjFT?=
 =?utf-8?B?bmJoOGxLZmlRdHlQeUZUcG8zVTJEN3VhTU9JS05DcGNOaEUrV29CNnhGUG4z?=
 =?utf-8?B?bHRkZWdyc0hoWmZJblJzT203M3o1SjBPZDVqYWVnTHJMUVd5Z3F3TkowMjUr?=
 =?utf-8?B?OVBjU2tXbWxRbStkWFQ4bHZjMDV6c3F3bTFtbGY4Y0xIWU9EcjF0KzNyL2kw?=
 =?utf-8?B?ZDN4emFBNmhVT3dRcDFKUTBkZVM2azRRdTI4TFJuenEzQ3V4WFRZSkkxWlVD?=
 =?utf-8?B?SHM0UEt2QWpScUphbWxZMnlUZTRFQnBiZ0tXeVdnb0Nqdmh4WURhS0FxTFVT?=
 =?utf-8?B?VHFqcHdjZll5MEo1SzFyQkRDRDVtS2dRR3VCVnlqWE5qMHpzRVFRZE82ZXNO?=
 =?utf-8?B?aWc5d2lIT3hacDhHdHhLRWp0QVkwVHF6Ry9BTTdOM0FhNDFtdmRIUHY0cFZS?=
 =?utf-8?B?clZqQ1YxcDJSZVRzaUZWV1VZTS9tZ1BGN0VEZHJ4VG5IYnBKQTBPZHBvaWhx?=
 =?utf-8?B?QXM2ZHkwSHdheUVWcHhiWEtlM0w2SzBNR3VXSEdDekJ0d2Z1ek16N3BjYkFI?=
 =?utf-8?B?V2pQcGxIWlV5b2s3ZVBnQnA5MnNiWHlEeWd6M1gydzFnci9zcG1uVWc0MGkv?=
 =?utf-8?B?ZlZsR0lEKzF2WVFlSWVzRkFVZ1c2ZEhKbnVqbjYyTTJtN24yb3dUYTgrakE3?=
 =?utf-8?Q?cVUXpL3g1wJbCL+g=3D?=
X-Exchange-RoutingPolicyChecked: rys+BqSbLkGsD2kvic1NVlsBnWyaryvJ0TEDg7bmWQ0JLfAHNSEWqSODeLxWw+xlA2nboH3+F2orDhtLkynYoEbI4BHq9kkOl9e1Ht9IAxtMqZQv3+yI4Cdrot9jmtWMsdwiqpjaClPNcgfo2TVCB/4Fxh1rM1U8HL1ul5u1nxjTJyc3c6Aos5xokW1iG6wPjUgJA0K8BtP9N/4d1wiFW0ZV088kfZLChnciYSm3Y0CJglwlUJo9uZdcm5egSc2tqLnXldzG9QSTBYdKisDMNgMVhLU09qRR+Um7zWteC+p2HRzLhURccdzDLIn5zDWa5AqajP/Ul78tTZyXgnf2oQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c85f26a-7655-4dd1-d69a-08deab3cb2c9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 06:57:12.0650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uoa/vOaK1Fkg/KWrv3IC7a3T3lCVVyobrT/P0Po49aWbpkuQI8wELKOHpwCZPXuipVN2JVYPxo3Vl2ByX/L9zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
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

--------------aPrpbV3ZHbcZq0D8tzkqBffl
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Failure is unrelated and re-report not required as these tests are 
anyway not having coverage on shards.

Tested locally, results are as expected.

On 01-05-2026 04:48 pm, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/kms_cdclk: Skip non-4K outputs instead of 
> skipping the test
> *URL:* 	https://patchwork.freedesktop.org/series/165836/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/index.html
>
>
>   CI Bug Log - changes from IGT_8881 -> IGTPW_15090
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_15090 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15090, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/index.html
>
>
>     Participating hosts (41 -> 39)
>
> Additional (1): bat-adls-6
> Missing (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_15090:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@i915_pm_rpm@module-reload:
>       o fi-cfl-8700k: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8881/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html>
>
>
>     Known issues
>
> Here are the changes found in IGTPW_15090 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@dmabuf@all-tests:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@dmabuf@all-tests.html>
>         (i915#15931
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-engines:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>  *
>
>     igt@gem_tiled_pread_basic@basic:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@gem_tiled_pread_basic@basic.html>
>         (i915#15656
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656>)
>  *
>
>     igt@i915_selftest@live:
>
>       o bat-dg2-8: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8881/bat-dg2-8/igt@i915_selftest@live.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-dg2-8/igt@i915_selftest@live.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         +1 other test dmesg-fail
>  *
>
>     igt@intel_hwmon@hwmon-read:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@intel_hwmon@hwmon-read.html>
>         (i915#7707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>         +1 other test skip
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html>
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_psr@psr-primary-mmap-gtt:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +3 other tests skip
>  *
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@prime_vgem@basic-fence-read.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>)
>         +2 other tests skip
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8881 -> IGTPW_15090
>   * Linux: CI_DRM_18388 -> CI_DRM_18391
>
> CI-20190529: 20190529
> CI_DRM_18388: 3ac514cf64f272cc4d5143f4cc28fb18a8aba76d @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> CI_DRM_18391: 89363c11fcc2fcd068a09c06ce1a3aca43bb6bb1 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_15090: 5d95f3e6d2d6cb3bdf12d958cf0c2ac92bdcdd83 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
--------------aPrpbV3ZHbcZq0D8tzkqBffl
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><span data-teams="true">Failure is unrelated and re-report not
        required as these tests are anyway not having coverage on
        shards.</span></p>
    <p><span data-teams="true">Tested locally, results are as expected.</span></p>
    <div class="moz-cite-prefix">On 01-05-2026 04:48 pm, Patchwork
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:177763428205.31645.8753156816482328458@5ab824fced77">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/kms_cdclk: Skip non-4K outputs instead of
              skipping the test</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/165836/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/165836/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_8881 -&gt; IGTPW_15090</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_15090 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_15090, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/index.html</a></p>
      <h2>Participating hosts (41 -&gt; 39)</h2>
      <p>Additional (1): bat-adls-6 <br>
        Missing (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_15090:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@i915_pm_rpm@module-reload:
          <ul>
            <li>fi-cfl-8700k: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8881/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html" moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_15090 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@dmabuf@all-tests:</p>
          <ul>
            <li>bat-adls-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@dmabuf@all-tests.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931" moz-do-not-send="true">i915#15931</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-engines:</p>
          <ul>
            <li>bat-adls-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_pread_basic@basic:</p>
          <ul>
            <li>bat-adls-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@gem_tiled_pread_basic@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656" moz-do-not-send="true">i915#15656</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live:</p>
          <ul>
            <li>bat-dg2-8: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8881/bat-dg2-8/igt@i915_selftest@live.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-dg2-8/igt@i915_selftest@live.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-read:</p>
          <ul>
            <li>bat-adls-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@intel_hwmon@hwmon-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707" moz-do-not-send="true">i915#7707</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
          <ul>
            <li>bat-adls-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>bat-adls-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-load-detect:</p>
          <ul>
            <li>bat-adls-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>bat-adls-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-primary-mmap-gtt:</p>
          <ul>
            <li>bat-adls-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic-clone-single-crtc:</p>
          <ul>
            <li>bat-adls-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-read:</p>
          <ul>
            <li>bat-adls-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15090/bat-adls-6/igt@prime_vgem@basic-fence-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291" moz-do-not-send="true">i915#3291</a>) +2 other tests
              skip</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_8881 -&gt; IGTPW_15090</li>
        <li>Linux: CI_DRM_18388 -&gt; CI_DRM_18391</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_18388: 3ac514cf64f272cc4d5143f4cc28fb18a8aba76d @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        CI_DRM_18391: 89363c11fcc2fcd068a09c06ce1a3aca43bb6bb1 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_15090: 5d95f3e6d2d6cb3bdf12d958cf0c2ac92bdcdd83 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
    </blockquote>
  </body>
</html>

--------------aPrpbV3ZHbcZq0D8tzkqBffl--
