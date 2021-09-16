Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E3B6EB2F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 09:47:47 +0000 (UTC)
References: <20210916081029.885986-1-priyanka.dandamudi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <641b44eb-fbc8-7d7a-1cb7-a749237b5ff2@intel.com>
Date: Thu, 16 Sep 2021 10:47:42 +0100
MIME-Version: 1.0
In-Reply-To: <20210916081029.885986-1-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/prime_vgem: use device_coherent
 mmap
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 16/09/2021 09:10, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Update mmap__wc with mmap__device_coherent, as it works
> on discrete platforms, while still using an explicit WC mmap on
> integrated platforms.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
