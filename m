Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666946E9CB
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2020 11:19:01 +0000 (UTC)
Date: Fri, 10 Jan 2020 13:18:57 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200110111857.wjise2loyvoqp5ko@ahiler-desk1.fi.intel.com>
References: <20191205130246.21695-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205130246.21695-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] runner: Ensure generated json is
 properly UTF8-encoded
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 05, 2019 at 03:02:45PM +0200, Petri Latvala wrote:
> Sometimes tests output garbage (e.g. due to extreme occurrences of
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/55) but we
> need to present the garbage as results.
> 
> We already ignore any test output after the first \0, and for the rest
> of the bytes that are not directly UTF-8 as-is, we can quite easily
> represent them with two-byte UTF-8 encoding.
> 
> libjson-c already expects the string you feed it through
> json_object_new_string* functions to be UTF-8.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

the series is:
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Added this series as an example here:
https://gitlab.freedesktop.org/patchwork-fdo/patchwork-fdo/issues/34
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
