Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BAECA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 14:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E061D10E676;
	Tue, 26 Aug 2025 14:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0+v4VET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31C810E676
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756218848; x=1787754848;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=SGXiXRx7qLJyNWxkiStFWpyWFu9krMcs6z9nj6aZVDs=;
 b=c0+v4VETxddgdQnjtZmevE2n6heJ/5YLutwxk2cEUW2ivf/aXFWedEoF
 Vs+yGea6EoGG+rXKpxNdXb7gvnf2UKvdz5SBy458tciKpLwlI7/yu17ij
 cUQ+Twj2q+R63e845ompqlylC8O7/WLZ9YKXMW+1z1YFDwtiRt16YKNR4
 kAzxxE7VzMob8eFw0DF2s8EToRdibmSYbbknHTlydew+WqR5zV/RwVlHd
 QFYFSSxGmi1kuNRXP34k4KSOYXhoyotuaj63VAH+HsftLc2pxg8y8mkZ6
 Ka5QiCUbdNaMlAsR0nvKRMEY4DJ+J/0XI79xUF4VuRgt18FWqo7Pwmk9m A==;
X-CSE-ConnectionGUID: emaZp5ZPS5WYHsQ4r7CutA==
X-CSE-MsgGUID: TMo+D0t+QmWNDspxuviu1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69169388"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69169388"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 07:34:07 -0700
X-CSE-ConnectionGUID: Frg7Gne6Tqe6MpHLzXvTgA==
X-CSE-MsgGUID: rp21hCOVRm2vf/SrCYPxLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="168824248"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 07:34:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 07:34:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 07:34:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.75) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 07:34:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBr5+dOwLSqa1jltnYe2XFQYknIhZMANoZiDCjYzm/SEOv3jNcs6xLhhA/YqXBenF8rpjn7yYn0QwIs9CVxv418ueejt6Z1VsQfgjWd9fk4FsxLYwlSoewJW8SMIacJU42dQ8pEWDGfCpIo2y49lZpH73Z6NHQVHlbmsWQFXI1pQKh6Z04Y8socInY+RpqUfoXSmlZlJV3iyLpqp/V63CHuGxBdR5eiIMDVsOV+znORhQGYfXD9xrhpk7AabahS9HFfSnS5OkpUtquxBT1fVtatv4+YwI4ukXbUCp0Ds+pH6xeP8vLFbkaFp7vqtfmvr23LK+lSNIY21R++WanKlcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyM1/KsJPesUVnGXlQEYkC+GOStjNhtzvZIduqHQqA8=;
 b=UoMJQdkrZTGPTVrY22CCgR7Koa3xbto2MJ1g1pRuW8AEBTE4QVeHhTMH7u97rHjUPSSk+O/vljZYzNLdOCIF8fESb1zzyleogO4oy2YC+RKyR75wmEFMlIGmbCxISR7aLcAT+h2JekNmqp5A0kDXbyGgMisOgnB2ZoHbuxEMbSA5OITMMQg1vtnO1A6ABWbRuUgpniqVvTZSBkPmHaqUPqWlepwfYHpWCx7ZNj3e/Ki2Quk6hE1/mG6FuPbCqFm8BJZVC4DlS8cXxOJmkrsocWVK8VQ3dJwDuxZlKZzq5w1idtHG5KjrWrKU1haJBOlnR7FY68oFAoxgL6kUaHKQlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 14:34:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 14:34:03 +0000
Date: Tue, 26 Aug 2025 09:33:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>, "Vinay
 Belgaumkar" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH i-g-t v2 1/4] tests/intel/xe_configfs: Do not execute
 with open fd
Message-ID: <gaehxf3pxlaryod234l5yaa4nsj7z3q5x7rv7pusdke23inxdp@y7zva7jrhggm>
References: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
 <20250825-configfs-unbind-v2-1-62e7508d3ed7@intel.com>
 <20250826075449.x7h5btakkdxsmaej@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250826075449.x7h5btakkdxsmaej@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: SJ0PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: f0228b24-3477-43bb-c5a1-08dde4ad9aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BoC4lXoIMapAhDm5Pkkgj/WZyBAx+29fuMOwvdRaReI4tXG0P/Dv0gsYCsA5?=
 =?us-ascii?Q?ELKhtCo9TCxqqVE7oeYusVnFHVYaCsNQ+nfXWi+/3+5ylPvjhl1jYtmtGxI9?=
 =?us-ascii?Q?7AA9hDpQpntFW8o4Qbhc5Cdc/j1ie4hjE5oNGxG3OsTVm0SW3RwC9iI0qaWc?=
 =?us-ascii?Q?/gX8FEFX8+HPfNdS5WFL4F4owpyT8HI4cUJhLNlq1+ew7sEc9P1ws6dYA022?=
 =?us-ascii?Q?4sNZ5b636QmjWx0expyzN9IKh7GWoMEr7RB1TTmeEfjws14bzaFVKxTXzC5M?=
 =?us-ascii?Q?0dI5FhBbcKn7CyjYcPxyG8NT4nMlpfCQlAASGB9w346HqiuODIo4lKPxusz7?=
 =?us-ascii?Q?vynyH6wl3q1/uc6iXr/a9S+C+jCB1tOGXvo/ss3nGqV047TgrTr4tkze6sEq?=
 =?us-ascii?Q?hvXruuC7/ZRBjbnkhBCtrcoB/BjCHUao0X2US96sut4684DalasVsu80Jypr?=
 =?us-ascii?Q?0XI1u9Bc613ofBBUsqhdD2PP6ZaJhdqEI+1LyzYI4v3iz9gLnDzdRXL0HlBR?=
 =?us-ascii?Q?Qn79sExa3HdxtM1SroabAmqQGUqY0bNZQnbjadz6nb1iuE8ddcLMRfXSWCww?=
 =?us-ascii?Q?wbocW9pHI9lHqPmsvFAoUZkXW3kYsaOx7Lnes4xx5MwfX1JW46q3fUSUyvT9?=
 =?us-ascii?Q?sXB9lfgp++Gy9b3he/R8uuVymEU+0W4dR0dT2ab1NZDFp60Kv4AKjvK8VDd0?=
 =?us-ascii?Q?TekQ5qv9pzuV8pcm3EjCiDvbUoBDouknYLl3XFfJf6DOo6lJz6mIzKuh24qv?=
 =?us-ascii?Q?eB27Zr4w+2/A3cddP7i4Bj97yzQPjWSeV4e64dVRPiCb/kOK1+3O8tmfD8ql?=
 =?us-ascii?Q?6mwBXMMmgWU+G1c36qUieAht57sL1KH9SoqZpdBtSdp5V1JxUrSE4K1TFw5U?=
 =?us-ascii?Q?jItIkxTZygMga5RWfKQ2OvBx2m00t82PEHvmjFaHNK5Vg8KT0JOfeaJ2F0ps?=
 =?us-ascii?Q?Zrk2DeUU5MhaEyBHOTDK1kFWp1jyjzAE3NX2OfJ9Ow5zeRMsIQE6crYfh/DO?=
 =?us-ascii?Q?V6WqEzv5t2YEokBcOZ9FE7LPXw4RxDwJwd8mQZednPDz5+6qxSPdAmnrrpH3?=
 =?us-ascii?Q?XZhjCf+QuP/6/httj/xDrkcM7BOwaowGz4MYKdWlEdcHTxGFm7HhDNymi2XT?=
 =?us-ascii?Q?SdOscLgGn8WHByDJgNzFnPSIMlHcK0rURPc8fxMTkJBAnFuFq4d/RPs5OOvB?=
 =?us-ascii?Q?d7F1me05YThohWkkUOl9d3EbMB7KpIxE+KUp4lQ3vSi9hEAuE5OSXpFi2gMO?=
 =?us-ascii?Q?YnWIOMOzQf9FbrmhRCiIMJNAyzIVZArT1jYoUruzVJtL43MQyd0YREZorIF4?=
 =?us-ascii?Q?6BqCcQ+n29bqdVYikJJOe2F+2zzdL+nWwnbjct1Uc3trRYqpIRN27bQyqueT?=
 =?us-ascii?Q?atcs9yTSokzGs/wcQAHvWcWx1eGOjD9/4FOKS2ERfnnrBMHT1cOIg5D0tTds?=
 =?us-ascii?Q?2y+Xn3MXC+s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LFyWzcpfzv7YwH2DbVYEKbnggAQzReWKU70s/E/w8awiS6+IlJJkO8daBUM2?=
 =?us-ascii?Q?OgRe3r4uy0ZW3au2SpS38zUduUfHPtAOZ8OkJDCXIJHb+LfYsUzqwRnd+NPA?=
 =?us-ascii?Q?MUhaUvomHlDFDm10tXVKFXfFJGeqx1U6zxtHsQM2DwtYWTTewwBGG8hZZUhM?=
 =?us-ascii?Q?r5xxFHLXG1hvQ1eXkYeOnDEo1vcqgx9rdENW7pQbmywLY84TrgE/SbtqRqm1?=
 =?us-ascii?Q?nyivBlPg7ndzhU8f2itgEAWOVoQAdIZqWRB5QCw+jHJgx2bWXhOJvC6ELKSW?=
 =?us-ascii?Q?lUhOZPCQW5K9zp2YSqXdavK9Fh8N7vj/3/x6kdSgSuxYFl7ZI5a22t2ccwMG?=
 =?us-ascii?Q?UneNBis4SJoM4d3pPoolUAJjb1dD/ZGladQuP259vPLUM6D+z6Pli0o1qk3Q?=
 =?us-ascii?Q?PVVQ9Nl+jVl82Z/TXCT7TXABe0K+NzcZ78f7Hfuu9QJtcUmPIq480oOCelmS?=
 =?us-ascii?Q?vA+OBOr2rwZfBAeMAoVBSvDXB89hNc6NDKqnjE+0pyKJD32z07GL3SxQj6v+?=
 =?us-ascii?Q?YsmP34JxLWXVDIzQ4NpDTSZs/C7TZGCSgSduQB+rRVY6dvO3N0FXocAhpZdE?=
 =?us-ascii?Q?H31HicFZ3ggs/bJ1UB9GXNvt9zFNvzrEXGRlr/OPsREwoH9VEl7L7G72yo7M?=
 =?us-ascii?Q?NsiYTy6phGYEWe9Bdz8JxWEaXPQm+QOw3yqF//p/iwATjQSqz5z2R7AXp4gy?=
 =?us-ascii?Q?fM5VDM5cdAsyJXeBk3FYZwyJeJoAvTbFL0LB/MoD/zRAzccabzz0qpDXZUr3?=
 =?us-ascii?Q?i5IexK8mgKgSB2pxPlmDRx33PsVf9+OeEdSozqIpTzJkRUJYQ2HjAwOzZE95?=
 =?us-ascii?Q?vyKle2HVGJWrjNQ+pDdA09uCdz1j084jAhbKRlzFnIkkFBl+uBGQzXvnO5fO?=
 =?us-ascii?Q?namEpTOJE4i8J/uyEdQgM3Yh0FPmCEupkMrpv7m2W67ukX3HTcpO7Ce1kAbC?=
 =?us-ascii?Q?ufXV5TimmZzbbfv0uLQnE0aBp1hu5bI0w9ddhgNnMI2v7V8Zhxo0QLcaSuRx?=
 =?us-ascii?Q?F7AaAP15arXJ2OiR0pmyX9J8SziB1WmUnDZqtcmZPjUzD1kirpiRKGesat6n?=
 =?us-ascii?Q?tbccAsihcxRh04bTJPf3TS5nfezcsPsCax9kFrMYTN2YF+tLWJV3EJBtE2dV?=
 =?us-ascii?Q?sFXKBklIk2dQUjhlnewQ0+0VeERndpWaCOBQea0KUPhYxfQ9jJL5CIWfAhZz?=
 =?us-ascii?Q?9w/9XfirENJ0vjo57dZuKqrCmbg4Xdhi5cO6E/IUjWaZ8j6Hj2crYVOIO1Ef?=
 =?us-ascii?Q?iQsSLVSIpZs1pZ4YzIRRibGG0+FkFLiAMXCkuCFM4G5RjjTIMbB0CT37NJTa?=
 =?us-ascii?Q?sEcZ53WkeMvh3XKeL76+6Et6ZVKVRFIMxQpwgg76xKmgFoMgUST16iw8Xff8?=
 =?us-ascii?Q?3YharDAwM16npS8h4qnMW11LfEq9ZiS9q1RzX2a/PE7t4vRkbgXH2lz0N+Zz?=
 =?us-ascii?Q?fMhGBQBkhj8bX/V8Zplc+LVMaVvkEAZgM+xIDvjkoyEp7Eda4juzfGDNgAe2?=
 =?us-ascii?Q?WxCnVIXOvNzh7TnX4C36w4ASBxp/P3RUWVK9C+vBnm2edfEvkxp4NONbHH72?=
 =?us-ascii?Q?yYn1XL5KcxEnfu3wjyimg8r8si7elsdjZjUm36Pn7IcAC1iYvw6dP/EB+c3q?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0228b24-3477-43bb-c5a1-08dde4ad9aa8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 14:34:03.3766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qC0IU7NfvUMem7Iqd9/FsGMUZLFYubUv+VHABNvl6S+WuSB9BdlsVSIc14JUAVXVYbpvRD7NAmJp+t0JF/nKrplGu2XJHpwVihCF9pW3Lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
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

On Tue, Aug 26, 2025 at 09:54:49AM +0200, Kamil Konieczny wrote:
>Hi Lucas,
>On 2025-08-25 at 08:59:43 -0700, Lucas De Marchi wrote:
>> The survivability_mode test does an unbind/set-configfs/bind sequence.
>> If and fd is open, that will still refer to the old instance of the
>> driver and is a dangling fd. Close it right when it's not needed anymore
>> as in future other tests will also unbind/bind.
>>
>> While moving this code around, also make sure to use drm_close_driver()
>> so the fd is dropped from the cache.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>See one nit below not related to your change.
>
>> ---
>> v2:
>> - Use drm_close_driver()  (Kamil)
>> ---
>>  tests/intel/xe_configfs.c | 20 ++++++++++++++------
>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>> index 5c65cd01d..57f770b0b 100644
>> --- a/tests/intel/xe_configfs.c
>> +++ b/tests/intel/xe_configfs.c
>> @@ -101,15 +101,19 @@ static void test_engines_allowed(int configfs_device_fd)
>>  	}
>>  }
>>
>> -static int create_device_configfs_group(int configfs_fd, int fd)
>> +static void set_bus_addr(int fd)
>>  {
>> -	int configfs_device_fd;
>>  	struct pci_device *pci_dev;
>> -	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
>>
>>  	pci_dev = igt_device_get_pci_device(fd);
>>  	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
>>  		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>> +}
>> +
>> +static int create_device_configfs_group(int configfs_fd)
>> +{
>> +	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
>> +	int configfs_device_fd;
>>
>>  	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
>>  	igt_assert(configfs_device_fd);
>
>imho this assert should be igt_require? note that it is in

it's expected to fail if it can't create that dir

>an igt_fixup or function should just return it and leave
>assert/require to a test.

but this is just making a common part of the tests into a helper
function. I'd agree with this if this function was in
lib/igt_configfs.[ch].

>Also if create_dir fails, will this value be -1 or -errno
>so assert will not catch it.

yes, this looks wrong.

thanks
Lucas De Marchi
