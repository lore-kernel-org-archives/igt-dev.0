Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D9210E2AC
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 14:33:39 +0000 (UTC)
Message-ID: <da23ca23-fb18-e98b-aaf8-80ab0a18aa81@intel.com>
Date: Mon, 31 Jul 2023 20:02:52 +0530
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230622054543.3360732-2-jouni.hogander@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230622054543.3360732-2-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t, v6,
 1/4] tests/i915/kms_frontbuffer_tracking: Split fbc into library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 6/22/2023 11:15 AM, Jouni Högander wrote:
> Split fbc handling into library to be used by other tests as well.
>
> v3: Add library function descriptions
> v2: Moved into libigt instead of static kms_fbc_helper
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> 	if (t->feature & FEATURE_DRRS)
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
