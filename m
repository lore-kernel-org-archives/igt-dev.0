Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3246C6ED72
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Oct 2021 08:56:40 +0000 (UTC)
References: <20210930052124.980259-1-priyanka.dandamudi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <89e500f2-6452-607a-c8bc-73b5eedae1bf@intel.com>
Date: Fri, 1 Oct 2021 09:55:05 +0100
MIME-Version: 1.0
In-Reply-To: <20210930052124.980259-1-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_nop: Update poll
 sequential
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

On 30/09/2021 06:21, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> The set_caching ioctl returns -ENODEV for discrete.
> So,updated the poll sequential test case accordingly.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
