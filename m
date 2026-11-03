Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FAF606A326
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 02:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HrdVYOmi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B3810F31B;
	Tue,  3 Nov 2026 02:31:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D189810F31B
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 02:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793673052; x=1825209052;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DF2Xj2PS8QZ92fGvUV+SDo9c1kmTH3OjE9bjddYf3o8=;
 b=HrdVYOminyqg7KNi8LAFojBGV5ILdIEsnl5BEMWniUDvbUZvp4O0rAZ5
 jHZYy5Yv1DJSeMrOmfpZLI9aCtKnXcMwRLpIaOQiXMwsGtCGRdTCONd82
 a+PodJUAPYn8ko60F7uEspNZFVSGfAfKJTv/qAVLoy0cwyT1ifWGtJ7n4
 jpr6uicae5N/67kuggKQ/n375A7x2Me3QWoJKVRDADrv/NHZPEu9zNXPl
 e1MZW1r18nc2q/BTx7fTK6hzIeT3kBDtCfm1Xylh1ugFVHq1o6N1cO4We
 eZimz9AYOPsbzvO4AEpyrApjB7qcjJebrFaY8I5jmmJ4Diojpp5RAvu8R A==;
X-CSE-ConnectionGUID: BqJhHbdKSSGbxMHQFJU6oQ==
X-CSE-MsgGUID: suSmOd/KQGKBzEpxQEZ0Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2414858"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2414858"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 18:30:51 -0800
X-CSE-ConnectionGUID: 81zNNXoSR3yMgc2E1jut7g==
X-CSE-MsgGUID: JJmhRQWVQdi0mHkhBohOcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6129267"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 18:30:52 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 18:30:50 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 18:30:50 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 18:30:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kz8NDvQ3tY0wKqHqo2jn53UIzpej6U41Rph+0abJe8D3Y01bgfGy36Ep+bEEgeitL+PWc9BQVHB8aOHvftOMMOZfkL0IgM6RSG3osF3ZIRtFGa3RnCnxrrOE9sX2hkidf8FBLG3jieRjGIeoiVbFcwgrBw/cVJAo+Za0KYIqJV/MhzPBCvz1k6KL3lOJL0oJCLHkwFMQ5Ty1GtDDwsKQ8XwNl3Hrb+JF54K3PgAk82rBIKwnu8S1Q+FkR+vrzzMGuN/UU54p2fZCc3Bli44dJET/+Jg6eMDElZ5BeeHA2mFMcA5/hp3Ub/CsBG8rWsC7PHhCr8VmxqUvQC/q0pQLpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGlmOHEhA2oViMieMq4svC7pBOVbfQqolUvB3hJJm8Y=;
 b=yW3VRzcJ647YswpSpl05KFIRtjh5M32yKSCaMiwYIVucl6+RqTkFlZj7OEgDjiAYqjFgRKzv6GBMIX5wCcoOUmpy0j/MU3fsg8iA52a/7oLrZoL7MFa/GLEvnHdUrBL29d40OHWY37LS4KWmFCgVS/mj6gt5eLKjk/gMvGYUJz/T7S3tNxnWizgBy71vl0NAUSb5Z9qpw+XhR3HcQhwvG+p2LWyqGCkU+3m9Am2VmdIedgqdUNr2NVifNqmPJo9Y/TKAZGe7UOAvM7Cf/z9Yv/B6dWudDtvlOv5qnsk+wI7QGyBHc1cjq4BBvGJpD+ftx00GyB2sOL76WB9w/0tAfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by DS0PR11MB8231.namprd11.prod.outlook.com (2603:10b6:8:15c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 02:30:47 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 02:30:47 +0000
Message-ID: <d341857e-ba9e-4aad-8f63-71df5e151cf5@intel.com>
Date: Tue, 3 Nov 2026 08:00:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] tests/intel/xe_oa: Move device setup and teardown
 into helpers
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <harish.chegondi@intel.com>, <riana.tauro@intel.com>
References: <20261030224011.2268663-5-umesh.nerlige.ramappa@intel.com>
 <20261030224011.2268663-6-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261030224011.2268663-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0187.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::9) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|DS0PR11MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f755d1c-c81c-431f-9db7-08df395277b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|22082099003|261102123227099003|18002099003|56012099006|4143699003|11063799006|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261022075727099003|261026121527099003|261022113327099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: QFDu+Xr6RkLegMWYF+rrmicO/Zyt/JeHdgHvMRDj3q9eeBDahF0Jd1y1Lmire9SwLuDM1AQju74dTxzU6MCa04Es1pwwTifJtd0Z3Iqrz0qd0zVKAabiUxlZ/9gHEm5bL1/YDv6ityZaFXveLcjdZYCswiPbcM2wXohRqKejgdFZcJbMUa1GYVuYDfHhyQrGzp1WfMih34FFLS/UYqAIvNj5Vohx/3vXqg4QJ5M2x53SWyxxtAqZOoemM28Cwf2ks/yPqnzn5a4FS2sjRaTryXwZ+V2kVIpM4OEOKwgwBBSnhaOHNZCu+SgThEywyp/RaMg02svJTfiPNf0WiPVfbLgFUi50nvpeu/Dt/UVac1uGsCxVmR9hzsqn/xuON5Lr3Zo3DFl1SFZs9Xyc+6l5DkSksNratmjikJ6+wcOBYqtwECmHYc/q+BO0uCaIcnM4TKcAgwofMa4+N6t2rlNJ8R/fl+AYU3Ygs1kWyCVcQtlBzX8nwHYbG9ZqsZMyed/R2b5p9z6glg72OXhjznIXYGUmy5d5ofI+5o4Ki6RjI1ABni3HF/Pi9JsG1uENtZDoVbG0E7Ph8pcNX/ic3FW8tOvZvH7tsSVeiJ4nRsFPXeTYjpe+SuQ1DQrUrC2Tpu+/JuWX7vh8jGxFHNyUj2tbl1y66tIr5ifobWCtP8I8Fms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(261102123227099003)(18002099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022075727099003)(261026121527099003)(261022113327099003)(261009223027099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVljdnRLaXV6NDJpQVJVVUZJMXorT2RUUUZabklNa01ZeHh4VUVWdXhCeHlu?=
 =?utf-8?B?MzJjVUkwN2JiNHRlTldpSzRZbjhKK0hhTzdaclllTVpZazloMTYxNXZjdW5a?=
 =?utf-8?B?Rk5NSS9kVmRlMjc0cjlGL3dzcUczTUFvaG0veW5WUXBRTmR4Nm1NUUJJdnVm?=
 =?utf-8?B?dzQ4SkJhTC9SNjR1RTAyOU5FZUNVbjUxYzhNdHNCdngzaE1aNEpMby9sL3NN?=
 =?utf-8?B?TTkyd2VHbGE5S3UzL01TVWZUZjBVeStvTHRDTTlndU5Uc3ZjeVNYalVOc1JP?=
 =?utf-8?B?RWtMcWNTSi9hcmJsblJpN0tPR1IrMEwvSHhqR2tuaWRCWDNFd1RpaUJMSStn?=
 =?utf-8?B?MlYvb0JPUHBZMWJQMDlqMEZ0UlZjNm43Q3dpeDMwd253aFB1TkRwdkxTNmlQ?=
 =?utf-8?B?Z0xKN3h6dmpsK0llMTZuNFQ4azVpVnNUQTRQZkJnOERkc2NiTGNRb2NPR0xM?=
 =?utf-8?B?aHNoanUycjRKdEdOYW80UXR3bXZheUhuVWtuSjIyV2RxMUNhS3huejVTNGlW?=
 =?utf-8?B?KzZ2Ylg5MG9aT3g3KzV3cjFCTDVRR0tlY3FQL2hZVVU3ZkFpK1dWZDFMaVpm?=
 =?utf-8?B?SkRMTGt4M3B5ZnBZdjFWRHl5OGpEUkRzOUlHK05MVlV1OGlIRFZiN3VCK3lv?=
 =?utf-8?B?cWx5c0VsNi9lWjlZZVFKeHYzRnp1clRtdml1My9BcUJRS0tOazB5bTBNVWZi?=
 =?utf-8?B?UGp0VFFmTjhyWS8wMlNkYlpnV1RXNCs4dVBtSndlV2RKWHIrZEgyamhUeG9F?=
 =?utf-8?B?cFVQN1Z0M2R6blByRk0yV1lBcGNlcDZiTUE2RUhvdFoybzNCcFgxMUtRQkc4?=
 =?utf-8?B?d3lLa0M2OG1TMytKZjZxTWRpNWFIbDlDSVhTTnVBazhlb0VsaForbWU3MVhq?=
 =?utf-8?B?WC8vVTQzNldocWVaYjFTWUFVMWtpTWZadmhnTDZGVElySlArU1hVd2twSVNy?=
 =?utf-8?B?R0pyZUtjNkk3V3UzZjRjQThPbkRlaWJIdkFHTnJKMUlaMld2cVJnQXJCVTVG?=
 =?utf-8?B?ZWpENFlBU25ONEdMcklqN1dxUXFsN3Q2eDVaZXU1U3dybEFwQjhQNjg1bFlC?=
 =?utf-8?B?dHU1RTdUQXpUNGtSSkFVdmF2WS8zRlpubW8wOHV6MmlTZElXOWsxRDVzWHJP?=
 =?utf-8?B?ODRhTTBhOElSamg2UnFnNEJBVWxZN1JFOVoza1hhY05SM1k3QXBOTWlENnd1?=
 =?utf-8?B?bkxGaURhYTF1c3JQMmYrK0plVnlsU211eGhzOFNBcWJPd1hVdVNBWS9tbW9X?=
 =?utf-8?B?aXdJUFZtNUI1cENRVnVaWE00NFd2dTI2WWJhT01URFc5dWZIYmJKM2d4TExq?=
 =?utf-8?B?UTFYd1FJRGVtQ3NWL0FXYnRJK2xmRGU4TU51RnBzSGU3b1Z5NXJjb3hOY1Aw?=
 =?utf-8?B?RDJBQUV3cXNOMlI2bUM3ZW9oRnk4cm91dXBUR20zQUoyUnFHV2gyL2pwZ0xC?=
 =?utf-8?B?OG1oai80Nk1vNWxDc041dmdxYXNFa1Y2eTZEU2o0YXY5b3VTYkVZbzRrazgr?=
 =?utf-8?B?TVhKc01Ibnk2Nm9QSEhRK2ZKV3dpRmhCdjBYaUVmQTJrREsvK0ZhWjFrZUxQ?=
 =?utf-8?B?UDkyRFFMUUZrazZKNDk1dStuNUd2TzVSOWN5UElKbWswbE82MTQvaUdWcjFQ?=
 =?utf-8?B?VjJpZWF2MjlQSjl4T3pwa1JhYmdpczR4NjJxdTFqajlvL3h0S0ZYdGtIRHBE?=
 =?utf-8?B?TTVxcFhyQmozek1xQXNRZjlDYkZHaU5WcFFuOHJUZVMvUTYzSWljYzBncXp6?=
 =?utf-8?B?d0VNUHdvVG9TNWtjL2dhdDAzQ0JjUHZIU2tPOVVUcjdsNHIvNW9mYmNzdVJj?=
 =?utf-8?B?MUVsakxoNGZITmhMQ0RKYlZMSU00cFdnWkNCVVBTZ3hMTU5hTUk5UVNjWGU2?=
 =?utf-8?B?NWR5Vkl2VE81QUpwQW1iVUs5ZmhHZE1XN210WUZmS3o0OGc2S0dOM2VtOEJU?=
 =?utf-8?B?bHpSaC9Ec1ZZRE9kMlYyUTVYWlZ3UVkxMDBNaGZ4b2Zub1hUZElFWnkyWW9l?=
 =?utf-8?B?aWNtZzVLSlY4S2dyakpCK3h2cWtJNHYvYXJUYkh3STgvcyt3UjVtQ3Rmd0ZQ?=
 =?utf-8?B?cC8ydUFJOWJvZG13NVdXODFOSXNKQm10bnlIaW1zRHgvbGNjVEZTRm9SSHhi?=
 =?utf-8?B?ZGRiT2dnSTVaeUpsU3RKeWRDZjkxZW91KzhBV0RobHZDUVBWd3hRMGRhWlRl?=
 =?utf-8?B?UVM2Vjk5TFBVOGxmSkRpYVEzSzZGb0ptN2RWYjZhRFBvQW03L1h0TmhJcGNy?=
 =?utf-8?B?Q21MZmVCUE9lL0FMSk5zV1hPUGRBZHBNNm5KUlExdXNNSGRQREJBQ3Mvak5Z?=
 =?utf-8?B?cWdXdGpYWUJkN2VYcDUzbG8xekExdEhWc0xyM29TMGhqOWQ4SHVVeVVuN0lj?=
 =?utf-8?Q?5XF0CfsdjNpd+/Jo=3D?=
X-Exchange-RoutingPolicyChecked: 1wqcFFVncRbN0BiAkEPqR9ggjHbLDODNH+fEffzZqOuKb+IXgJIX11HJgKxJ7mNvqCiaqKQCgzeq3Vz8M57iRDlW+cHiwPuz+qrBT9UT0C5iPgmlfd58jm0vLevccXVNWDgL9x5UICD+jxWrYsqyEj+udn3HQ0QLqJ2+d3tRcd0AmHsXEL+a0FpDPdaFjEqZcdR+SrWGWuX/e+r+XYtKIVsmH54CcDyyPhU0Taw+gGHFZ8u5Gp8b9kCXYYi6HRpqpAdWjtl8HekNn5qwvc0tQ/sVRzBW4qmcCap3vouAh+6TI5eHWvj5oziL1TVSB8KB53PRYfGLVoXiJznJYlM7ow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f755d1c-c81c-431f-9db7-08df395277b6
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 02:30:47.1669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9SSc9Fh7ehGjpvNiPb7G5N8Dwla8HargleAq1MpSg6EZlAvKnQoDPwOa19YZ6rhHZlEBmg/YXcaGiNIYunjDpoBt4CghfKh9jH5PKg+AqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8231
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/31/2026 4:10, Umesh Nerlige Ramappa wrote:
> Move the device dependent setup from the main fixture into
> oa_device_init() and the teardown from the final fixture into
> oa_device_fini(), so that the same state can be rebuilt by tests that
> unbind and rebind the device.
>
> oa_device_fini() also closes the sysfs fd, drops the xe device cache
> entry and resets the state, so oa_device_init() can be called again.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tests/intel/xe_oa.c | 81 ++++++++++++++++++++++++++++++---------------
>   1 file changed, 55 insertions(+), 26 deletions(-)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 91d0ad9c4023..07571eeb7e55 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -1332,6 +1332,59 @@ init_sys_info(void)
>   	return true;
>   }
>   
> +/*
> + * Open the xe device and set up all device dependent state. Also used to restore that
> + * state after the device has been unbound and rebound.
> + */
> +static void oa_device_init(void)
> +{
> +	struct xe_device *xe_dev;
> +
> +	igt_assert_eq(drm_fd, -1);
In main(), right before calling oa_device_init(), we already have an 
assert to check if the device is already open or not.  Having both of 
them seems to be redundant to me, maybe since we're moving everything 
init() related to here, might as well remove that call from there?  Will 
point the call below in the review itself.
> +
> +	drm_fd = drm_open_driver(DRIVER_XE);
> +	xe_dev = xe_device_get(drm_fd);
> +
> +	/* See xe_query_oa_units_new() */
> +	igt_require(xe_dev->oa_units);
> +	igt_require(xe_dev->oa_units->num_oa_units);
> +
> +	devid = intel_get_drm_devid(drm_fd);
> +	sysfs = igt_sysfs_open(drm_fd);
> +
> +	/* Currently only run on Xe2+ */
> +	igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
> +
> +	igt_require(init_sys_info());
> +
> +	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
> +
> +	render_copy = igt_get_render_copyfunc(drm_fd);
> +}
> +
> +/* Release all device dependent state set up by oa_device_init() */
> +static void oa_device_fini(void)
> +{
> +	/* leave sysctl options in their default state... */
> +	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
> +
> +	if (intel_xe_perf) {
> +		intel_xe_perf_free(intel_xe_perf);
> +		intel_xe_perf = NULL;
> +	}
> +
> +	if (sysfs >= 0) {
> +		close(sysfs);
> +		sysfs = -1;
> +	}
> +
> +	if (drm_fd >= 0) {
> +		xe_device_put(drm_fd);
> +		drm_close_driver(drm_fd);
> +		drm_fd = -1;
> +	}
> +}
> +
>   /**
>    * SUBTEST: non-system-wide-paranoid
>    * Description: CAP_SYS_ADMIN is required to open system wide metrics, unless
> @@ -4970,7 +5023,6 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>   		{ NULL },
>   	};
>   	const struct drm_xe_oa_unit *oau0, *oau;
> -	struct xe_device *xe_dev;
>   
>   	igt_fixture() {
>   		struct stat sb;
> @@ -4995,25 +5047,8 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>   		igt_assert_eq(drm_fd, -1);

This call above ^ is the one I talked about in comment at the start.

Apart from this,

the patch LGTM, and with that,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

>   
>   		enable_trace_log();
> -		drm_fd = drm_open_driver(DRIVER_XE);
> -		xe_dev = xe_device_get(drm_fd);
> -
> -		/* See xe_query_oa_units_new() */
> -		igt_require(xe_dev->oa_units);
> -		igt_require(xe_dev->oa_units->num_oa_units);
> +		oa_device_init();
>   		oau0 = oa_unit_by_id(drm_fd, 0);
> -
> -		devid = intel_get_drm_devid(drm_fd);
> -		sysfs = igt_sysfs_open(drm_fd);
> -
> -		/* Currently only run on Xe2+ */
> -		igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
> -
> -		igt_require(init_sys_info());
> -
> -		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
> -
> -		render_copy = igt_get_render_copyfunc(drm_fd);
>   	}
>   
>   	igt_subtest("non-system-wide-paranoid")
> @@ -5222,13 +5257,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>   	}
>   
>   	igt_fixture() {
> -		/* leave sysctl options in their default state... */
> -		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
> -
> -		if (intel_xe_perf)
> -			intel_xe_perf_free(intel_xe_perf);
> -
> -		drm_close_driver(drm_fd);
> +		oa_device_fini();
>   		disable_trace_log();
>   	}
>   }

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

