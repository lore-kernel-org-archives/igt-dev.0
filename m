Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A7D6E907
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2020 10:44:32 +0000 (UTC)
Date: Wed, 15 Jan 2020 12:44:24 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200115104424.erb53mg6eru6ppm4@ahiler-desk1.fi.intel.com>
References: <20200110120642.19844-1-petri.latvala@intel.com>
 <20200110120642.19844-3-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110120642.19844-3-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] runner/json_tests: Test handling
 of unprintable output from tests
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

On Fri, Jan 10, 2020 at 02:06:42PM +0200, Petri Latvala wrote:
> A simple test output with numbers from 1 to 255, both in plain text
> form and as a single byte with that particular value.
> 
> Note that the json spec doesn't require \u-encoding for characters
> other than '"', '\' and the range U+0000 to U+001F, the raw
> non-\u-encoded UTF-8 in the reference.json file for bytes 128 and up
> is what libjson-c outputs for those codepoints and is valid.
> 
> The validity of the json file can be verified with iconv, i.e.
> 
>  $ iconv -f UTF-8 reference.json -o /dev/null && echo it is utf-8
> 
> v2: Rebase over dynamic subtest tests, trivial
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com> #v1

still looks good, and patchwork still does not like it... someday I'll
get to fixing the diff parsing logic and probably break other edge cases
in the process :-P

since gitlab's pipeline is passing feel free to merge it

Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
