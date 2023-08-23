Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1AB10E422
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 13:34:06 +0000 (UTC)
Message-ID: <089b8e15-0736-d81c-6ef8-f6934ffdbb16@intel.com>
Date: Wed, 23 Aug 2023 19:04:01 +0530
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230822094035.3424673-2-jouni.hogander@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230822094035.3424673-2-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t,v8,1/4] lib/i915/fbc: Add fbc helpers
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


On 8/22/2023 3:10 PM, Jouni Högander wrote:
> Add some fbc helpes into a library to be used by kms_frontbuffer_tracking
> and other tests as well.
>
> v4: Split testcase modification into a separate patch
> v3: Add library function descriptions
> v2: Moved into libigt instead of static kms_fbc_helper
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
