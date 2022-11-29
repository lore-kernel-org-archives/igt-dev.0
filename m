Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D6410E100
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 20:21:15 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ha10so36615628ejb.3
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 12:21:15 -0800 (PST)
Message-ID: <d4e9db25-8be7-45b7-601a-b3ac64707d46@gmail.com>
Date: Tue, 29 Nov 2022 22:21:04 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
References: <20221129083427.2687430-1-petri.latvala@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20221129083427.2687430-1-petri.latvala@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Reset disk usage tracking on
 subtest change
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 29.11.2022 10.34, Petri Latvala wrote:
> Disk space usage tracking is supposed to be per (dynamic)
> subtest. Remember to reset the usage tracker when subtest changes.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   runner/executor.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 2feef2c9..d2253082 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1101,7 +1101,6 @@ static int monitor_output(pid_t child,
>   				}
>   
>   				write_packet_with_canary(outputs[_F_SOCKET], packet, settings->sync);
> -				disk_usage += packet->size;
>   
>   				/*
>   				 * runner sends EXEC itself before executing
> @@ -1112,8 +1111,12 @@ static int monitor_output(pid_t child,
>   					socket_comms_used = true;
>   
>   				if (packet->type == PACKETTYPE_SUBTEST_START ||
> -				    packet->type == PACKETTYPE_DYNAMIC_SUBTEST_START)
> +				    packet->type == PACKETTYPE_DYNAMIC_SUBTEST_START) {
>   					time_last_subtest = time_now;
> +					disk_usage = 0;
> +				}
> +
> +				disk_usage += packet->size;
>   
>   				if (settings->log_level >= LOG_LEVEL_VERBOSE) {
>   					runnerpacket_read_helper helper = {};
