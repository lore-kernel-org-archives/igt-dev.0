Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C42412BC44
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 08:01:31 +0000 (UTC)
Message-ID: <e08f6c1a-aa7e-8190-49c6-e1d4e40eb5fa@intel.com>
Date: Thu, 7 Jul 2022 09:01:25 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20220706120143.1268-1-nirmoy.das@intel.com>
 <20220706175912.6983-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220706175912.6983-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] i915/gem_exec_capture: fix
 needs_recoverable_ctx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 06/07/2022 18:59, Nirmoy Das wrote:
> needs_recoverable_ctx() should check for graphics_ver instead of
> display_ver. Use intel_graphics_ver() now that we have it.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6356
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
