Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0F6D3CC9F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 08:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FAF10E18D;
	Thu, 15 Jan 2026 08:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEyXjFzK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FA010E18D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768465485; x=1800001485;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GmtdulQqVT3MidtRPAewk1FWkxXXbimo+l1xzzaCFEg=;
 b=iEyXjFzK9uGrdrMse4iHomiVZKYfUkXCRubB/ISw05YVXS5lcoYCLHun
 2vvv3KYoeeQGqV2KQ9fqQoZQuz+VM1njuTLEmtczuM2e5b+ZXwG/JlKZU
 U0DTJbG1x4H3vASM0owwQD62n7KJyGfZHXioxaBLRsSMv/HasZRErGBDJ
 pThRCPZsgNJu4FFxZyV6J5utRaoAcV4VLxahgwrlz6ZFOjX3AgBtMODCa
 32njD93bdEpYZEe8jfP4exxT0Uh2H8kQW2K52vYAnfcuMQf2vsRGFc0oL
 ybHApzKdisUbL6AN1jBNuGkNJNyZnP6yscNlpWfAjfE/MqwLVsN+1+C05 Q==;
X-CSE-ConnectionGUID: nPwtvm1oTviXvOCPQrajJQ==
X-CSE-MsgGUID: E32j4qClR3+uqQfk3S5aOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80489017"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="80489017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:24:45 -0800
X-CSE-ConnectionGUID: nclpAZsMSmqNEGEIlYYzHA==
X-CSE-MsgGUID: kN6WD0bMSUWEGQ6psHMaAw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:24:45 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 00:24:44 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 00:24:44 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 00:24:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d20CTKy22y0z+JPrDHmQfqdCOwnqeAuX3gxHz3s4G10rr6u/IL436glHoDqqgNqJJDq5EzpK2OvV9rPkj5vc6XCN61aJItjM2PBl2cjV1OXym/zfhU3hCLebL6fClMvOzR/aAyqVv75eIOqB1dtmleOf/uOO/UeeqwF4CrxYeBh/as3YyKrnuqPx4JL8fR5HWwFplukKoEyDcVfXA5zM/Y21dgmB/JWGRDo7NhOLHEngRH8KMiZWGMmx0/SijfHcQbK87bPP2u1di+t5fVGaes8mA4EIBY3r7mtGWuS8hLf3K1PIhFJCXxhqGsUy9miLw03AVExvCD1Yp0AL3xazyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg+sRMQhuh55qSwNDlknacdC3+trVppr6WDrGLSNrwg=;
 b=OWwA8FexyYJyVl1mAEJbzZrHPLdVTqorEJHURWROOU+H7tarkDU4pfNIDTu4Sd2klbpfejs5DK+RVmlNuJiwbH0N+8rnH3lljF2bZ+bZ2O+pF4I4Vl7G9ub1K+4fhOKrZ+DAwg6DH8NoxtkV0fQbIscujAhvNCgbzEOjtofFoNk7sHvJKyojuDaTu5uv3JzT4UUdfRfxcQG9YU1e9esCaHxw3pIvX8WmPpgqCr1nb7cs9Mqfcs0tZEKZ+MQIZxojQkEhitE4/vGY44zTT0LfUJYPIasKOqP9OwglOh95EGSTQDybku+FZn56mxQTVAqnJEUN/gJ2ESKbWk9KBsFW7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 08:24:39 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 08:24:39 +0000
Message-ID: <1ff66b62-577b-4c25-b09a-c04d0073efdf@intel.com>
Date: Thu, 15 Jan 2026 09:24:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 06/10] lib/xe/xe_sriov_admin: Add SR-IOV admin
 sysfs accessors
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
 <20251125102312.43142-7-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251125102312.43142-7-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0128.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::12) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 732ca80a-9fd9-45d9-d547-08de540f8679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmZGMS9kNXYrMldXRTdCY0VsbzdUNU4ycVZEUkh1NzlVZDVrSWVZVjZVRjVV?=
 =?utf-8?B?NTUwSzN0TktTTjhjSzVvYnRDaWtadTJ3UUtGblg1RjBKY0tuVmNOR3NFbVR6?=
 =?utf-8?B?YXE3eCthZ0xPQjFJVU1NVVVyYTZaZ3hQVmFacWtkTllKS3dsZnN5SC9UNnAx?=
 =?utf-8?B?NFlvYyt2U2tlYjdSUk80b3BqZk5tS0gvOHNXS3RVYkQzb2JZMEY5Sm1VUkNw?=
 =?utf-8?B?c0FYYjZsdW5rUWZzMUtMZEZHVjhKZE1qOWpndmVQVXlncXg4RTNxOHVkNmow?=
 =?utf-8?B?b1dGZnpOR1NUU0p2MFlLeDFRRW9UL3BmUlNPWW51UGdxbTcxRVh4OFdvb1lW?=
 =?utf-8?B?ZVdJVlJ0Q09Wd0JrRkxGQXVYRFJiQkxRYWNIazdiR01SV0YrNTA5VXg2czRy?=
 =?utf-8?B?eWRtR1FndlV4aXJmcStqWUNZYWFhc0pxY3A2WUhqUHdmMndlT3FRb3Y3YXZl?=
 =?utf-8?B?Nml5M3BtQnFqMCs0MHlEMjlLMVJqaVJuTHdDMkhRTW9lM2JWS0hpcVZBb1lY?=
 =?utf-8?B?K0dJSzVBVW1pL09xRHBPTkRoNzI1YXlQUWJZOU05SStsME0xODVuTnd6TVZp?=
 =?utf-8?B?d1g2bjQ0cEZZbFF1VFd4S2ZiMjV1ajNRR1dpaDY1ZHFMdzNBN0twN0g1a2Nr?=
 =?utf-8?B?WXB0M3c3Mk1xVUtUYmZOcTh5bUhEUkFmR1Qza3NMMFNlYWdFTW8wWWE4dTFl?=
 =?utf-8?B?dW8rYjRVYUhNemFXeDlFSDFtMlpOV3Q4eitYNXBDYjlINXRCTzd2VDZocGZz?=
 =?utf-8?B?R0tTdEptRDRBL3pTZi9ZaFF1MnZjOWVPZGdOUzlHdXlKam9LSTJFbjdrTnRv?=
 =?utf-8?B?aWtlWGxta3pwTFVVUTJsMzhqcEtuV2hPNHljTDZsNHpIQk1oRnhER2NoZzBL?=
 =?utf-8?B?c0NrbCt5cmxTajM5Z21HK2dMTUk5Ukh6aU04cy90U0N6RExGZ0hJVXc5emVi?=
 =?utf-8?B?RG0vbFpjTCtBc3J4MzB0MDYzYzg0K2hsYjl3MG5qaHl0OW5OamhHZWxGcDQ3?=
 =?utf-8?B?MzRXSHRkOFd3cVZHV1BwVGFoR3BXWDFiTXJURDVLQkh6cXhFZVNCZHY1Yjhi?=
 =?utf-8?B?YUtuTWp5YVlGOG5BdWdjNmt0MFRlR2IwWXFmczFTWEVNengyeTJYYnVEQUZw?=
 =?utf-8?B?M2YvT0Q2QnZjTmVMRzNDZE92RTVsMExjUWJ1R0gxZkdHVUFHS2lhMkxiNWFi?=
 =?utf-8?B?SitORlhQMG9pUXpYaWJpMldTem8rbUdnRjR2OHhwbnY4Ry9TREIvcVlySE9u?=
 =?utf-8?B?Ry9DcEFWYU9kYTl2bWhad3RZYjNvMDFFVEZQRzlrcWkyck91bHlGRUt1b25L?=
 =?utf-8?B?b0ZOeHIwY1J5T1I3Uzl5Y3l4blVvazAvQVpwdndZbmdtNnBlc0hvWU1SMzhQ?=
 =?utf-8?B?aFlvbFFGck9lTHlJRUhqTVJpWlpQaUpKaWFRak13V0pNNlJLdW1xbW1OSEZl?=
 =?utf-8?B?Y3ZBOXB6dW5TYzRNKzFLQkl6Y3ZoTUJMb1NPVmUrUXFKQndEZVY4U09CMERF?=
 =?utf-8?B?NDMzYTFaZEZhSGlNNjN5V3V2YWFmTk8zVTNWcVhxMWFzQ3dmbllaN2J4MWo2?=
 =?utf-8?B?a3NzckFQdmNwSmMyS0pEZm05YkNYclNjZWhPMUdLTms5M3RQbUtNVUVWaXFi?=
 =?utf-8?B?WnlvdS9DeUJscU9jUWhndkNabjI1aXdKRUVweDBPenNhcThRQnV3b2NSeVds?=
 =?utf-8?B?VnowV1BuWVhITTU3LzlvTWhMYndTOXVXZ3ZwS0RiSTZsWTlZdGRvN3NualN1?=
 =?utf-8?B?eHJBZDVFSWI0WVJKeVFRZGh5Q3IrbDd2M1VFZE0vVWpqdGR5RGxHQm9Nellm?=
 =?utf-8?B?SklMdnV0M1hwZWJYemN6QVJXaDgyNGlSOU84RDk0dXpBUnJKUzUzOU84UnJC?=
 =?utf-8?B?aEIwWkl2TnJ4RTJ5RVloTkFES0Z6MTVJUExVWnJCekxpMnAxS3RFS3FPV0Z1?=
 =?utf-8?B?OEFHNitCYTB1ZGtDVHJ2V1ZWT2tFa0phTEhYM0d6WGUxN1QweTdkNHRTT1lS?=
 =?utf-8?B?eXM1NjZUSCs1ZXV4OHBlWHM2SnpETUd0elJ3M0JNNnNDcjB0d0JJOE8rMmdl?=
 =?utf-8?B?R1hvbjdwT0M1ZGZuWmtWa1k0aEtzQ1kvMjdWdjgxaldrV3c0UVJnK1JkaHhx?=
 =?utf-8?Q?VBpUa+nhL8RSHaJgYirYfGPdb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFl6QkFQOTlJRkt6b0J1SitZLzZvRmZzSTZ3eXFJYndoaUg4Ym0wS3prUDNs?=
 =?utf-8?B?N001azZyVFc1RFRqU0VJck1RU3I0T1gzclVTVWNqMGRMUG5Eam1SYTJyZm5O?=
 =?utf-8?B?UGh2OVY5K1lpY2ZMZ2JXOGJzTXhHakZzbjROZmJQR3dHV1dDdWVxYTI2REg3?=
 =?utf-8?B?aFJNemRRbm9od2VPbGpyMUxGTVZ5OUdBN0I4ckFSZDZFWDJFKzVpcGQ3SlFB?=
 =?utf-8?B?eGhwSzBCRU93WVo2ZnlHYzB4SDE0dUVVYkpkSTFUOFNKMDRIU0lHNW5wZzB6?=
 =?utf-8?B?QzAwR1lJdkl3YkE4N29QTFM4eXh6SFBEdlByWXdXY2hkOU00QVBlcTEzbU1m?=
 =?utf-8?B?dC8reVJWN05kZmh1VVNzTzRUSld0VXJGaGRMdUo2c29nN2ZhNmh6V0VhcnpZ?=
 =?utf-8?B?RWI2dllHZStVYkZGVDJnaFlUbTVTaEphWkxtMnhvRitiSkZQNXZCWU1sNGN5?=
 =?utf-8?B?RW85MkJxWXV4WWQvTjVjeDJ4VkMzdkhsemxPbWRBdzdYbFhBaDI2VG4zQ1Zs?=
 =?utf-8?B?dEcyNU95YnZyVlhaRnY3VWJRemdwRXVKdVdsTHF5QVV4UTdVek1tMCtJNk5s?=
 =?utf-8?B?REozRFZnaFI1TklSMWhEQmp4cEc4TmRRNFBxNlYwR1pIbjBOVjBQVFBCQXoy?=
 =?utf-8?B?bTJvbkY3Y1FvZjgzelp5bkg5T1k5RXJ2bTRyVHFIRnUwd05sZEN3WHNDd2hR?=
 =?utf-8?B?VEQxRFZSZUdxbHVlMnNIU0UzSmtYVVppN281U0w0MGRTY2Irend1UU5tOXNw?=
 =?utf-8?B?bkJnTEJVMlpHOUdCQ1ZtWUtGS0hsT1UyN1NGbGxHVWlpVG1DTWdQeEFITUFz?=
 =?utf-8?B?R3k2QjJ1RlBRRi8xVGVwdHYvR3c5OGlqOCtFWUxKRHZocjFOUVIzMUhINWd0?=
 =?utf-8?B?VDN4djJTVzRKcERXNlpkVFBobnBCK2U5eG1Nak1uVWxkKzZaQnBadkZvM3Rw?=
 =?utf-8?B?NFJRM3pLRjlyZmpYSGRsQmtudGFJZXEzeHJ0U09FNmhoRWU0aTMrQktpdk5o?=
 =?utf-8?B?RmNkUzVXSitHVDE1bWlUUkNQR1ZXR0N6TmdnOG5xY001UlU0MTJXemNRTU93?=
 =?utf-8?B?bHJMK3FSc3k2cFJ3TmNoVHpOZzJqNG4yZnVMMWdXWVBjOHRld0FUOFZlSElY?=
 =?utf-8?B?VW54Nkc3THhQQnNhRmpBd2Z1ekNWWkNwYmJ6OWc5ckp1Ni9yTVQvWnBKNEtG?=
 =?utf-8?B?V0pKcGFXZ2JNTlR3NlE5T1l5ZFVDekZkRGdsQjhJVDFRcHpja3lzNzBWUnV3?=
 =?utf-8?B?M0E0cTNJNkdhMlNLZW5UN0ZOd2tpWE9VYU5XKzc5MGVTcWF4WTRtOGRGMkdO?=
 =?utf-8?B?NnJVZFBhcVByOTQyemtEb0JhQnAxVS9rcktWbFhBVi9rRG93bW9wM3MwRXM5?=
 =?utf-8?B?MHdVVkJmbXQ0bWNNVUxCQmJqZUgxcFE0OWF3MHB2NWNCalBUTlFmZy9Ubm1m?=
 =?utf-8?B?cHlNNGoxY2RGL2phaGVYN2hhaVFaVzV5cUtHNzNNUUx3UFRYYXBscUkyTVZT?=
 =?utf-8?B?NDExaXYyQWkyNVhtWnFjYTNQdjNUa2hXaEZhQjlvdVhLY3J4R1lQZllyTlZF?=
 =?utf-8?B?aDR5UWZiY2JVVE5pYWx4cjlyaXhhaEdPUHg4T2paMjhxZHhCZUw2aVVUTlM2?=
 =?utf-8?B?Vk1wTzl3Wk8vOVJBM3BsOHZ6VHZPKzgvTnlnN3cwa3pTTUJjWC9iTnZXZnhu?=
 =?utf-8?B?NEpNdkFLenpKckgzdjBFNVBqRTgxWVU2MEdIYUtQcmhUVEpwSm1tcmZVUnI0?=
 =?utf-8?B?SW5lOTF0RnJaU1o1eTl5cU1WTnRHMjlKU1NyWDhWMkZRZHV0NTVnQ3dyelRR?=
 =?utf-8?B?emwwMFYzaXFyN2pFalBid2dyQUplNWYvNFJLU1EzM3k3TE44ODcxYVZRcXV3?=
 =?utf-8?B?Q1UyMlZHd29LaE9CeDQ5VlQzbEVIbG44Nk5DWVkzdzFRSkdJVVd5RE1Yd05Z?=
 =?utf-8?B?OElac0V0cjJTNnZWaEpFZjArbytraGtKOTVUcFZRY2FZaHhOc0VSZDFKY0pN?=
 =?utf-8?B?d3o0YnVRWUxqZ25wYVE2MXIzNkdxVHVLVmd3U2VxcDVxSC91NXlReHFkbmlO?=
 =?utf-8?B?SnpOU3lqa1luNldDVlJ3K0VEWTNIUUFaYmtGTFdBWk9JRzVHZ0trelczWS9R?=
 =?utf-8?B?WmdpWDJ1T0xTR0ROWStvbWRZOFR5aVMyRzVqeE5tM3Q0ZERVYjVqRUtRN1o5?=
 =?utf-8?B?bjQ0aTJVYjNlY0I3bWZRNTVYck43SnZZM1BTNUpzWitob3FIanBSbGhkTmNK?=
 =?utf-8?B?cGx5Y1NWZE1kZmY4eGdHSTdyTlhJN1RvNnJ2eVZWUlFIRXJKZUMxR1JkYlZu?=
 =?utf-8?B?MGJXZzM4dURaY1B0alp5aStYajdweVVuWjRQdXBiS1JzbXJadEdFZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 732ca80a-9fd9-45d9-d547-08de540f8679
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:24:39.2536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekTkz5wdRTbQgOzwF2l+Jz2CShjPTMwQkdb4N+rDKtR0WMV9SyKbi3xLut5DeTvUjuLyn30lH9e5/moH9ybAPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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


On 11/25/2025 11:23, Marcin Bernatowicz wrote:
> Reflect recent kernel changes and expose SR-IOV admin sysfs helpers for
> scheduling control. Add per-VF and bulk accessors for execution quantum,
> preemption timeout, scheduling priority, VF stop and restoring defaults.
>
> Link: https://lore.kernel.org/intel-xe/20251030222348.186658-1-michal.wajdeczko@intel.com/
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   lib/meson.build         |   1 +
>   lib/xe/xe_sriov_admin.c | 623 ++++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_admin.h |  60 ++++
>   3 files changed, 684 insertions(+)
>   create mode 100644 lib/xe/xe_sriov_admin.c
>   create mode 100644 lib/xe/xe_sriov_admin.h
>
> diff --git a/lib/meson.build b/lib/meson.build
> index 604ffd782..3dec593b3 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -126,6 +126,7 @@ lib_sources = [
>   	'xe/xe_mmio.c',
>   	'xe/xe_query.c',
>   	'xe/xe_spin.c',
> +	'xe/xe_sriov_admin.c',
>   	'xe/xe_sriov_debugfs.c',
>   	'xe/xe_sriov_provisioning.c',
>   	'xe/xe_util.c',
> diff --git a/lib/xe/xe_sriov_admin.c b/lib/xe/xe_sriov_admin.c
> new file mode 100644
> index 000000000..489dbec5c
> --- /dev/null
> +++ b/lib/xe/xe_sriov_admin.c
> @@ -0,0 +1,623 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2025 Intel Corporation. All rights reserved.
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include "igt.h"
> +#include "igt_sriov_device.h"
> +#include "igt_sysfs.h"
> +#include "igt_sysfs_choice.h"
> +#include "xe_sriov_admin.h"
> +
> +static const char SRIOV_ADMIN[] = "device/sriov_admin";
> +
> +static int fmt_profile_rel_path(char *buf, size_t sz, unsigned int vf_num,
> +				const char *attr)
> +{
> +	igt_assert(buf && attr && sz);
> +
> +	return snprintf(buf, sz, "%s/%s/%s", SRIOV_ADMIN, igt_sriov_func_str(vf_num), attr);
> +}
> +
> +static int fmt_bulk_rel_path(char *buf, size_t sz, const char *attr)
> +{
> +	igt_assert(buf && attr && sz);
> +
> +	return snprintf(buf, sz, "%s/.bulk_profile/%s", SRIOV_ADMIN, attr);
> +}
> +
> +static int ret_from_printf(int ret)
> +{
> +	return ret > 0 ? 0 : ret;
> +}
> +
> +static int ret_from_scanf_items(int ret, int want_items)
> +{
> +	/* igt_sysfs_scanf: returns number of assigned items, or <0 on -errno */
> +	if (ret < 0)
> +		return ret;
> +	return (ret == want_items) ? 0 : -EIO;
> +}
> +
> +/**
> + * xe_sriov_admin_is_present - Check if SR-IOV admin sysfs interface is available
> + * @pf_fd: PF device file descriptor.
> + *
> + * Returns: true if the PF exposes the SR-IOV admin tree, false otherwise.
> + */
> +bool xe_sriov_admin_is_present(int pf_fd)
> +{
> +	int sysfs;
> +	bool ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return -1;
> +
> +	ret = igt_sysfs_has_attr(sysfs, SRIOV_ADMIN);
> +	close(sysfs);
> +	return ret;
> +}
> +
> +/**
> + * __xe_sriov_profile_set_exec_quantum_ms - Set execution quantum for a VF
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @eq_ms:   Execution quantum in milliseconds.
> + *
> + * Writes the new execution quantum to sysfs.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_profile_set_exec_quantum_ms(int pf_fd, unsigned int vf_num,
> +					   uint32_t eq_ms)
> +{
> +	char path[PATH_MAX];
> +	int sysfs;
> +	bool ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return -1;

Return sysfs. Probably igt_sysfs_open() should return more meaningful 
error, but it's something for another series.

> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num, "profile/exec_quantum_ms");
> +

It doesn't seem that these new lines are needed. Please check get() 
counterpart.

> +	ret = igt_sysfs_printf(sysfs, path, "%u", eq_ms);
> +
> +	close(sysfs);
> +
> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * xe_sriov_profile_set_exec_quantum_ms - Assert wrapper for setting VF execution quantum
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @eq_ms:   Execution quantum in milliseconds.
> + *
> + * Calls __xe_sriov_profile_set_exec_quantum_ms() and asserts on error.
> + */
> +void xe_sriov_profile_set_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t eq_ms)
> +{
> +	igt_assert_eq(0, __xe_sriov_profile_set_exec_quantum_ms(pf_fd, vf_num,

No need to break the line.

> +								eq_ms));
> +}
> +
> +/**
> + * __xe_sriov_profile_get_exec_quantum_ms - Read execution quantum for a VF
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @eq_ms:   Output pointer for the execution quantum (ms).
> + *
> + * Reads current VF execution quantum from sysfs.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_profile_get_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t *eq_ms)
> +{
> +	char path[PATH_MAX];
> +	unsigned int val = 0;
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num, "profile/exec_quantum_ms");
> +	ret = igt_sysfs_scanf(sysfs, path, "%u", &val);
> +	close(sysfs);
> +
> +	ret = ret_from_scanf_items(ret, 1);
> +	if (ret)
> +		return ret;
> +
> +	*eq_ms = val;
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_profile_get_exec_quantum_ms - Assert wrapper for reading VF execution quantum
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + *
> + * Returns: execution quantum (ms); asserts on error.
> + */
> +uint32_t xe_sriov_profile_get_exec_quantum_ms(int pf_fd, unsigned int vf_num)
> +{
> +	uint32_t v = 0;
> +
> +	igt_assert_eq(0,

No need to break the line?

> +		      __xe_sriov_profile_get_exec_quantum_ms(pf_fd, vf_num, &v));
> +	return v;
> +}
> +
> +/**
> + * __xe_sriov_profile_set_preempt_timeout_us - Set preemption timeout for a VF
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @pt_us:   Preemption timeout in microseconds.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_profile_set_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t pt_us)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num, "profile/preempt_timeout_us");
> +	ret = igt_sysfs_printf(sysfs, path, "%u", pt_us);
> +	close(sysfs);

New line

> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * xe_sriov_profile_set_preempt_timeout_us - Assert wrapper for setting VF preemption timeout
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @pt_us:   Preemption timeout in microseconds.
> + */
> +void xe_sriov_profile_set_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t pt_us)
> +{
> +	igt_assert_eq(0, __xe_sriov_profile_set_preempt_timeout_us(pf_fd, vf_num, pt_us));
> +}
> +
> +/**
> + * __xe_sriov_profile_get_preempt_timeout_us - Read preemption timeout for a VF
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @pt_us:   Output pointer for preemption timeout (µs).
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_profile_get_preempt_timeout_us(int pf_fd, unsigned int vf_num,
> +					      uint32_t *pt_us)
> +{
> +	char path[PATH_MAX];
> +	unsigned int val = 0;
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num,
> +			     "profile/preempt_timeout_us");
> +	ret = igt_sysfs_scanf(sysfs, path, "%u", &val);
> +	close(sysfs);
> +
> +	ret = ret_from_scanf_items(ret, 1);
> +	if (ret)
> +		return ret;
> +	*pt_us = val;
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_profile_get_preempt_timeout_us - Assert wrapper for reading VF preemption timeout
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + *
> + * Returns: preemption timeout (µs); asserts on error.
> + */
> +uint32_t xe_sriov_profile_get_preempt_timeout_us(int pf_fd, unsigned int vf_num)
> +{
> +	uint32_t v = 0;
> +
> +	igt_assert_eq(0, __xe_sriov_profile_get_preempt_timeout_us(pf_fd, vf_num, &v));
> +	return v;
> +}
> +
> +/**
> + * __xe_sriov_profile_set_sched_priority_string - Set VF priority from string
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @prio:    String value ("low", "normal", "high").
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_profile_set_sched_priority_string(int pf_fd, unsigned int vf_num,
> +						 const char *prio)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	if (!prio)
> +		return -EINVAL;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num,
> +			     "profile/sched_priority");
> +	ret = igt_sysfs_printf(sysfs, path, "%s", prio);
> +	close(sysfs);
> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * __xe_sriov_profile_set_sched_priority - Set VF scheduling priority
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @prio:    Priority enum value.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_profile_set_sched_priority(int pf_fd, unsigned int vf_num,
> +					  enum xe_sriov_sched_priority prio)
> +{
> +	const char *p = xe_sriov_sched_priority_to_string(prio);
> +
> +	return __xe_sriov_profile_set_sched_priority_string(pf_fd, vf_num, p);
> +}
> +
> +/**
> + * xe_sriov_profile_set_sched_priority - Assert wrapper for setting VF priority
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @prio:    Priority enum value.
> + */
> +void xe_sriov_profile_set_sched_priority(int pf_fd, unsigned int vf_num,
> +					 enum xe_sriov_sched_priority prio)
> +{
> +	igt_assert_eq(0, __xe_sriov_profile_set_sched_priority(pf_fd, vf_num, prio));
> +}
> +
> +/**
> + * __xe_sriov_profile_get_sched_priority_choice - Read sched_priority tokens
> + * @pf_fd:   PF device file descriptor
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @choice:  Output choice structure with parsed tokens and selected index
> + *
> + * Reads the sched_priority sysfs attribute for the given PF/VF and parses it
> + * into an igt_sysfs_choice.
> + *
> + * Returns: 0 on success or a negative errno code.
> + */
> +int __xe_sriov_profile_get_sched_priority_choice(int pf_fd, unsigned int vf_num,
> +						 struct igt_sysfs_choice *choice)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num, "profile/sched_priority");
> +	ret = igt_sysfs_choice_read(sysfs, path, choice);
> +	close(sysfs);
> +
> +	return ret;
> +}
> +
> +/**
> + * __xe_sriov_profile_get_sched_priority - Read VF scheduling priority + mask
> + * @pf_fd:     PF device file descriptor.
> + * @vf_num:    VF index (0 for PF, >0 for VFs).
> + * @prio:      Output pointer for the effective priority.
> + * @prio_mask: Output mask of allowed priorities.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_profile_get_sched_priority(int pf_fd, unsigned int vf_num,
> +					  enum xe_sriov_sched_priority *prio,
> +					  unsigned int *prio_mask)
> +{
> +	struct igt_sysfs_choice prio_ch = {};
> +	int ret;
> +
> +	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &prio_ch);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_sriov_sched_priority_from_string(prio_ch.tokens[prio_ch.selected], prio);
> +	if (igt_debug_on_f(ret, "unknown selected value '%s' (err=%d)\n",
> +			   prio_ch.tokens[prio_ch.selected], ret))
> +		return ret;
> +
> +	if (prio_mask) {
> +		ret = xe_sriov_sched_priority_choice_to_mask(&prio_ch, prio_mask, NULL);
> +		if (igt_debug_on_f(ret, "mask conversion failed (err=%d)\n", ret))

nit: instead of printing just the error code, add also strerror()

> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_profile_get_sched_priority - Assert wrapper for reading VF priority
> + * @pf_fd:     PF device file descriptor.
> + * @vf_num:    VF index (0 for PF, >0 for VFs).
> + * @prio_mask: Output mask of supported priorities.
> + *
> + * Returns: effective priority; asserts on error.
> + */
> +enum xe_sriov_sched_priority
> +xe_sriov_profile_get_sched_priority(int pf_fd, unsigned int vf_num,
> +				    unsigned int *prio_mask)
> +{
> +	enum xe_sriov_sched_priority cur_prio;
> +
> +	igt_assert_eq(0,
> +		      __xe_sriov_profile_get_sched_priority(pf_fd, vf_num, &cur_prio, prio_mask));
> +
> +	return cur_prio;
> +}
> +
> +/**
> + * __xe_sriov_bulk_set_exec_quantum_ms - Set execution quantum for PF and all VFs
> + * @pf_fd: PF device file descriptor.
> + * @eq_ms: Execution quantum in milliseconds.
> + *
> + * Applies the value to PF and all VFs.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_bulk_set_exec_quantum_ms(int pf_fd, uint32_t eq_ms)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_bulk_rel_path(path, sizeof(path), "exec_quantum_ms");
> +	ret = igt_sysfs_printf(sysfs, path, "%u", eq_ms);
> +	close(sysfs);

New line

> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * xe_sriov_bulk_set_exec_quantum_ms - Assert wrapper for bulk execution quantum update
> + * @pf_fd: PF device file descriptor.
> + * @eq_ms: Execution quantum in milliseconds.
> + */
> +void xe_sriov_bulk_set_exec_quantum_ms(int pf_fd, uint32_t eq_ms)
> +{
> +	igt_assert_eq(0, __xe_sriov_bulk_set_exec_quantum_ms(pf_fd, eq_ms));
> +}
> +
> +/**
> + * __xe_sriov_bulk_set_preempt_timeout_us - Set preemption timeout for PF and all VFs
> + * @pf_fd: PF device file descriptor.
> + * @pt_us: Preemption timeout in microseconds.
> + *
> + * Applies the value to PF and all VFs.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_bulk_set_preempt_timeout_us(int pf_fd, uint32_t pt_us)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_bulk_rel_path(path, sizeof(path), "preempt_timeout_us");
> +	ret = igt_sysfs_printf(sysfs, path, "%u", pt_us);
> +	close(sysfs);
> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * xe_sriov_bulk_set_preempt_timeout_us - Assert wrapper for bulk preemption timeout update
> + * @pf_fd: PF device file descriptor.
> + * @pt_us: Preemption timeout in microseconds.
> + */
> +void xe_sriov_bulk_set_preempt_timeout_us(int pf_fd, uint32_t pt_us)
> +{
> +	igt_assert_eq(0, __xe_sriov_bulk_set_preempt_timeout_us(pf_fd, pt_us));
> +}
> +
> +/**
> + * __xe_sriov_bulk_set_sched_priority_string - Set scheduling priority for PF and all VFs
> + * @pf_fd: PF device file descriptor.
> + * @prio:  String priority ("low", "normal", "high").
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_bulk_set_sched_priority_string(int pf_fd, const char *prio)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_bulk_rel_path(path, sizeof(path), "sched_priority");
> +	ret = igt_sysfs_printf(sysfs, path, "%s", prio);
> +	close(sysfs);
> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * xe_sriov_bulk_set_sched_priority_string - Assert wrapper for bulk priority update
> + * @pf_fd: PF device file descriptor.
> + * @prio:  String priority.
> + */
> +void xe_sriov_bulk_set_sched_priority_string(int pf_fd, const char *prio)
> +{
> +	igt_assert_eq(0, __xe_sriov_bulk_set_sched_priority_string(pf_fd, prio));
> +}
> +
> +/**
> + * __xe_sriov_bulk_set_sched_priority - Set numeric priority for PF and all VFs
> + * @pf_fd: PF device file descriptor.
> + * @prio:  Enum priority value.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_bulk_set_sched_priority(int pf_fd,
> +				       enum xe_sriov_sched_priority prio)
> +{
> +	const char *s = xe_sriov_sched_priority_to_string(prio);
> +
> +	if (!s)
> +		return -EINVAL;
> +	return __xe_sriov_bulk_set_sched_priority_string(pf_fd, s);
> +}
> +
> +/**
> + * xe_sriov_bulk_set_sched_priority - Assert wrapper for bulk priority update
> + * @pf_fd: PF device file descriptor.
> + * @prio:  Enum priority value.
> + */
> +void xe_sriov_bulk_set_sched_priority(int pf_fd,
> +				      enum xe_sriov_sched_priority prio)
> +{
> +	igt_assert_eq(0, __xe_sriov_bulk_set_sched_priority(pf_fd, prio));
> +}
> +
> +/**
> + * __xe_sriov_vf_stop - Issue stop command for a VF
> + * @pf_fd:  PF device file descriptor.
> + * @vf_num: VF index.
> + *
> + * Triggers VF stop via sysfs.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_vf_stop(int pf_fd, unsigned int vf_num)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num, "stop");
> +	ret = igt_sysfs_printf(sysfs, path, "%u", 1u);
> +	close(sysfs);
> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * xe_sriov_vf_stop - Assert wrapper for VF stop command
> + * @pf_fd:  PF device file descriptor.
> + * @vf_num: VF index.
> + */
> +void xe_sriov_vf_stop(int pf_fd, unsigned int vf_num)
> +{
> +	igt_assert_eq(0, __xe_sriov_vf_stop(pf_fd, vf_num));
> +}
> +
> +/**
> + * __xe_sriov_profile_restore_defaults - Restore scheduling defaults for a VF
> + * @pf_fd:  PF device file descriptor.
> + * @vf_num: VF index (0 for PF, >0 for VFs).
> + *
> + * Resets execution quantum, preemption timeout, and priority to driver defaults.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_profile_restore_defaults(int pf_fd, unsigned int vf_num)
> +{
> +	int ret_eq, ret_pt, ret_prio;
> +	int ret = 0;
> +
> +	ret_eq = __xe_sriov_profile_set_exec_quantum_ms(pf_fd, vf_num, 0);
> +	igt_warn_on(ret_eq);
> +	if (!ret)
> +		ret = ret_eq;
> +
> +	ret_pt = __xe_sriov_profile_set_preempt_timeout_us(pf_fd, vf_num, 0);
> +	igt_warn_on(ret_pt);
> +	if (!ret)
> +		ret = ret_pt;
> +
> +	ret_prio = __xe_sriov_profile_set_sched_priority(pf_fd, vf_num,
> +							 XE_SRIOV_SCHED_PRIORITY_LOW);
> +	igt_warn_on(ret_prio);
> +	if (!ret)
> +		ret = ret_prio;
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_sriov_profile_restore_defaults - Assert wrapper restoring VF defaults
> + * @pf_fd:  PF device file descriptor.
> + * @vf_num: VF index (0 for PF, >0 for VFs).
> + */
> +void xe_sriov_profile_restore_defaults(int pf_fd, unsigned int vf_num)
> +{
> +	igt_assert_eq(0, __xe_sriov_profile_restore_defaults(pf_fd, vf_num));
> +}
> +
> +/**
> + * __xe_sriov_bulk_restore_defaults - Restore scheduling defaults for PF and all VFs
> + * @pf_fd: PF device file descriptor.
> + *
> + * Resets PF and all VFs to driver default scheduling parameters.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_bulk_restore_defaults(int pf_fd)
> +{
> +	int ret_eq, ret_pt, ret_prio;
> +	int ret = 0;
> +
> +	ret_eq = __xe_sriov_bulk_set_exec_quantum_ms(pf_fd, 0);
> +	igt_warn_on(ret_eq);
> +	if (!ret)
> +		ret = ret_eq;
> +
> +	ret_pt = __xe_sriov_bulk_set_preempt_timeout_us(pf_fd, 0);
> +	igt_warn_on(ret_pt);
> +	if (!ret)
> +		ret = ret_pt;
> +
> +	ret_prio = __xe_sriov_bulk_set_sched_priority(pf_fd,
> +						      XE_SRIOV_SCHED_PRIORITY_LOW);
> +	igt_warn_on(ret_prio);
> +	if (!ret)
> +		ret = ret_prio;
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_sriov_bulk_restore_defaults - Assert wrapper for restoring defaults on PF and all VFs
> + * @pf_fd: PF device file descriptor.
> + */
> +void xe_sriov_bulk_restore_defaults(int pf_fd)
> +{
> +	igt_assert_eq(0, __xe_sriov_bulk_restore_defaults(pf_fd));
> +}
> diff --git a/lib/xe/xe_sriov_admin.h b/lib/xe/xe_sriov_admin.h
> new file mode 100644
> index 000000000..6dfd0f7d4
> --- /dev/null
> +++ b/lib/xe/xe_sriov_admin.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2025 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_SRIOV_ADMIN_H__
> +#define __XE_SRIOV_ADMIN_H__
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stddef.h>
> +#include "xe_sriov_provisioning.h" /* for enum xe_sriov_sched_priority */
> +
> +struct igt_sysfs_choice;
> +
> +bool xe_sriov_admin_is_present(int pf_fd);
> +
> +int  __xe_sriov_profile_set_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t eq_ms);
> +void  xe_sriov_profile_set_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t eq_ms);
> +int  __xe_sriov_profile_get_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t *eq_ms);
> +uint32_t xe_sriov_profile_get_exec_quantum_ms(int pf_fd, unsigned int vf_num);
> +int  __xe_sriov_profile_set_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t pt_us);
> +void  xe_sriov_profile_set_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t pt_us);
> +int  __xe_sriov_profile_get_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t *pt_us);
> +uint32_t xe_sriov_profile_get_preempt_timeout_us(int pf_fd, unsigned int vf_num);
> +int __xe_sriov_profile_set_sched_priority_string(int pf_fd, unsigned int vf_num,
> +						 const char *prio);
> +int __xe_sriov_profile_get_sched_priority_choice(int pf_fd, unsigned int vf_num,
> +						 struct igt_sysfs_choice *choice);
> +int __xe_sriov_profile_set_sched_priority(int pf_fd, unsigned int vf_num,
> +					  enum xe_sriov_sched_priority prio);
> +void xe_sriov_profile_set_sched_priority(int pf_fd, unsigned int vf_num,
> +					 enum xe_sriov_sched_priority prio);
> +int __xe_sriov_profile_get_sched_priority(int pf_fd, unsigned int vf_num,
> +					  enum xe_sriov_sched_priority *prio,
> +					  unsigned int *prio_mask);
> +enum xe_sriov_sched_priority
> +xe_sriov_profile_get_sched_priority(int pf_fd, unsigned int vf_num,
> +				    unsigned int *prio_mask);


If you named above helpers xe_sriov_profile_set_*, then I think it would 
be better to name below the same way.
It would be xe_sriov_profile_bulk_set_*.
Another option is to use xe_sriov_admin_set_* and xe_sriov_admin_bulk_set_*

> +
> +int  __xe_sriov_bulk_set_exec_quantum_ms(int pf_fd, uint32_t eq_ms);
> +void  xe_sriov_bulk_set_exec_quantum_ms(int pf_fd, uint32_t eq_ms);
> +int  __xe_sriov_bulk_set_preempt_timeout_us(int pf_fd, uint32_t pt_us);
> +void  xe_sriov_bulk_set_preempt_timeout_us(int pf_fd, uint32_t pt_us);
> +int  __xe_sriov_bulk_set_sched_priority_string(int pf_fd, const char *prio);
> +void  xe_sriov_bulk_set_sched_priority_string(int pf_fd, const char *prio);
> +int __xe_sriov_bulk_set_sched_priority(int pf_fd,
> +				       enum xe_sriov_sched_priority prio);
> +void xe_sriov_bulk_set_sched_priority(int pf_fd,
> +				      enum xe_sriov_sched_priority prio);
> +
> +int  __xe_sriov_vf_stop(int pf_fd, unsigned int vf_num);
> +void  xe_sriov_vf_stop(int pf_fd, unsigned int vf_num);
> +
> +int  __xe_sriov_profile_restore_defaults(int pf_fd, unsigned int vf_num);
> +void  xe_sriov_profile_restore_defaults(int pf_fd, unsigned int vf_num);
> +int  __xe_sriov_bulk_restore_defaults(int pf_fd);
> +void  xe_sriov_bulk_restore_defaults(int pf_fd);
> +
> +#endif /* __XE_SRIOV_ADMIN_H__ */
