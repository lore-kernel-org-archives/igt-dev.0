Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2983BD2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 09:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B321010E179;
	Tue, 20 Jan 2026 09:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvYbjjQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E907610E179
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 09:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768900918; x=1800436918;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1icb5JOmnUXRp/yCv7NOkct47tSD/jIxbG/r+zykFZw=;
 b=ZvYbjjQ5lJBk6p/A7SYXPFnIQPurdcjp2Fkj6dsjXX7NRMabgsMGD4ea
 TLUOo9ZVVzKMgtExfV5uil7QKrjyWcDYX0rmtuT6pYTYlATU80RmE2Eoa
 sXrOU1nKW5vZNpZJVJPRQmBticbiin4KPGw7R//Y+AF4xq8C/Z+8T40T1
 wgkQbwAESPzckeZMXdM/XV2vPdwulfcQl09k9q413eD6/E8JgHs35DdPR
 kWNhcfMQIl9Q5T0BQcVxoB15B8YBLvjnPDdJyPYeWiqMW1YO9SwB48dsI
 UgtPAeOq0kpwExl8BU1/7SzXuvA52VKf7diEGqOT4yZqXs67cHWLQM/ES Q==;
X-CSE-ConnectionGUID: wsqBYZbRQNOj0SHAvbXqZQ==
X-CSE-MsgGUID: S+2zZZ1SSm+yWRRTqmObxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57662164"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="57662164"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:21:57 -0800
X-CSE-ConnectionGUID: PD/MPUzsTY2affQoIFwI3Q==
X-CSE-MsgGUID: baGjDhCPS7eLvC09WnkFYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="211084749"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:21:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 01:21:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 01:21:56 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 01:21:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrZi7DsG4I2jCV7CK4Q04yKflBaU14VzvpDz/NaoMmD6BhGU4q4j/ILgr8DYb4+OXtBCqJulNbVTxNvJW3rRFme0boYVnBsoCO+D7YTQiREa59JTidGr05Jc5Ou6F9607aWXGjyP6RSPhNLol8dqwgJyXsoCTu5iVu/AUGaUBsspLS6w/EwJxKnPQg5VQDLBJoFbeGkaVSTcWycr8utOXSsEUg/urEoTsVAxBvXpEjkk1IanDal3HrceWmbYLag+VIQlCRAS2SgMUvC8EMiyOU7atXMch3J1ryD2j1sBZdOlhH11wfZ8wwKjSEqSeKaTKBabDFJ6fPrchmfOKpH78w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nr4HNiWDXr4HQ1waUzkdybW4OQtgx2e1djr93SpqJ54=;
 b=chCiREZbVTMTvegpVKYbX184Bx2Sddhsb4cSHyyvKFuUXxDmd9gDudS65lIeiaBakwjX0xUcGa4k0pBI7mU6Hgd9cjG/hBY0jHnuWf/svYnMC+2HeA1PKVRsAhTmmRHoh1iq4sAcXZ7usS7anMWVoqzKxyj6a4TEeRkUrVut2HOsku7zRV4mbCqPMPkUobt3xBn3SgyBzRA1GIdAKH4FJz+6JTSEUiltaZt9cvMDsZh1uTlv/Ih/IshgG53W+OhkPEImdGOowT9tGgui0slQOYsucHLwWUQHMFmDFHXk+zgR9IjIOrHi0sk/lPKcUbr9wMbRWO4xIA4TYCAX0d4fXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM3PPF1A07FAA60.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 09:21:49 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 09:21:48 +0000
Date: Tue, 20 Jan 2026 10:21:41 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 2/5] lib/intel_compute: Add loop and loop-count
 shaders for xe3p
Message-ID: <aW9JGuP0sz_byoUD@fdugast-desk>
References: <20260119171013.442579-7-zbigniew.kempczynski@intel.com>
 <20260119171013.442579-9-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119171013.442579-9-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0178.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::33) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM3PPF1A07FAA60:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a28b508-bcf3-4232-fe0e-08de5805569f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c01aU1N0QUdsSzZtaXdnZUpLb2pDOHBibncxdFlvWDUyY0FsSHp5c3M1QUts?=
 =?utf-8?B?akYxamhEV2RXR05xOFF4RmNaSE41c1hYc094UlIzeVJuYUtJcXZ0YmhmVU95?=
 =?utf-8?B?am16QjRFcE1VMlBmZzlORjREM0NYbVJNbXc5SE9YSE5hSG9TY2VBUlU5bmhu?=
 =?utf-8?B?WFZtRDFzalh3bkxSK1pUTWxZaVhBdFZlaTR2cXdFOGJxVzJCR2F1dlVqNS9L?=
 =?utf-8?B?RWMzM1FKUEFnZVBQNmdyYXd1NkVCQng4eXRVMmkra2RoTDYraWhJUjlnSFlj?=
 =?utf-8?B?UmhNeEg4ZG9yaTVlbUtLNVdQdGg3ZitBRlZCK2NRN0g3UmtUQXk2ckY4bE9u?=
 =?utf-8?B?MDk5MHdNSm5IdFYydE9ML3NZWVF6T0NlYTdaeDEvS2V2YjVUckRPWG5zNCt6?=
 =?utf-8?B?QlRiWk1OZVhlT1B6dGNZS3l4Rm51UTBYd3c2aVNObGlSR0pGK0k4cEswTWtI?=
 =?utf-8?B?bDRwWm9mOE9xNk1yT0VzempLVG5tRWJVUUJ2VTJ3SFpwUFh2c1ZFdFl3dTVC?=
 =?utf-8?B?YVVqTjFsNUp4cTJ4M0xGa0Vtd29WRURxZVlJWG10LyttYnB4QzJySjErUG8v?=
 =?utf-8?B?eUMwVTBYMmVtWnlXUVhqNS9HbE5zYi96QUpvckNyYTNJUklkSmFVRVp2WEF0?=
 =?utf-8?B?Myt0WE5icGV0YlJIaTNNamRJbUJiS0puT3BkeWJlYUdVSlhYN2hoYnRDOUJy?=
 =?utf-8?B?SDBMQVlhR0tVUXBYaTFlVVNFaTBUZEp6QW1GWDNCUWFUcWVNTjN0UTRZempm?=
 =?utf-8?B?d3NZRC9Gd0V1YzJZQ2pXNFg5TmtCRnBxRldlTkdVM3BaU3ZuTFc2bTNubVhs?=
 =?utf-8?B?S01Ic2hmR2Y0OXk5NkU5V3IzZGVwdGIwY0dEVXNrVDNxRHhZZ0xiTzBJOGFu?=
 =?utf-8?B?MkVrNWVqa3prQ3hWZGlxQmd5Lzd0ellsUjlZSm5UQlhKOE5OZnZuWUZrUkpE?=
 =?utf-8?B?M2xqcXBSTTlzZkNKSVJJTmVGU093NFkvQzN5YnU2dFJHdWxhaHJ3VlI0UTRm?=
 =?utf-8?B?bXJGbEtvd0JkcWpMa3Q3NVVJMUdYS1JPS0ZGNmlZMnVGZlJqbVkvSk4rMjRx?=
 =?utf-8?B?MzVKMkliVXMreldNZFFUaXp0QlRzVzRiOWJnM1lPalFSRDhLNkI4QUI1c21n?=
 =?utf-8?B?THc5ZzJ4ZjV6VEVIbHdTRnBoM1hvV3B2U2tieDdiUDZNWFdjUVZqUm4yb3dx?=
 =?utf-8?B?M0VIZXd2NGd2UWhqVHl0Y3h1R1lKUFpieXJRQzI0RGVnU3ZIMUdwcDBZYUN6?=
 =?utf-8?B?QXYybzRzbWE4SFJpWUh6V2tGM1RVZmFPdlUrMUc1WnN6b2kydWJnaHFWK1VL?=
 =?utf-8?B?NVBjYlhhUEs3cUEzbkFWeDdPbVFLVzU0Z2pSZkxKMGtmOGZXclUvOUFCTk54?=
 =?utf-8?B?T0Mvak9adHN0ZzdObmlqbDNpS1VaUUkxM0t2bDkwWGZDTEsxK0w5NWNxTHo1?=
 =?utf-8?B?T2plWmg5NmlScDBqdmZqeHpadHVaaWNZSUlibmFDZHlWK2hUcE85dExGQVY0?=
 =?utf-8?B?ZkNaME5CL29iQ2k2bENMZUdaaytTSmdBTjQ5TC92Z1FqVUVnb0Z1T2IwWXYv?=
 =?utf-8?B?aUVEMXZ5aEpSWVp5QzBONEZ1SEZ0QXRoWEZrTTRGUkJKYjJJaUZtalFEQjN6?=
 =?utf-8?B?ajRqQlYreUdlajhZeXNxY1dwdnlHSVdWc3U1SEdKY2N0WktEN2ZML1Y4ZWxW?=
 =?utf-8?B?S1V0dTV2QU5IbVBtbk5RWlpwRjMwdVFaZEtna0diRmZxamlQaXRuNjRCd3ZI?=
 =?utf-8?B?V1ZyVGs1czhTUDlpZFRqdE0vN0ZZS29qNW1kenRUT1ZQRER6Qzk0R1JKZVFs?=
 =?utf-8?B?d1hkbHZ5SW4wSnZ3VDJDY25FdGVnU1M0RmZFRzZvTEhoak1RNVdNdlJvTDE3?=
 =?utf-8?B?R3pZSGJ4M0RocWs4T1hVdHVQc1ZacVRsQXBhTFpXd1JYVVRTeE1qaVpGWmFD?=
 =?utf-8?B?ckIvelJsUnhOMk5oVWlGdG9oREl3emJOR2VGaFY5TmhOSzlWN3pyeG5Randw?=
 =?utf-8?B?bWJKQ0c4bkZ3dnpndm1TVlhUMGplVXVNUDZHVVNvVGZyT2Nna2s3ZllUUjRj?=
 =?utf-8?B?RTQ2U3BKWTMya1kyRmo0azFicTk4eVd0bUlBZzVpQkJhSkI1Y0ZycWo2anNj?=
 =?utf-8?Q?4O+U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzUvL29DZjJUbzZRMFh6VUtYeEREYkpGRTF0Tzdia0pVc3BNdk1RT1FOWmNt?=
 =?utf-8?B?Q0xpVnFXcGxnb3FiMTY2WjdwbXZTeGk4SDJKOXF1Zjk5U2kveTdhNEJ5Vlh1?=
 =?utf-8?B?SWpvc09xWG11WWdpZnY0YU9XNHlhck9McHp0WG1janYxNGdBWkF3UU9ONklr?=
 =?utf-8?B?dTZ4RnpjVktuVG5KK1NJSUZ6ZlJtdHlLUTVKWFIwWGoxMUJ1WGFHOG9udGx0?=
 =?utf-8?B?cEZPSHVSTlhFK3QrRmQyR1AxaGxhVVo3QmZjdEhCZXZ4cEduRXk5L0E0d2Zu?=
 =?utf-8?B?VmlKbnZrd2RPcExkSHdoc3hkbkFwVm82TlpGVlpBMDRlRG1TUmRHWkJCdG9I?=
 =?utf-8?B?UWh5V3pPVThEMTE0T3V4NUlaY0h5UUw5UG12S3UwT2Jlem0xb1cwb0RIQ2VW?=
 =?utf-8?B?NDE3NVZLN1FwTjBYZ1JSbGI4dGtQL0FVY0JkamRaVXcxYUpubkI4YnB0dVJm?=
 =?utf-8?B?NGtRUkRBRkZWM2JDUjZqTlg5U0JSa0UvWXhFVFp5S3NFSFZtRVdaaWg2T2ND?=
 =?utf-8?B?eDl1YnVNRzFKUFhDVHZTS0cvOE94Nnc2aGJ0YlNodzdxTUZXZVl0U0NIdlVT?=
 =?utf-8?B?Y1MvaU5iYUtVL3FkT3pCTGdORENMRUNrN1F4TXVOZVg1dnBsMFhVNkN4TWow?=
 =?utf-8?B?aGJ3RXBQN2xtQ3o5V09sUFRTLzROUGtCdVZUQlVvWm1KZWgvMVFSV0MraVN3?=
 =?utf-8?B?QUxOKzdtajNXeCtRWEVxdkxJb2FBdGFrcURrS3pLZmJIOFRPbGtlVnpzUDN1?=
 =?utf-8?B?Si9BYjNlQUdEcGRCVzdrY0N0NnBwMUkvdHQrRXlOc2N0REphWDkzR3BLMXh2?=
 =?utf-8?B?YTMwMDgwMm8wVXRBcGJ1U0tHa3JtdmQ2TlRHQm5xUFJCMVJRemtlYlM0N3ds?=
 =?utf-8?B?SlE4anFHeVFpMHJ0RVFpdm03VWdVR1hsMG5ORzlWak12dk1lYmNBRUx1TXVN?=
 =?utf-8?B?SXUwaHlFbTB0OXl6TnQxUzU2QmtxSTRKSkEwaVAzeGRqZFZGV1lyZ01kQVRz?=
 =?utf-8?B?am12ejRSVmVDZ2tvSzM5N3JCeXdyYWtqZHZjT0J2dTBGUXdRakM3NW5HejNq?=
 =?utf-8?B?Y0dzU0g3YmViMWxiZm01QVM2aEViK2t1eC8vZjRXSDZoQkZQeEhZdmJwZWRi?=
 =?utf-8?B?bVA5dm9NcEZicVoxRVA5UTVXMWgrUGFDMFh6TDB6SG1qV0ZUa1RkdkFZWTBn?=
 =?utf-8?B?SmMyTjZrZnFFNzlLSllqUTdDRWU5bDEySDhpS0JvZVVtbVdsL0dlVGthWFRN?=
 =?utf-8?B?UDcweWxhM1pNUllMUDFqazV5MzZBYmh6SWV5VnpNYk16ejR3RnNPQmx1S0JI?=
 =?utf-8?B?cW5KWUdkcEh2MVpBVmx4Z240WUtwdlNYeDI0Yk9wVXR2L0lFZnY5OUUzV0xW?=
 =?utf-8?B?SUdFcjVFWEM5Z3dzYWhVUi9HQS8zN09ZK3BRVU9vUytKM05Odjd2dVlyNE16?=
 =?utf-8?B?Ly9nZHlQNUNZSzBmdEJuT0VlSExYS0IyOWphOXl0ZjMvY2JWZzdvUUp0VEN6?=
 =?utf-8?B?emQwZ25RV0FhazlreHJPbnprUEs1Vmg3NE8xa01GeFpUMVdIRnVuaUhpU0hp?=
 =?utf-8?B?N2pIRm15bEJPWDVyK0lMMkNRRWlMcm1rTTFuYXRZNzdWdSttUHdmeERaMnI3?=
 =?utf-8?B?UWQrWlFJZldqZ1o0TWdmRy9QZHI2SWJKeWtTbDNlS3NwTUZaZzY4dXBDd2Rn?=
 =?utf-8?B?ZTY0eUhjTWp6eFJEa3h3VnpGNlVVR2ZBalBsZ09XWkVyMThwSzJjL0pBNEpY?=
 =?utf-8?B?NEdNSzIrYlV1a2RrV1R4MU5tTnZSczBOQkQ2MnVncExsWXpnSmNhUFhNTDR3?=
 =?utf-8?B?eVNTd2gyV2hpUkdkeU9VSWEyV3JodlRZZnkxMWd6c3JseHp4bGppKzRYc0NK?=
 =?utf-8?B?SktsdGsrNGFjc2JPd2pqY3hnL1dYODh6QlV2dlVla0RPMmhxR1lPYk1iQU9G?=
 =?utf-8?B?TjdhK09DbGtvTXVnSHRMaXNVbWFlcE9WMUhLNkYwd1ZiTUtQak5IdUFjV3Y2?=
 =?utf-8?B?NUsza3BBdTBpaEw1RHQyZ2dOZHpsSDBaczhhM1dBOHlPcXFPQjJ2bHN5WTdB?=
 =?utf-8?B?eXpyUDdOVStSbU91VDZoa08vMzFrTzZPamczZkNXNy9CblBxQVl5ZnFyUTYv?=
 =?utf-8?B?eW16MTFERUV5RHFUS0tXWk85YVhKNUhmQzRNaVhadStWSWZyRnJJRXllSE9S?=
 =?utf-8?B?aFdaM285OFBTZFpiRVM0YnpoOTlpSUxmMnZwSWFsVHpSc1oyelRRKzZRdTlY?=
 =?utf-8?B?Y0cvdjZuNEVnN1lhcDNzNmthVFd6Vzc5ZDloR08wa1NwWGYzZWczUXArK0gv?=
 =?utf-8?B?dmlnVWFIaGc0Y0x3KzVFWk5iRmdyQklkQTQybWcwRW9Jai9VNERVZ2dYZzNP?=
 =?utf-8?Q?kHTcPJQGZp5NJ1VI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a28b508-bcf3-4232-fe0e-08de5805569f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:21:48.6930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QZRWpsMvuN0+AZdTbords1zUjxXEQ5ieUjriEieFx9lnJkn7jnTT8Kw9c9RxHRYbTx6uZeydndwjg5Da1BaFDBZTZrvotiwCwC4pur4OSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1A07FAA60
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

On Mon, Jan 19, 2026 at 06:10:16PM +0100, Zbigniew Kempczyński wrote:
> Upcoming changes for WMTP and TG preemption require loop and
> loop-count shaders. Introduce them in separate patch for easier
> review even if they are not directly used yet.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
> v5: add missing loop_noopt.cl (Kamil)
> ---
>  lib/intel_compute_krn_loop.h       | 36 ++++++++++++++++++++++++++++++
>  lib/intel_compute_krn_loop_count.h | 34 ++++++++++++++++++++++++++++
>  lib/intel_compute_square_kernels.c |  4 ++++
>  opencl/loop_noopt.cl               | 15 +++++++++++++
>  4 files changed, 89 insertions(+)
>  create mode 100644 opencl/loop_noopt.cl
> 
> diff --git a/lib/intel_compute_krn_loop.h b/lib/intel_compute_krn_loop.h
> index 3a52691cde..1f92ed33f2 100644
> --- a/lib/intel_compute_krn_loop.h
> +++ b/lib/intel_compute_krn_loop.h
> @@ -80,4 +80,40 @@ static const unsigned char xe3lpg_kernel_loop_bin[] = {
>  	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
>  };
>  
> +/*
> + * Opencl code is in opencl/loop_noopt.cl
> + *
> + * To work properly it requires to use uncached reads, so ocloc has to
> + * be called with: -options " -igc_opts 'LscLoadCacheControlOverride=1'" arg
> + *
> + * To reuse compute pipeline for xe3p loop.cl can't be used but loop_noopt.cl.
> + * For loop.cl IGC optimizer notices output is not used and gets it rid of.
> + * Artificial write to output[0] prevents compiler from doing that.
> + * Starting offset should be shifted according to .ze_info section.

To prevent duplication we could also use the loop_noopt.cl version for
all existing tests, right? Probably not worth the effort but asking for
understanding.

> + */
> +static const unsigned char xe3p_kernel_loop_bin[] = {
> +	0x61, 0x00, 0x00, 0x80, 0x30, 0x43, 0x61, 0x60, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x33, 0x22, 0x01, 0x80, 0x06, 0x18, 0x00, 0x05,
> +	0x0c, 0x04, 0x28, 0xf0, 0x00, 0x00, 0x00, 0x96, 0x61, 0x80, 0x10, 0x28,
> +	0x02, 0x00, 0x00, 0x00, 0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
> +	0x00, 0x80, 0x00, 0x02, 0xc0, 0x04, 0x00, 0x40, 0x61, 0x09, 0x14, 0x00,
> +	0x60, 0x01, 0x05, 0x07, 0x04, 0x01, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x01, 0x82, 0x8c, 0x34, 0x00, 0x00, 0x00, 0x00, 0x41, 0x61, 0x01, 0x80,
> +	0x60, 0x06, 0x05, 0x03, 0x54, 0x05, 0x00, 0x06, 0x14, 0x02, 0x10, 0x00,
> +	0x61, 0x00, 0x84, 0x68, 0x06, 0x05, 0x00, 0x00, 0x33, 0x23, 0x03, 0x80,
> +	0x02, 0x00, 0x00, 0x04, 0x0c, 0x06, 0x02, 0xf0, 0x00, 0x00, 0x00, 0x94,
> +	0x70, 0x83, 0x14, 0x80, 0x60, 0x86, 0x01, 0x00, 0x04, 0x04, 0x00, 0x16,
> +	0x34, 0x12, 0x34, 0x12, 0x20, 0x00, 0x00, 0x94, 0x00, 0x40, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0xd8, 0xff, 0xff, 0xff, 0x61, 0x00, 0x84, 0x68,
> +	0x0b, 0x05, 0x06, 0x00, 0x52, 0x00, 0xb8, 0x28, 0x09, 0x03, 0x04, 0x07,
> +	0x61, 0x1a, 0x10, 0x00, 0xa0, 0x0a, 0x06, 0x0c, 0x04, 0x0b, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x10, 0x02, 0xa0, 0x0a, 0x06, 0x0e,
> +	0x04, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x10, 0x00,
> +	0xa0, 0x0a, 0x16, 0x0c, 0x14, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x61, 0x12, 0x10, 0x02, 0x20, 0x02, 0x16, 0x0e, 0x14, 0x0b, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x33, 0x24, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x24, 0x0c, 0x00, 0xf0, 0x14, 0x09, 0x04, 0x90, 0x33, 0xc5, 0x00, 0x80,
> +	0x01, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00,
> +};
> +
>  #endif /* __INTEL_COMPUTE_KRN_LOOP_H__ */
> diff --git a/lib/intel_compute_krn_loop_count.h b/lib/intel_compute_krn_loop_count.h
> index ecad7fe256..7b4542cda7 100644
> --- a/lib/intel_compute_krn_loop_count.h
> +++ b/lib/intel_compute_krn_loop_count.h
> @@ -90,4 +90,38 @@ static const unsigned char xe3lpg_kernel_count_bin[] = {
>  	0x04, 0x00, 0x00, 0x00, 0x0c, 0x12, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00,
>  };
>  
> +static const unsigned char xe3p_kernel_count_bin[] = {
> +	0x61, 0x00, 0x00, 0x80, 0x30, 0x43, 0x61, 0x60, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x33, 0x22, 0x01, 0x80, 0x06, 0x18, 0x00, 0x05,
> +	0x0c, 0x04, 0x28, 0xf0, 0x00, 0x00, 0x00, 0x96, 0x61, 0x80, 0x10, 0x28,
> +	0x02, 0x00, 0x00, 0x00, 0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
> +	0x00, 0x80, 0x00, 0x02, 0xc0, 0x04, 0x00, 0x40, 0x41, 0x22, 0x17, 0x00,
> +	0x60, 0x06, 0x01, 0x20, 0x14, 0x02, 0x00, 0x06, 0x54, 0x05, 0x10, 0x00,
> +	0x61, 0x00, 0x14, 0x00, 0x10, 0x01, 0x06, 0x13, 0x04, 0x01, 0x10, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x14, 0x80, 0x60, 0x86, 0x01, 0x00,
> +	0x44, 0x05, 0x00, 0x15, 0x00, 0x00, 0x00, 0x00, 0x40, 0x1a, 0x14, 0x00,
> +	0x60, 0x06, 0x05, 0x06, 0x00, 0x20, 0x10, 0x01, 0x04, 0x13, 0x00, 0x00,
> +	0x20, 0x00, 0x00, 0x84, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0xe8, 0x00, 0x00, 0x00, 0x61, 0x81, 0x84, 0xa0, 0x03, 0x00, 0x00, 0x00,
> +	0x61, 0x00, 0x84, 0x68, 0x08, 0x05, 0x00, 0x00, 0x33, 0x24, 0x03, 0x80,
> +	0x02, 0x00, 0x00, 0x04, 0x0c, 0x08, 0x02, 0xf0, 0x00, 0x00, 0x00, 0x94,
> +	0x70, 0x84, 0x94, 0x80, 0x60, 0x86, 0x01, 0x00, 0x04, 0x04, 0x00, 0x16,
> +	0x34, 0x12, 0x34, 0x12, 0x20, 0x00, 0x80, 0x84, 0x00, 0x40, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0xa8, 0x00, 0x00, 0x00, 0x61, 0x00, 0x84, 0x68,
> +	0x0a, 0x05, 0x06, 0x00, 0x40, 0x00, 0x84, 0x68, 0x03, 0x03, 0x10, 0x00,
> +	0x33, 0x45, 0x03, 0x80, 0x02, 0x00, 0x00, 0x09, 0x0c, 0x0a, 0x02, 0xf0,
> +	0x00, 0x00, 0x00, 0x94, 0x61, 0xa3, 0x10, 0x00, 0xa0, 0x0a, 0x06, 0x0d,
> +	0x04, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x10, 0x02,
> +	0xa0, 0x0a, 0x06, 0x0f, 0x04, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x61, 0x00, 0x10, 0x00, 0xa0, 0x0a, 0x16, 0x0d, 0x14, 0x0a, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x61, 0x12, 0x10, 0x02, 0x20, 0x02, 0x16, 0x0f,
> +	0x14, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x1a, 0x54, 0x80,
> +	0x20, 0x02, 0x01, 0x00, 0x04, 0x03, 0x00, 0x52, 0x44, 0x05, 0x10, 0x00,
> +	0x52, 0x85, 0xb8, 0x28, 0x0b, 0x09, 0x04, 0x06, 0x33, 0x23, 0x15, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x24, 0x0d, 0x00, 0xf0, 0x14, 0x0b, 0x04, 0x90,
> +	0x20, 0x00, 0x40, 0x84, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x40, 0xff, 0xff, 0xff, 0x33, 0xc6, 0x00, 0x80, 0x01, 0x00, 0x00, 0x00,
> +	0x0c, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +};
> +
>  #endif /* __INTEL_COMPUTE_KRN_LOOP_COUNT_H__ */
> diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> index 4d69f270e9..155a3f0df4 100644
> --- a/lib/intel_compute_square_kernels.c
> +++ b/lib/intel_compute_square_kernels.c
> @@ -90,6 +90,10 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
>  		.ip_ver = IP_VER(35, 11),
>  		.size = sizeof(xe3p_kernel_square_bin),
>  		.kernel = xe3p_kernel_square_bin,
> +		.long_kernel = xe3p_kernel_count_bin,
> +		.long_kernel_size = sizeof(xe3p_kernel_count_bin),
> +		.loop_kernel = xe3p_kernel_loop_bin,
> +		.loop_kernel_size = sizeof(xe3p_kernel_loop_bin),
>  	},
>  	{}
>  };
> diff --git a/opencl/loop_noopt.cl b/opencl/loop_noopt.cl
> new file mode 100644
> index 0000000000..92fbee279d
> --- /dev/null
> +++ b/opencl/loop_noopt.cl
> @@ -0,0 +1,15 @@
> +/* Must be same as MAGIC_LOOP_STOP in lib/intel_compute.c */
> +#define MAGIC_LOOP_STOP 0x12341234
> +
> +__kernel void loop(volatile __global int *input,
> +		   __global int *output,
> +		   unsigned int count)
> +{
> +	int i = get_global_id(0);
> +
> +	while (1) {
> +		if (input[0] == MAGIC_LOOP_STOP)
> +			break;
> +	}
> +	output[0] = i;
> +}
> -- 
> 2.43.0
> 
