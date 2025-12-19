Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D9CD711D6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 08:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B3A10E4AC;
	Fri, 19 Dec 2025 08:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rf9qbjk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E5610E4AC
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766132289; x=1797668289;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9734DhjWqiMnHfuJ8RaMFnfguc3yyRncmqH870g0XeU=;
 b=Rf9qbjk10Q9dk6O4088q+j4GnBjJO4aRX8QUj+3gB5YkysgDAW0a2Iy2
 5dza8/pDzGED4KqmhNXxd+uWg4itkjogL+O06/p+i8xjJQthLcyDPdEPv
 3qnh1KQ8OHKhMki4NQZ81zYdRz2K48GvKhTKjmTILVIL6kaUZCRy0Uwi8
 ynVfGfGZcK2c4qWg0P5hGaqklAMhQB/g6ND80g5Vy/qyr5RunzWIwrwTH
 MTWBa89Fs4wN63hv6GpScQJPsJghKMD130BfB5MEd8MXWHOD2Rkhe6MWN
 6yJ1TVL9KcviH79tKba5wgQpurkRGQWeRRyzsslw8VkbLVO3KglO/767f g==;
X-CSE-ConnectionGUID: iICJFkTyS/aBftnvKhqBLw==
X-CSE-MsgGUID: pIJfGYm/TV+888CR5NWy+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="55668728"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="55668728"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 00:18:08 -0800
X-CSE-ConnectionGUID: i8e5KCnrSpOfjpeyFcowMA==
X-CSE-MsgGUID: AK1cKMUfQv6tfQKY4mqppg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199283438"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 00:18:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 00:18:07 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 00:18:07 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 00:18:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQDZOapEXS915RZCePB5Qch6OnnGVT2bUie1SK+9DBByH3GEQcvkmoKbNu8id+p8DXIdyDsBoBgXpAxV5lBrHJNvYR9S6BUPktSZt2dBCqNGQP5HeLT7s7iZfT4EyV6+oi72nBwbQQGckkkpK5QAvXvojpFpjE6b2MWG2Gc9EsriGO128UbFH85eO9XFIhJJ2cz0Fv/JMKJGWlmWOyVMQKOmN67lp3GrZlQxvswEgWo+rMc+7TTzN8TgZdafK2QaDEmVcIbBoG41qsryFzUEAcsLhRwcTSA33GRWp8C9uVD9Eosob4rfY5k3Sq1Ig/Px2uiGMT67glBnrXMiAfgBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dent4FLHbykDrqfHsPmsQrpFU6KTCZssUgPsGrh0jDA=;
 b=qUMIWtNR2446v9uzpXVmawhSu7P+M3PZe8+LRlOwUS5pJ2IrGYWwvcvH1sthuKyAwVBSZrVnuUWO26PSy1qqNndchJETkxdWBlUxjOPYlSlHGA0WdwhQvcjcFFN5mW0qhYD0mNtVvfSKq8F3i23SJSQq+DI9ukl9MCtEtB0oI1ZANRoQfPZHIlTGzu5YSlnlfdB99cjRtzsQ+YJPrzDFv8N341INu9XldDOhuc3RHgPSiJ47TY384MTnXVSZDKQjGfvex9/jpK8Hgqs3q4hZv+/0u0aJi483a88wvPPill0w9kl0LHA6gmOfEf12KOP2y8j7HPqnR9SXBMI70f/Bsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 by SA0PR11MB4624.namprd11.prod.outlook.com (2603:10b6:806:98::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 08:18:05 +0000
Received: from PH7PR11MB8033.namprd11.prod.outlook.com
 ([fe80::3aa3:869a:aaf2:c8dc]) by PH7PR11MB8033.namprd11.prod.outlook.com
 ([fe80::3aa3:869a:aaf2:c8dc%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 08:18:05 +0000
Message-ID: <14157c03-f8e5-4023-84ec-0edac1e67007@intel.com>
Date: Fri, 19 Dec 2025 00:18:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] lib/intel_pat: read Xe PAT config from debugfs
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>,
 <kamil.konieczny@intel.com>, <ravi.kumar.vodapalli@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
References: <20251217080732.266257-1-x.wang@intel.com>
 <20251217080732.266257-2-x.wang@intel.com>
 <20251217191535.GB1180203@mdroper-desk1.amr.corp.intel.com>
 <ec15d0f9-149b-45fb-b499-420d76f1f258@intel.com>
 <20251218222708.GM4164497@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20251218222708.GM4164497@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0031.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::44) To PH7PR11MB8033.namprd11.prod.outlook.com
 (2603:10b6:510:246::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8033:EE_|SA0PR11MB4624:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a783d6-c74d-426a-6c4b-08de3ed72267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|42112799006|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFArZmJkazhobGdnQTRLRkw1YlVnY0U3eFBkT2lvSExwQm9sbXdjRGwvU3RI?=
 =?utf-8?B?bThJVlVaYVVsSllXZHVFQkRDUGhzcnNQUENRaHFWK3JPRWJ5MXcwWEFnU3l5?=
 =?utf-8?B?QUR3ejVVL1NxV2NLcTByZFgzS2UyN3NqR0ZkOUE1czhjWm9xMUMrci9KRFlv?=
 =?utf-8?B?VFBOM2YvM0x5c0NFb3JETk9Nd3JSTmJMRHdvVDJiQS8vOFVPL1hKWG5aQ3ds?=
 =?utf-8?B?ZDdRRFJXOGhJLys2MjVhRDVDMnY3THVvR0JGZ21SckQvUHdjdnRzdjBzRWZo?=
 =?utf-8?B?SzhMNFZhRmk0SFBMalpKaWp4SDZLWGN4bzcrcUFaaStKN0d0ZzF1aWo3REZK?=
 =?utf-8?B?enFFeTdxaWpOS1ZBQmxVRjZ5SzZWUlhjelpRSXJibWw0YkFLWjhLVHk1Umlt?=
 =?utf-8?B?clJ1RFpiaFE0aExaUzU1REZZRzA2M2lQUW0zK2JaeFU5SG5EZEFnZmxZLysz?=
 =?utf-8?B?U1JjSEord2E0NUswaURKcXVZUUlNVmlCeW9NdDVNVVVzdXEzRlFWZUhzR1pn?=
 =?utf-8?B?OEx0UGlFVWlWVndGSUdpUDdhUFJqbjZCNERJUzcwRVFRdnNHaWhmenl6ZUQx?=
 =?utf-8?B?bmFsWlRSbWFvK1BxNFZIOUF4VENWSVFuMFZPeHQ5Rzh6VUlBMWg4ZXo1Skts?=
 =?utf-8?B?U3QyRGUrbE1LQ0dzZVo3R3B1K08ycHZ4ajh4NDlPTktDYzdtTHhqN1RiT0pz?=
 =?utf-8?B?SFE2ZEFXSGZoU0FCS0JVbW5nWkczVUVCYnl6RmxWS1RDN0Y2TDlDcFdWK3p0?=
 =?utf-8?B?Q00ySzZoMEs3bGN1NWQvbzZrQnNScjROaXhqaVRxdTZLbTNYcDkzcjk3WVIx?=
 =?utf-8?B?NEZmMmZCQW9QaGFvb09tejMwdmFpQ004SFp0R2Z2bjRTYXZ1czkybFNXdTlE?=
 =?utf-8?B?R3l4cDlsYllVSFdxaHpGaFVpZzRRVEdXeklrVFh4emNJYXIrdU13ajQxMzFW?=
 =?utf-8?B?bG96ZWt3ZWJBblZIeHM4eWtSeFhVVWU2VjJQaENrWEM2OGpRdEQzVDZqMmlE?=
 =?utf-8?B?L2t4SGQ0QmppakFwYVdZdGhCaEV5WUFKeE1ER1g0b09SODE3RTMyOXFXWmFR?=
 =?utf-8?B?U2JBWXlGQ1FJMTU2d2dwZWdkYWg5bi9XaStJRFg0bHBPQkVtVlhsNlU5MzlC?=
 =?utf-8?B?c1cyN3FIS2h2amxyNEJUNjV5WENrSnhLNkE3MDU3K3hpUTZldHVhWjhZQzRP?=
 =?utf-8?B?WndQeVVxbVZKVW00NUs2bU1mKzE2MzRsYjR1OGw5QU1rdjdXc1pqQmJMVllO?=
 =?utf-8?B?VDg3dS9YMkNZWFY1NkFadjJNL2x1NHhvcTNOejVQSGZEVnJ3dUFpMmtoTVpS?=
 =?utf-8?B?RHdCRFpVR2hCWlhSUjg5SDFhYmRKNm5mdlBJQytIbExvSUxlbytQNDh5NlpT?=
 =?utf-8?B?eEZEVmQrNW14ZDdKV1h3Njkyb3VMOFpXTkRzRVp2UG9uUUlpQ091ZXFPT1p1?=
 =?utf-8?B?L3B0dnRJZXlERUtYemVIejJFa3p6QmZQdGxJWUF6aXRBRURwdVZrVisxcVkr?=
 =?utf-8?B?aW9jZmt5ZEtONU9kL1pkckFxd25vWHppODdlbXllK3JZQStMQ1h2dDkwek1w?=
 =?utf-8?B?SkJRUFVmdGg1MnNsMWhvVWdPY1llalgxbEVwMTJZbFBLaDZtY3dRTlNWa2pa?=
 =?utf-8?B?eTNHUUxNTThjWTlNRmZIdlJCRWZSTjJDa1BicnB1NTRpbVF2QVRvT0FoK2FB?=
 =?utf-8?B?aUo4eHp1RHk2YnczcWpRQ0tENjRjMGwyUzIvcW9jS2c3d09tUHJLbjRKK1dL?=
 =?utf-8?B?Q2JJUnBDS0RDd29CblhFcWlGT205Tk5nUWt2a0p1dkh4RVp5cVVnT0ZXQU1n?=
 =?utf-8?B?WFBtSytaeW5HZWJ6NnhweTJ5ZTJpcVRCZVMrVi9sL2NMSzVGbU1xYVVycVhD?=
 =?utf-8?B?ZHRHZG1jL2VSZ1F2K2g1bXV3c1dYVytQcDkzS1hPcEpScDk5d0pmUm1DdFZx?=
 =?utf-8?Q?+/R1ZjQ0N+PgmFqxSMhSBsFnA6K//Qu/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8033.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU1mZEwzckd1dW1NUmpFK1RDdkNQQmVjZmYzNU56dmtBZ3pGU21ucTlyVkF5?=
 =?utf-8?B?WGRhWkl1YTJKYUZtQWtEb1dCZmV0WlBUelJKRmZtQ3FsMmFzYmwrY3Q4T2Q0?=
 =?utf-8?B?VEd0T0l4bHNLMEc1eEJxYUl2Q0c3RVRYc0Z0emFqYWZjSXdqVGFsQVB3RkxY?=
 =?utf-8?B?UmZ3VXYwZzA1ZmQ2dUFIV0FVcFRmN2F6dEdXcllwTkVjaGdwUTUyMXJqaURI?=
 =?utf-8?B?Q0RTZ2NjSVdMem82d29QS2JCSThmdyt0SmgyeWVSMVh4c3pzYlhMQUNHOVg4?=
 =?utf-8?B?OHVkcjQ3MGhpODg4eDMzNWh2K0VQK3Z0MElBZzJiUXBhOTE0M0Nmak9IUDhL?=
 =?utf-8?B?S0ZFeE91ZGQxKzhrTHZGTmdXeCtsUGZ4dk9xWTJoTzZMNW5jTXkxekZ4RURL?=
 =?utf-8?B?a09pRCtuZTEwWDZ2ZFNneHlXc054aDlsc0RoQ1NncWFRYTZsdUd1UjZSZXlw?=
 =?utf-8?B?SVpOUnNBcHVKa001SWw2dXZKQVVycmMzK0JZUUpVVExKY21wRkZKNTVlZy9a?=
 =?utf-8?B?VG02bXlWcS9ZclVVc1BuMG03Vzl0UkR6bUw4M1lXckYwSmxkeitsNmRMSzhF?=
 =?utf-8?B?c1Izd2w2MFRNeVZJbGY3cFBVK0R3bzQzdHNIaWsxSVAzbEpwZFYwT1FhNVE3?=
 =?utf-8?B?dnNsWGxnd000WEcrZlFGRHlQNXJRMWR1dE94REdCL2tDSU5GclJiQXo4aG14?=
 =?utf-8?B?aTcrYVZKZm41cEx1NW9LL0RBaGNleld1SEhGVThGcWtXdnFFU0ZTWWFETWth?=
 =?utf-8?B?Z3ZNem92VTFwOWhhZFl6aHFsdnNCTHFaZjJ4djJGNG9adUZPN0lZRjdSSzNU?=
 =?utf-8?B?V3ZZKzFGejhHWnJmZ1o0TmtrQ3Fmdnc5aXl1eEpRcDAwSk8rS1RPejhWM0ZB?=
 =?utf-8?B?Zm1hU2tmMzVDUmV6cWNLWVFlSEZBSWhjWTZOeUFVcHFPaUpOdkRYQVY5Z3Jo?=
 =?utf-8?B?MTJYTjdVMUFPL0RhTHdIWmdzellWYUFqb0lvdlBqdTJEbVpYbXpqTU5NSlEv?=
 =?utf-8?B?VzRkZVNjQUN4d0NhOVZKb3JUT3dDYXd1bFJkalBlUnE0TTZXZ0JweDl1eUZt?=
 =?utf-8?B?ZVdFNzBaakE5NmZhVXNWK0NQd09ORy9yZkJVNWhzOFFSUVF6eG1aYVVVeXFz?=
 =?utf-8?B?Z0hXbDRHb09qRmRkUHBqdE5teitzUEpBMFZPVWZ1VzVkcnlFVzFkYTNjUm1l?=
 =?utf-8?B?L0JwN21PQ2taZ1lEd1ZMVi9OaW83d2dFZ3ZoVVh5azVwTzZBejZFUXBSVENK?=
 =?utf-8?B?WEI3N2RZai84WGpKR1c3V1Z0a3B4cXN5VWlPUXJyUlV6d0JnTGVFd2ZDelR3?=
 =?utf-8?B?ZU1YT2FRSG1aaFpWT3dBNGZJSEQyQ3o1NmJzdENpc3BxK1lVcTV6ZXI2c2hO?=
 =?utf-8?B?U2E0SHVTVmRlMGRKcXI3dFN4R3g3dTNhanBsQmxGYTBYMzZBaWFwd01Xd2R4?=
 =?utf-8?B?Tk1YU0xFYk5vQTNHNnlxRXpMTml5RG1vNmRTRXN3NkhoY2tnQnh0aEpsb095?=
 =?utf-8?B?Tkh4QU45WDJrMXdJWE51M3Q3dUlEZzZPK1dscFl4SnF5dmNVVnpkKzRDeGlo?=
 =?utf-8?B?WTBNekJCanY0S3FrUjRQTCtHSnM4bUIvNWNUaERmQTlla3JaSXVablU2L2p4?=
 =?utf-8?B?QnFNbjVwQnBPbjVRamljRjkyQTlra3h3ZC83eWxOMlRJNUJSZzlDM0ZDZlI0?=
 =?utf-8?B?bER3SjhGdFlNRitCTlRncmszYlRBbU4yLzhTMllqV0g1blJPOHpjdkd5VUwr?=
 =?utf-8?B?QTNXL1BqNWhMNDhQVEhhbmVyU0NSWTU3bzJncCtsOHRLdnlkREliYmR0N3d2?=
 =?utf-8?B?RHlyaEgrNE1SWEZpcVNBNHljUzlBcTM3dkNnVkNBVUdlK24rOUV5NmFJSG9M?=
 =?utf-8?B?MjhpMXNpWDBrWmFsYnFiUVVXalRvemVCaHVlUjBtVUtrK2ZUbVBFUWVtcEU4?=
 =?utf-8?B?WExpd2U0b3hkek1NNU5rTFlwcEtoMi9EZ040NnBLK09nTVVMSFprd2NEVWc0?=
 =?utf-8?B?Yit6L1I5T3hqZHdTTWRvczFMd2tPdllOOXgwRG12aEZ2Nk5McmRtbTFOWkdq?=
 =?utf-8?B?Q0grRkM5eWFnRkdld2ttWG5VZzVQanlZSUdEUXNYODBuYlY0QjNXSTVBaHpt?=
 =?utf-8?Q?kHIPHxtWBlAwwHRtzWKaTSMHN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a783d6-c74d-426a-6c4b-08de3ed72267
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8033.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:18:05.1734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5qgHmUFKwvG67o+IvhClz4IrDmrAksZ158MWciN6iPqzQZ72TCeNhRO9AaSn71t880Fp6HPkCIMpamZN0kvRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4624
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



On 12/18/2025 14:27, Matt Roper wrote:
>>>> <cut>
>>>> +/**
>>>> + * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
>>>> + * from debugfs
>>>> + *
>>>> + * @drm_fd: DRM device fd to use with igt_debugfs_open
>>>> + * @xe_pat_cache: Pointer to a struct that will receive the parsed PAT configuration
>>>> + *
>>>> + * Returns: The number of PAT entries successfully read on success, or a negative error
>>>> + *          code on failure (-ENOENT if debugfs is missing, -errno otherwise)
>>>> + */
>>>> +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
>>>> +{
>>>> +	char *line = NULL;
>>>> +	size_t line_len = 0;
>>>> +	ssize_t nread;
>>>> +	int32_t parsed = 0;
>>>> +	int dbgfs_fd;
>>>> +	FILE *dbgfs_file = NULL;
>>>> +	static __thread struct intel_pat_cache cached_pat;
>>>> +
>>>> +	/* Return cached value if already read for this thread */
>>>> +	if (cached_pat.max_index != 0) {
>>>> +		*xe_pat_cache = cached_pat;
>>>> +		return cached_pat.max_index + 1;
>>>> +	}
>>> I'm not sure we really need to worry about caching the results here.  Is
>>> this getting re-called repeatedly in a single test to the point where
>>> it's creating a real performance problem for our tests?  If not, we can
>>> probably just keep it simple and re-read the debugfs if this function
>>> gets called multiple times.
>> The main reason for caching in xe_get_pat_sw_config() is not performance,
>> but
>> correctness in the presence of privilege changes. In
>>
>> igt@xe_oa@unprivileged-single-ctx-counters
>> igt@xe_oa@mmio-triggered-reports
>> igt@xe_oa@mmio-triggered-reports-read
>>
>> these tests drop root privileges mid-run; after that, accessing debugfs can
>> legitimately fail, and without caching the PAT layout we can end up
>> re-parsing
>> (or failing to parse) the table later in the same test run even though it
>> was
>> available earlier.
> This sounds like a bug in the tests themselves.  As Zbigniew said, the
> tests need to be fixed to obtain the information they need before they
> give up the ability to access it.  I don't think we want to be adding
> workarounds to the library itself when fixing the tests would be a
> cleaner and simpler solution.
>
>> My current approach is a compromise with some trade-offs.
>>
>> On the first open of the device fd, we try to read pat_sw_config from
>> debugfs
>> once and cache the parsed result in the xe_dev structure. After that, we try
>> to rely on the cached xe_dev from cache.map rather than reopening and
>> reparsing
>> the debugfs file repeatedly.
>>
>> However, if a test doesn’t actually use the PAT table (or is running on a
>> kernel that doesn’t expose/support pat_sw_config), then forcing a hard
>> failure
>> during xe_device_get() would be unnecessary and could cause unrelated tests
> I don't think we need to put everything into xe_device_get().  That
> function is mainly collecting information acquired via the ioctl query
> interface, which mimics what "regular userspace" would do.  In contrast
> PAT information comes from debugfs which is a test-specific backchannel
> (regular software shouldn't be using it) so I think it's fine to acquire
> it separately and explicitly in the tests that want it, and to require
> that tests that want it grab it before they drop privileges.
>
Thanks Matt — agreed that xe_device_get() should stay focused on 
ioctl-query state, and debugfs is a test-only backchannel that shouldn't 
become a hard dependency of generic device bring-up. The tricky part is 
that PAT is not only consumed directly by tests. There are multiple 
library call paths that end up calling intel_get_pat_idx_*() implicitly 
(e.g. VM bind defaults to intel_get_pat_idx_wb(fd) when callers pass 
DEFAULT_PAT_INDEX, and similar logic exists in other common helpers like 
bind/copy/blit/buf init). In those cases, a test author may not have a 
clear place to "prefetch PAT before dropping privileges," because the 
dependency is hidden behind the lib call chain. Because of that, we 
still need a library-level "ensure PAT" mechanism. Storing the parsed 
PAT table as per-fd state in struct xe_device provides a single, 
consistent cache for all library users (and avoids global/static 
caching, which is important for multi-GPU). So I think a pragmatic 
approach is to try to prefetch pat_sw_config into xe_dev when 
xe_device_get() is called. This makes PAT available before any privilege 
drop and before any indirect lib call path. If PAT is still missing when 
intel_get_pat_idx_*() is called, we can then igt_require_f() there since 
the caller truly depends on it.

Related lib call paths that can reach intel_get_pat_idx_*():

lib/igt_draw.c		igt_draw_rect() -> intel_get_pat_idx_uc(fd)
lib/igt_fb.c		do_block_copy() -> intel_get_pat_idx_uc()
			igt_fb_create_intel_buf -> intel_get_pat_idx_uc()
			blitcopy() -> intel_get_pat_idx_uc()
			
lib/intel_blt.c		blt_create_object() -> intel_get_pat_idx_uc_comp()
	     blt_surface_get_flatccs_data() -> intel_get_pat_idx_uc_comp()

lib/intel_bufops.c	intel_buf_init()
			intel_buf_init_in_region()
			intel_buf_init_using_handle_and_size()
					    -> intel_get_pat_idx_uc_comp()
lib/xe/xe_util.c	xe_alloc_bind_ops() -> intel_get_pat_idx_wb()
lib/xe/xe_ioctl.c	___xe_vm_bind() -> intel_get_pat_idx_wb()
lib/xe/xe_legacy.c	xe_legacy_test_mode()->intel_get_pat_idx_uc_comp()

Xin

> Matt
>
>> to abort/skip. To avoid that, I changed the logic in xe_device_get() to only
>> attempt to read the PAT config and tolerate failure there. We only report
>> an error later, when a test actually calls intel_get_pat_idx() (i.e., when
>> PAT information is truly needed).
>>> I think we should really try to minimize / eliminate the whole "use a
>>> static variable as a cached result" pattern.  It leads to inconsistency
>>> (and possibly mistakes) when we implicitly cache some types of lookups
>>> that IGT libraries do, but not others.  And honestly using static
>>> variables this way just feels kind of hacky.  I think needing to add
>>> implicit caches like this is really more a signal that the function
>>> interface we're using isn't very good and could use some refactoring.
>>> For example for the PAT stuff, we currently have a bunch of API's that
>>> take a device (fd) as a parameter and return one little piece of
>>> information.  If we want to improve that and eliminate redundant
>>> querying/parsing, it would be better to recognize that if a test/tool is
>>> working with PAT in the first place, it's likely to need several pieces
>>> of PAT information and define our library API accordingly.
>> Regarding the “static variable as a cached result” pattern: I agree it’s not
>> ideal.
>> Longer-term, we should move toward a more natural API where callers fetch
>> the PAT
>> table once (or xe_dev provides an explicit “ensure/prefetch PAT” helper) and
>> then
>> query UC/WB/WT/etc from that in-memory table. I can follow up with such an
>> API
>> refactor; for this series I tried to keep the change minimal while fixing
>> the
>> privilege-drop correctness issue.
>>
>>
>>> For example, if a test wants to get the UC, WB, and WT PAT indices,
>>> today it does something like
>>>
>>>           pat_uc = intel_get_pat_idx_uc(fd);
>>>           pat_wb = intel_get_pat_idx_wb(fd);
>>>           pat_wt = intel_get_pat_idx_wt(fd);
>>>
>>> which triggers three separate debugfs open+parse operations unless we do
>>> some implicit caching inside the PAT library.  I think it would be
>>> better to just redefine the library interface to something more natural
>>> like:
>>>
>>>           pat_table = xe_get_pat_sw_config(fd);
>>>           if (!pat_table)
>>>                   // error
>>>
>>>           pat_uc = intel_get_pat_idx_uc(pat_table);
>>>           pat_wb = intel_get_pat_idx_uc(pat_table);
>>>           pat_wt = intel_get_pat_idx_uc(pat_table);
>>>
>>>           free(pat_table);
>>>
>>> so that the data is only queried once, and then the caller is empowered
>>> to manage its lifetime and do further caching (e.g., stashing the whole
>>> table in a 'struct xe_device') as it sees fit.
>>>
>>>
>>> Matt
>>>
>>>> -#include "igt.h"
>>>> +	dbgfs_fd = igt_debugfs_open(drm_fd, "gt0/pat_sw_config", O_RDONLY);
>>>> +	if (dbgfs_fd < 0)
>>>> +		return -ENOENT;
>>>> +	dbgfs_file = fdopen(dbgfs_fd, "r");
>>>> +	if (!dbgfs_file) {
>>>> +		close(dbgfs_fd);
>>>> +		return -errno;
>>>> +	}
>>>> -struct intel_pat_cache {
>>>> -	uint8_t uc; /* UC + COH_NONE */
>>>> -	uint8_t wt; /* WT + COH_NONE */
>>>> -	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
>>>> -	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
>>>> -	uint8_t max_index;
>>>> -};
>>>> +	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
>>>> +	while ((nread = getline(&line, &line_len, dbgfs_file)) != -1) {
>>>> +		uint32_t value = 0;
>>>> +		char *p = NULL;
>>>> +
>>>> +		/* Expect patterns like: PAT[ 0] = [ 0, 0, 0, 0, 0 ]  (     0x0) */
>>>> +		if (strncmp(line, "PAT[", 4) == 0) {
>>>> +			bool is_reserved;
>>>> +			p = strstr(line, "(");
>>>> +			if (p && sscanf(p, "(%x", &value) == 1) {
>>>> +				if (parsed < XE_PAT_MAX_ENTRIES) {
>>>> +					is_reserved = strchr(line, '*') != NULL;
>>>> +					xe_pat_cache->entries[parsed].pat = value;
>>>> +					xe_pat_cache->entries[parsed].rsvd = is_reserved;
>>>> +					xe_pat_cache->max_index = parsed;
>>>> +					parsed++;
>>>> +
>>>> +					igt_debug("Parsed PAT entry %d: 0x%08x%s\n",
>>>> +						  parsed - 1, value,
>>>> +						  is_reserved ? " (reserved)" : "");
>>>> +				} else {
>>>> +					igt_warn("Too many PAT entries, line ignored: %s\n", line);
>>>> +				}
>>>> +			} else {
>>>> +				igt_warn("Failed to parse PAT entry line: %s\n", line);
>>>> +			}
>>>> +		} else if (strncmp(line, "PAT_MODE", 8) == 0) {
>>>> +			p = strstr(line, "(");
>>>> +			if (p && sscanf(p, "(%x", &value) == 1)
>>>> +				xe_pat_cache->pat_mode = value;
>>>> +		} else if (strncmp(line, "PAT_ATS", 7) == 0) {
>>>> +			p = strstr(line, "(");
>>>> +			if (p && sscanf(p, "(%x", &value) == 1)
>>>> +				xe_pat_cache->pat_ats = value;
>>>> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE]", 18) == 0) {
>>>> +			p = strstr(line, "=");
>>>> +			if (p && sscanf(p, "= %d", &value) == 1)
>>>> +				xe_pat_cache->uc = value;
>>>> +		} else if (strncmp(line, "IDX[XE_CACHE_WT]", 16) == 0) {
>>>> +			p = strstr(line, "=");
>>>> +			if (p && sscanf(p, "= %d", &value) == 1)
>>>> +				xe_pat_cache->wt = value;
>>>> +		} else if (strncmp(line, "IDX[XE_CACHE_WB]", 16) == 0) {
>>>> +			p = strstr(line, "=");
>>>> +			if (p && sscanf(p, "= %d", &value) == 1)
>>>> +				xe_pat_cache->wb = value;
>>>> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE_COMPRESSION]", 28) == 0) {
>>>> +			p = strstr(line, "=");
>>>> +			if (p && sscanf(p, "= %d", &value) == 1)
>>>> +				xe_pat_cache->uc_comp = value;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	free(line);
>>>> +	fclose(dbgfs_file);
>>>> +	cached_pat = *xe_pat_cache;
>>>> +
>>>> +	return parsed;
>>>> +}
>>>>    static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>>>>    {
>>>>    	uint16_t dev_id = intel_get_drm_devid(fd);
>>>> -	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
>>>> -		pat->uc = 3;
>>>> -		pat->wb = 2;
>>>> -		pat->max_index = 31;
>>>> -	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
>>>> -		   intel_get_device_info(dev_id)->graphics_ver == 20) {
>>>> -		pat->uc = 3;
>>>> -		pat->wt = 15; /* Compressed + WB-transient */
>>>> -		pat->wb = 2;
>>>> -		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
>>>> -		pat->max_index = 31;
>>>> -
>>>> -		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
>>> '> -		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
>>>> -			pat->max_index -= 4;
>>>> +	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
>>>> +		struct xe_device *xe_dev = xe_device_get(fd);
>>>> +		memcpy(pat, &xe_dev->pat_sw_config, sizeof(*pat));
>>>> +		if (pat->max_index == 0) {
>>>> +			/* If PAT info is not available, try to read it now */
>>>> +			igt_require_f(xe_get_pat_sw_config(fd, pat) > 0,
>>>> +				      "Unable to open the pat_sw_config file in debugfs.\n");
>>>> +			memcpy(&xe_dev->pat_sw_config, pat, sizeof(*pat));
>>>> +		}
>> In the next revision I’ll simplify this block to only fetch/require the PAT
>> config into xe_dev->pat_sw_config when needed, and then do a single memcpy()
>> into the caller’s pat:
>>
>>          if (xe_dev->pat_sw_config.max_index == 0) {
>>              igt_require_f(xe_get_pat_sw_config(fd, &xe_dev->pat_sw_config) >
>> 0,
>>                            "Unable to open the pat_sw_config file in
>> debugfs.\n");
>>          }
>>          memcpy(pat, &xe_dev->pat_sw_config, sizeof(*pat));
>>
>> This keeps the same lazy behavior (no hard dependency during
>> xe_device_get()),
>> while making the flow clearer and avoiding the redundant memcpy().
>>
>> Xin
>>>>    	} else if (IS_METEORLAKE(dev_id)) {
>>>>    		pat->uc = 2;
>>>>    		pat->wt = 1;
>>>> @@ -96,3 +177,16 @@ uint8_t intel_get_pat_idx_wb(int fd)
>>>>    	intel_get_pat_idx(fd, &pat);
>>>>    	return pat.wb;
>>>>    }
>>>> +
>>>> +uint8_t xe_get_pat_entries(int drm_fd, struct xe_pat_entry *entry)
>>>> +{
>>>> +	struct intel_pat_cache pat = {};
>>>> +	uint8_t max_index;
>>>> +
>>>> +	intel_get_pat_idx(drm_fd, &pat);
>>>> +	max_index = pat.max_index;
>>>> +
>>>> +	memcpy(entry, pat.entries, (max_index + 1) * sizeof(*entry));
>>>> +
>>>> +	return max_index + 1;
>>>> +}
>>>> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
>>>> index eb48cbc65..48ee10c0e 100644
>>>> --- a/lib/intel_pat.h
>>>> +++ b/lib/intel_pat.h
>>>> @@ -6,9 +6,27 @@
>>>>    #ifndef INTEL_PAT_H
>>>>    #define INTEL_PAT_H
>>>> +#include <stdbool.h>
>>>>    #include <stdint.h>
>>>>    #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better */
>>>> +#define XE_PAT_MAX_ENTRIES 32
>>>> +
>>>> +struct xe_pat_entry {
>>>> +	uint32_t pat;
>>>> +	bool rsvd;
>>>> +};
>>>> +
>>>> +struct intel_pat_cache {
>>>> +	uint8_t uc; /* UC + COH_NONE */
>>>> +	uint8_t wt; /* WT + COH_NONE */
>>>> +	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
>>>> +	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
>>>> +	uint8_t max_index;
>>>> +	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
>>>> +	uint32_t pat_mode;
>>>> +	uint32_t pat_ats;
>>>> +};
>>>>    uint8_t intel_get_max_pat_index(int fd);
>>>> @@ -18,4 +36,7 @@ uint8_t intel_get_pat_idx_wb(int fd);
>>>>    uint8_t intel_get_pat_idx_uc_comp(int fd);
>>>> +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache);
>>>> +uint8_t xe_get_pat_entries(int drm_fd, struct xe_pat_entry *entry);
>>>> +
>>>>    #endif /* INTEL_PAT_H */
>>>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>>>> index 981d76948..a456aa44e 100644
>>>> --- a/lib/xe/xe_query.c
>>>> +++ b/lib/xe/xe_query.c
>>>> @@ -299,6 +299,12 @@ struct xe_device *xe_device_get(int fd)
>>>>    	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
>>>>    	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
>>>> +	/* Populate PAT software configuration */
>>>> +	if (xe_get_pat_sw_config(fd, &xe_dev->pat_sw_config) < 0) {
>>>> +		/* If PAT info is not available, zero it out */
>>>> +		memset(&xe_dev->pat_sw_config, 0, sizeof(xe_dev->pat_sw_config));
>>>> +	}
>>>> +
>>>>    	/* We may get here from multiple threads, use first cached xe_dev */
>>>>    	pthread_mutex_lock(&cache.cache_mutex);
>>>>    	prev = find_in_cache_unlocked(fd);
>>>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>>>> index d7a9f95f9..12cae99d9 100644
>>>> --- a/lib/xe/xe_query.h
>>>> +++ b/lib/xe/xe_query.h
>>>> @@ -12,6 +12,7 @@
>>>>    #include <stdint.h>
>>>>    #include <xe_drm.h>
>>>> +#include "intel_pat.h"
>>>>    #include "igt_aux.h"
>>>>    #include "igt_list.h"
>>>>    #include "igt_sizes.h"
>>>> @@ -74,6 +75,9 @@ struct xe_device {
>>>>    	/** @dev_id: Device id of xe device */
>>>>    	uint16_t dev_id;
>>>> +
>>>> +	/** @pat_sw_config: Xe PAT software configuration */
>>>> +	struct intel_pat_cache pat_sw_config;
>>>>    };
>>>>    #define xe_for_each_engine(__fd, __hwe) \
>>>> -- 
>>>> 2.43.0
>>>>

