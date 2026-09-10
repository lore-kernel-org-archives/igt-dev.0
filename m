Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC89BC79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 11:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800E710E0A7;
	Thu, 10 Sep 2026 11:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcAna4gU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7519589E36
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 11:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789041360; x=1820577360;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=u9lc2Mbo52Nsg1av6w4IcdXmpx/ja4Gn0UHKUWIkmHw=;
 b=fcAna4gUa6iOAyC2h6+VtsRBNf7FCXF7MDZEzHLAXPZ4G6yBnNaDUNOH
 6I61RnkYerWPd/a5+b+Cthzw3FNDCg/f8qi+Rrk3ZXG9meaj6noEb4VMJ
 12MTQM0c8RL4CXTmbrbBib7kbQ/S8U3jktPVske/ZTg0L10Q4lC+D9Ffi
 Q1yAeCvaIqOKn9GvJrgXxmv5S7iYW6i/MmbTGLhilPM5VggSIcz5Ekivd
 Io9ZUfQmebDCHALIxBzf2C60zkIZtnZc1OkRehKhGAwq1SRco7Ua4c1Gn
 aMfEq9H2i/RZ2YXjpKiI1UcajNDNqbaG7zKCHPghtaWbwN3PLpK0acaAR Q==;
X-CSE-ConnectionGUID: f1uCBgWEQTCTOg1sBF3QSA==
X-CSE-MsgGUID: gNs/iDzfQQuF53nbFijNKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106857720"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="106857720"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:55:59 -0700
X-CSE-ConnectionGUID: ZAMNtDJjSLmELtlaEXtycQ==
X-CSE-MsgGUID: g3PWeqPkSfqaGKG3W5m7Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="275762087"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:55:59 -0700
Date: Thu, 10 Sep 2026 13:55:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] man: Make man pages reproducible
Message-ID: <20260910115556.lnlh4agtohxzpy52@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260909111551.48722-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909111551.48722-1-kamil.konieczny@linux.intel.com>
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

Hi igt-dev,
On 2026-09-09 at 13:15:51 +0200, Kamil Konieczny wrote:
> Man pages are compressed by gzip and default options write to
> archive file a timestamp, which leads to different binaries when
> generated again after some time.   Do not save timestamp in
> archive and make building man pages reproducible.
> 
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/194
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  man/rst2man.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/man/rst2man.sh b/man/rst2man.sh
> index b7f289910..f7afcab37 100755
> --- a/man/rst2man.sh
> +++ b/man/rst2man.sh
> @@ -14,4 +14,6 @@ cp "$input" "$out_dir"
>  ${rst2man} "$out_dir/$in_file" "${output%.gz}"
>  
>  rm -f "${output}"
> -gzip "${output%.gz}"
> +# Do not save timestamp in generated file, so it will be the same binary file
> +# when generated again after some time.
> +gzip --no-name "${output%.gz}"
> -- 
> 2.55.0
> 

I will write here some hints how to test this.
I used following script:

cat mancmp.sh
#!/bin/sh
#
# compare igt-dev man pages after  building them two times

echo "First build"
rm -fR build
./meson.sh > /dev/null 2>&1
mv build/man first

echo "Second build with different time"
sleep 1

rm -fR build
./meson.sh > /dev/null 2>&1
mv build/man second

echo "Comparing..."
cd first

for x in *gz ; do
	        cmp $x ../second/$x
done

cd -
echo "done"

Without above change result was:

/tmp/igt-gpu-tools$ ./mancmp.sh
First build
Second build with different time
Comparing...
intel_audio_dump.1.gz ../second/intel_audio_dump.1.gz differ: byte 5, line 1
intel_bios_dumper.1.gz ../second/intel_bios_dumper.1.gz differ: byte 5, line 1
intel_error_decode.1.gz ../second/intel_error_decode.1.gz differ: byte 5, line 1
intel_gpu_frequency.1.gz ../second/intel_gpu_frequency.1.gz differ: byte 5, line 1
intel_gpu_top.1.gz ../second/intel_gpu_top.1.gz differ: byte 5, line 1
intel_gtt.1.gz ../second/intel_gtt.1.gz differ: byte 5, line 1
intel_infoframes.1.gz ../second/intel_infoframes.1.gz differ: byte 5, line 1
intel_lid.1.gz ../second/intel_lid.1.gz differ: byte 5, line 1
intel_panel_fitter.1.gz ../second/intel_panel_fitter.1.gz differ: byte 5, line 1
intel_reg.1.gz ../second/intel_reg.1.gz differ: byte 5, line 1
intel_stepping.1.gz ../second/intel_stepping.1.gz differ: byte 5, line 1
intel_upload_blit_large.1.gz ../second/intel_upload_blit_large.1.gz differ: byte 5, line 1
intel_upload_blit_large_gtt.1.gz ../second/intel_upload_blit_large_gtt.1.gz differ: byte 5, line 1
intel_upload_blit_large_map.1.gz ../second/intel_upload_blit_large_map.1.gz differ: byte 5, line 1
intel_upload_blit_small.1.gz ../second/intel_upload_blit_small.1.gz differ: byte 5, line 1
intel_vbt_decode.1.gz ../second/intel_vbt_decode.1.gz differ: byte 5, line 1
lsgpu.1.gz ../second/lsgpu.1.gz differ: byte 5, line 1
/tmp/igt-gpu-tools
done


after applying above, there was no difference in .gz pages:

./mancmp.sh 
First build
Second build with different time
Comparing...
/tmp/igt-gpu-tools
done


Regards,
Kamil

